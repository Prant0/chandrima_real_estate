import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class AddTenantScreen extends StatefulWidget {
  const AddTenantScreen({super.key});

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _houseNoController = TextEditingController();
  final TextEditingController _flatNoController = TextEditingController();
  final TextEditingController _advanceRentController = TextEditingController();
  final TextEditingController _rentPerMonthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nidNumberController = TextEditingController();
  String? rentYear = '';
  String? rentMonth = '';

  @override
  void initState() {
    super.initState();
    ProfileController profileController = Get.find<ProfileController>();

    profileController.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Tenant'),

      body: GetBuilder<ProfileController>(builder: (profileController) {
        return Column(

            children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Center(
                    child: Stack(children: [
                  ClipOval(child: profileController.pickedFile != null ? GetPlatform.isWeb ? Image.network(
                      profileController.pickedFile!.path, width: 100, height: 100, fit: BoxFit.cover) : Image.file(
                      File(profileController.pickedFile!.path), width: 100, height: 100, fit: BoxFit.cover) :   CustomNetworkImage(
                    image: '',
                    height: 100, width: 100, fit: BoxFit.cover,
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
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter Email',
                  prefixIcon: TablerIcons.mail,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _houseNoController,
                  hintText: 'Enter House No',
                   prefixIcon: TablerIcons.home,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _flatNoController,
                  hintText: 'Enter Flat No',
                   prefixIcon: TablerIcons.home_2,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _advanceRentController,
                  hintText: 'Advance Rent Amount',
                   prefixIcon: TablerIcons.moneybag,
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _rentPerMonthController,
                  hintText: 'Rent Per Month',
                   prefixIcon: Icons.money,
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Enter Full Address',
                   prefixIcon: Icons.sticky_note_2_outlined,
                  inputType: TextInputType.multiline,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _nidNumberController,
                  hintText: 'Enter NID Number',
                   prefixIcon: Icons.confirmation_number_outlined,
                  inputType: TextInputType.multiline,
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
                      child: Text(rentYear!.isEmpty ? 'Select Rent Date' : "Month : $rentMonth, Year : ${rentYear!}", style: poppinsRegular.copyWith(color: AppColors.black, fontSize: 15)),
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
                              rentMonth = value.month.toString();
                              rentYear = '${value.year}';
                            });
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                  ]),
                ),
               /* const SizedBox(height: 15),

                CustomDropdownButton(
                  hintText: 'Select Relation',
                  items: const ['Owner Family', 'Care Taker', 'Driver', 'Buya'],
                  onChanged: (value) {
                    profileController.setSelectedRelation(value!);
                  },
                  selectedValue: profileController.selectedRelation,
                ),*/
                SizedBox(height: 15),
                Text("NID Front Image", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 17)),
                SizedBox(height: 10),
                Center(
                    child: Stack(children: [
                      profileController.pickedNidFront != null ? GetPlatform.isWeb ? Image.network(
                          profileController.pickedNidFront!.path, width: 200, height: 150, fit: BoxFit.cover) : Image.file(
                          File(profileController.pickedNidFront!.path), width: 200, height: 150, fit: BoxFit.cover) :   CustomNetworkImage(
                        image: '',
                        height: 150, width: 200, fit: BoxFit.cover,
                      ),

                      Positioned(
                        bottom: 0, right: 0, top: 0, left: 0,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => profileController.pickNidFrontImage(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.2),
                              border: Border.all(width: 1, color: AppColors.primary),
                            ),
                            child: profileController.pickedNidFront != null ? const SizedBox() : Container(
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
                SizedBox(height: 15),
                Text("NID Rare Image", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 17)),
                SizedBox(height: 10),
                Center(
                    child: Stack(children: [
                      profileController.pickedNidRare != null ? GetPlatform.isWeb ? Image.network(
                          profileController.pickedNidRare!.path, width: 200, height: 150, fit: BoxFit.cover) : Image.file(
                          File(profileController.pickedNidRare!.path), width: 200, height: 150, fit: BoxFit.cover) :   CustomNetworkImage(
                        image: '',
                        height: 150, width: 200, fit: BoxFit.cover,
                      ),

                      Positioned(
                        bottom: 0, right: 0, top: 0, left: 0,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => profileController.pickNidRareImage(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.2),
                              border: Border.all(width: 1, color: AppColors.primary),
                            ),
                            child: profileController.pickedNidRare != null ? const SizedBox() : Container(
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

              ]),
            ),
          ),





          CustomCard(
            padding: Dimensions.paddingSizeFifteen,
            child: CustomButton(
              isLoading: profileController.isLoading,
              buttonText: 'Add Tenant',
              onPressed: () {
                profileController.addTenant(
                    name: _nameController.text.toString(),
                    mobile: _phoneController.text.toString(),
                    email: _emailController.text.toString(),
                    houseNumber: _houseNoController.text.toString(),
                    flatNo: _flatNoController.text.toString(),
                    advanceRent: _advanceRentController.text.toString(),
                    rentPerMonth: _rentPerMonthController.text.toString(),
                    rentMonth: rentMonth,
                    rentYear: rentYear,
                    address: _addressController.text.toString(),
                    nidNumber: _nidNumberController.text.toString()


                  );
              },
            ),
          ),
        ]);
      }),
    );
  }
}
