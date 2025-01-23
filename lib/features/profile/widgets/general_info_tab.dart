import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/widgets/build_details_row.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralInfoTab extends StatelessWidget {
  const GeneralInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final member = profileController.profileDetails?.data?.member;

      if (member == null) {
        return const Center(child: Text("No data available"));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                child: CustomNetworkImage(
                  image: member.photo ?? '',
                  height: 150, width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 5),

            Center(
              child: Text(
                member.name ?? 'N/A',
                style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeEighteen),
              ),
            ),
            const SizedBox(height: 5),

            Center(
              child: Text(
                member.status?.toUpperCase() ?? '',
                style: poppinsRegular.copyWith(
                  fontSize: Dimensions.fontSizeFourteen,
                  color: member.status == 'active' ? AppColors.green : AppColors.red,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              'Member Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'Member ID', value: member.memberType),
                BuildDetailsRow(title: 'Member Name', value: member.name),
                BuildDetailsRow(title: 'Gender', value: member.gender),
                BuildDetailsRow(title: 'Mobile', value: member.mobile),
                BuildDetailsRow(title: 'Email', value: member.email),

              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Address Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'Present Address', value: member.presentAddress),
                BuildDetailsRow(title: 'Permanent Address', value: member.permanentAddress),
              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Land Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'Quantity of Land(Kh.)', value: member.landQty),
                BuildDetailsRow(title: 'Total Land', value: member.totalLand),
              ]),
            ),
            const SizedBox(height: 16),

            Text(
              'Other Information',
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
            ),
            const SizedBox(height: 5),

            CustomCard(
              child: Column(children: [
                BuildDetailsRow(title: 'NID Number', value: member.nidNumber?.toString()),
                BuildDetailsRow(title: 'Name of Power', value: member.nameOfPower),
                BuildDetailsRow(title: 'Remarks', value: member.remarks),
                BuildDetailsRow(title: 'Member Since', value: member.memberSine),
              ]),
            ),
          ],
        ),
      );
    });
  }
}