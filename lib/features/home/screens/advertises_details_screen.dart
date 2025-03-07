import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AdvertisesDetailsScreen extends StatefulWidget {
  final int advertisesId;
  const AdvertisesDetailsScreen({super.key, required this.advertisesId});

  @override
  State<AdvertisesDetailsScreen> createState() => _AdvertisesDetailsScreenState();
}

class _AdvertisesDetailsScreenState extends State<AdvertisesDetailsScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    HomeController homeController = Get.find<HomeController>();
    homeController.getAdvertiseDetails(widget.advertisesId).then((_) {
      if (homeController.advertisesDetails?.video != null) {
        _videoController = VideoPlayerController.network(homeController.advertisesDetails!.video!)
          ..initialize().then((_) {
            setState(() {});
            _videoController.play();
          });
      }
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Advertises Details'),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return homeController.advertisesDetails != null
            ? SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (homeController.advertisesDetails?.video != null)
                _videoController.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
                    : const Center(child: CircularProgressIndicator())
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusEight),
                  child: CustomNetworkImage(
                    image: homeController.advertisesDetails?.image ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: Dimensions.paddingSizeTwenty),
              Text(homeController.advertisesDetails?.title ?? '',
                  style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty)),
              const SizedBox(height: Dimensions.paddingSizeTen),
              Html(data: homeController.advertisesDetails?.description ?? ''),
            ],
          ),
        )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}