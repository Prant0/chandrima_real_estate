import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatefulWidget {
  final String redirectUrl;
  final String paymentId;
  const PaymentScreen({super.key, required this.redirectUrl, required this.paymentId});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  bool _isLoading = true;
  final bool _canRedirect = true;
  PullToRefreshController? pullToRefreshController;
  InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    pullToRefreshController = GetPlatform.isWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform) ? null : PullToRefreshController(
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          webViewController?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        _exitApp();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: '', onBackPressed: () => _exitApp(), backButton: true),
        body: GetBuilder<PaymentController>(builder: (paymentController) {
          return Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(url: WebUri(widget.redirectUrl)),
                initialUserScripts: UnmodifiableListView<UserScript>([]),
                pullToRefreshController: pullToRefreshController,
                initialSettings: InAppWebViewSettings(
                  isInspectable: kDebugMode,
                  mediaPlaybackRequiresUserGesture: false,
                  allowsInlineMediaPlayback: true,
                  iframeAllow: "camera; microphone",
                  iframeAllowFullscreen: true,
                ),
                onWebViewCreated: (controller) async {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) async {
                  if (kDebugMode) {
                    print('onLoadStart===========>>: $url');
                  }
                  paymentController.paymentRedirect(
                    url: url.toString(), canRedirect: _canRedirect, paymentId: widget.paymentId, onClose: (){},
                  );
                  setState(() {
                    _isLoading = true;
                  });
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  Uri uri = navigationAction.request.url!;
                  if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                      return NavigationActionPolicy.CANCEL;
                    }
                  }
                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  if (kDebugMode) {
                    print('onLoadStop===========>>: $url');
                  }
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    _isLoading = false;
                  });
                  paymentController.paymentRedirect(
                    url: url.toString(), canRedirect: _canRedirect, paymentId: widget.paymentId, onClose: (){},
                  );
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                },
                onConsoleMessage: (controller, consoleMessage) {
                  debugPrint(consoleMessage.message);
                },
              ),
              _isLoading ? Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
              ) : const SizedBox.shrink(),
            ],
          );
        }),
      ),
    );
  }

  Future<bool?> _exitApp() async {
    return Get.dialog(
      AlertDialog(
        title: const Text('Payment Failed'),
        content: const Text('Your payment was unsuccessful. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

}
