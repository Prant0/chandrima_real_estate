import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FileViewerWebView extends StatefulWidget {
  final String url;

  const FileViewerWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<FileViewerWebView> createState() => _FileViewerWebViewState();
}

class _FileViewerWebViewState extends State<FileViewerWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
