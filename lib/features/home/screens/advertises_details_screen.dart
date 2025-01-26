import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertisesDetailsScreen extends StatefulWidget {
  final int advertisesId;
  const AdvertisesDetailsScreen({super.key, required this.advertisesId});

  @override
  State<AdvertisesDetailsScreen> createState() => _AdvertisesDetailsScreenState();
}

class _AdvertisesDetailsScreenState extends State<AdvertisesDetailsScreen> {

  @override
  void initState() {
    super.initState();
    HomeController homeController = Get.find<HomeController>();
    homeController.getAdvertiseDetails(widget.advertisesId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Advertises Details'),
      body: GetBuilder<HomeController>(builder: (homeController) {

          return homeController.advertisesDetails != null ? SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusEight),
                  child: CustomNetworkImage(
                    image: homeController.advertisesDetails?.image ?? '',
                    height: 200, width: double.infinity, fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeTwenty),

                Text(homeController.advertisesDetails?.title ?? '', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty)),
                const SizedBox(height: Dimensions.paddingSizeTen),

                Text(homeController.advertisesDetails?.description ?? '', style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSixteen)),

              ],
            ),
          ) : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
