import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TenantTab extends StatelessWidget {
  const TenantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final tenant = profileController.profileDetails?.data?.tenants;

      return Column(
        children: [
          tenant != null && tenant.isNotEmpty ? Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              itemCount: tenant.length,
              itemBuilder: (context, index) {
                final tenants = tenant[index];

                return CustomCard(
                  margin: EdgeInsets.only(bottom: index == tenant.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                          child: CustomNetworkImage(
                            image: tenants.photo ?? '',
                            width: 100, height: 105,
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildDetailRow('Name:', tenants.name),
                              buildDetailRow('Mobile No:', tenants.mobile),
                              buildDetailRow('Relation:', tenants.email),
                              buildDetailRow('Gender:', tenants.gender),
                            ],
                          ),
                        ),
                      ]),

                    ],
                  ),
                );
              },
            ),
          ) : const Expanded(child: Center(child: Text("No tenant information available."))),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(RoutesName.getAddTenantScreen());
                },
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.add, color: AppColors.white),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title ', style: poppinsRegular.copyWith(color: AppColors.grey),
          ),
          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: AppColors.grey), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }

}