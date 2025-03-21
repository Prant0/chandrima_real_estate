import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/models/profile_model.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class UpdateFamilyMemberScreen extends StatefulWidget {
  final FamilyMembers familyMembers;
  const UpdateFamilyMemberScreen({super.key, required this.familyMembers});

  @override
  State<UpdateFamilyMemberScreen> createState() => _UpdateFamilyMemberScreenState();
}

class _UpdateFamilyMemberScreenState extends State<UpdateFamilyMemberScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? dateOfBirth;

  @override
  void initState() {
    super.initState();
    ProfileController profileController = Get.find<ProfileController>();

    _nameController.text = widget.familyMembers.name ?? '';
    _phoneController.text = widget.familyMembers.mobile ?? '';
    dateOfBirth = widget.familyMembers.birthday ?? '';

    profileController.setSelectedGender(widget.familyMembers.gender!, isUpdate: false);
    profileController.setSelectedRelation(widget.familyMembers.relation!, isUpdate: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Update Family Member'),

      body: GetBuilder<ProfileController>(builder: (profileController) {
        return Column(children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              child: Column(children: [
                Center(child: Stack(children: [
                  ClipOval(child: profileController.pickedFile != null ? GetPlatform.isWeb ? Image.network(
                      profileController.pickedFile!.path, width: 80, height: 80, fit: BoxFit.cover) : Image.file(
                      File(profileController.pickedFile!.path), width: 80, height: 80, fit: BoxFit.cover) : CustomNetworkImage(
                    image: widget.familyMembers.photo ?? '',
                    height: 80, width: 80, fit: BoxFit.cover,
                  )),
                  Positioned(
                    bottom: 0, right: 0, top: 0, left: 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => profileController.pickImage(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.2), shape: BoxShape.circle,
                          border: Border.all(width: 1, color: AppColors.primary),
                        ),
                        child: profileController.pickedFile != null ? const SizedBox() : Container(
                          margin: const EdgeInsets.all(Dimensions.marginSizeFifteen),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: AppColors.white),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ])),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter Full Name',
                  prefixIcon: TablerIcons.user,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'Enter Phone Number',
                  prefixIcon: TablerIcons.phone,
                  inputType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                CustomDropdownButton(
                  hintText: 'Select Gender',
                  items: const ['Male', 'Female', 'Other'],
                  onChanged: (value) {
                    profileController.setSelectedGender(value!);
                  },
                  selectedValue: profileController.selectedGender,
                ),
                const SizedBox(height: 15),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                  ),
                  child: Row(children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text(dateOfBirth ?? 'Select Date of Birth', style: poppinsRegular.copyWith(color: AppColors.black, fontSize: 15)),
                    )),
                    IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              dateOfBirth = '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
                            });
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                  ]),
                ),
                const SizedBox(height: 15),
                CustomDropdownButton(
                  hintText: 'Select Relation',
                  items: const ['Owner Family', 'Care Taker', 'Driver', 'Buya'],
                  onChanged: (value) {
                    profileController.setSelectedRelation(value!);
                  },
                  selectedValue: profileController.selectedRelation,
                ),
              ]),
            ),
          ),
          CustomCard(
            padding: Dimensions.paddingSizeFifteen,
            child: CustomButton(
              isLoading: profileController.isLoading,
              buttonText: 'Update Member',
              onPressed: () {
                String name = _nameController.text;
                String mobile = _phoneController.text;
                profileController.updateFamilyMember(
                  id: widget.familyMembers.id!,
                  name: name,
                  mobile: mobile,
                  dob: dateOfBirth,
                );
              },
            ),
          ),
        ]);
      }),
    );
  }
}
