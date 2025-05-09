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
import 'package:dropdown_button2/dropdown_button2.dart';
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
  //final TextEditingController _flatNoController = TextEditingController();
  final TextEditingController _advanceRentController = TextEditingController();
  final TextEditingController _rentPerMonthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nidNumberController = TextEditingController();
  final TextEditingController _document1TitleController = TextEditingController();
  final TextEditingController _document2TitleController = TextEditingController();
  String? rentYear = '';
  String? rentMonth = '';
  String? selectedFlatNo = '';

  @override
  void initState() {
    super.initState();
    ProfileController profileController = Get.find<ProfileController>();

    profileController.initData();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Tenant'),

      body: GetBuilder<ProfileController>(builder: (profileController) {
        return Form(
          key: formKey,
          child: Column(

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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    hintText: 'Enter Full Name',
                    prefixIcon: TablerIcons.user,
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
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
                 /* CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your flat number';
                      }
                      return null;
                    },
                    controller: _flatNoController,
                    hintText: 'Enter Flat No',
                     prefixIcon: TablerIcons.home_2,
                    inputType: TextInputType.text,
                  ),*/


                      DropdownButtonFormField2<AllFlatModel>(
                        validator: (value) {
                          if (value == null  ) {
                            return 'Please select a flat number';
                          }
                          return null;
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.grey.withValues(alpha: 0.2),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_drop_down, color: AppColors.black, size: 30),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),

                        hint: const Text('Select Flat No'),
                       // value: selectedFlatNo!.isNotEmpty ? selectedFlatNo : null,
                        items: profileController.profileDetails?.data?.flats
                            ?.map((flat) => DropdownMenuItem<AllFlatModel>(
                          value: flat,
                          child: Text('${flat.flatNo} - (House : ${flat.houseNumber})'), // Display houseNo and flatNo
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFlatNo = value!.id.toString() ?? '';
                          });
                        },
                      ),

                      const SizedBox(height: 15),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter advance rent amount';
                      }
                      return null;
                    },
                    controller: _advanceRentController,
                    hintText: 'Advance Rent Amount',
                     prefixIcon: TablerIcons.moneybag,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter rent per month';
                      }
                      return null;
                    },
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

                  SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Add NID Images (Front & Rare)", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 20))),

                          IconButton(onPressed: (){
                            profileController.pickNidImage();
                          }, icon:Icon(Icons.add_circle_outlined,color: AppColors.primary,size: 33,))
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(

                          child: GridView.builder(
                              itemCount: profileController.nidImages != null ? profileController.nidImages!.length : 1,
                              shrinkWrap: true,
                              physics:   NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  crossAxisCount: 2),
                              itemBuilder: (context,index){
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(children: [
                                    profileController.nidImages != null ? GetPlatform.isWeb ? Image.network(
                                        profileController.nidImages![index].path,  fit: BoxFit.cover) : Image.file(
                                        File(profileController.nidImages![index].path), fit: BoxFit.cover) :   CustomNetworkImage(
                                      image: '', fit: BoxFit.fitHeight,
                                    ),

                                    Positioned(
                                      bottom: 0, right: 0, top: 0, left: 0,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          profileController.pickNidImage();
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black.withValues(alpha: 0.2),
                                            border: Border.all(width: 1, color: AppColors.primary),
                                          ),
                                          child: profileController.nidImages != null ? const SizedBox() : Container(
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

                                    Positioned(
                                      right: 0, top: 0,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: (){
                                          profileController.nidImages!.removeAt(index);
                                          profileController.update();
                                          setState(() {

                                          });
                                        },
                                        child: profileController.nidImages == null ? const SizedBox() :
                                        Container(
                                          margin: const EdgeInsets.all(Dimensions.marginSizeFifteen),

                                          child: const Icon(Icons.remove_circle_outline, color: AppColors.red,size: 30,),
                                        ),
                                      ),
                                    ),

                                  ]),
                                );
                              })

                      ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text("Add Documents 1", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 20)),
                      Spacer(),
                      IconButton(onPressed: (){
                        setState(() {
                          isDocument1=true;
                        });
                        //profileController.pickFile1();
                      }, icon:Icon(Icons.arrow_forward,color: AppColors.primary,size: 33,))
                    ],
                  ),
                  SizedBox(height: 10),



                      Visibility(
                        visible: isDocument1==true,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _document1TitleController,
                              hintText: 'Enter Document 1 Title',
                              prefixIcon: TablerIcons.file,
                              inputType: TextInputType.text,
                            ),

                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Attach Documents",style: poppinsMedium,overflow: TextOverflow.ellipsis,),

                                IconButton(onPressed: (){
                                  profileController.pickFile1();

                                }, icon:
                                Icon(Icons.add_circle_outlined,color: AppColors.primary,size: 33,)),
                              ],
                            ),

                            profileController.document1==null?SizedBox() : Row(
                              children: [
                                Expanded(child: Text("${profileController.document1!.path.split('/').last}",style: poppinsRegular.copyWith(color: AppColors.black,fontSize: 15),overflow: TextOverflow.ellipsis,)),

                                Spacer(),
                                IconButton(onPressed: (){
                                  profileController.removeDocument1();
                                }, icon:Icon(Icons.delete,color: AppColors.red,size: 33,))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),


                      Row(
                        children: [
                          Text("Add Documents 2", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 20)),
                          Spacer(),
                          IconButton(onPressed: (){
                            setState(() {
                              isDocument2=true;
                            });
                            //profileController.pickFile1();
                          }, icon:Icon(Icons.arrow_forward,color: AppColors.primary,size: 33,))
                        ],
                      ),
                      SizedBox(height: 10),



                      Visibility(
                        visible: isDocument2==true,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _document2TitleController,
                              hintText: 'Enter Document 2 Title',
                              prefixIcon: TablerIcons.file,
                              inputType: TextInputType.text,
                            ),

                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Attach Documents",style: poppinsMedium,),

                                IconButton(onPressed: (){
                                  profileController.pickFile2();

                                }, icon:
                                Icon(Icons.add_circle_outlined,color: AppColors.primary,size: 33,)),
                              ],
                            ),

                            profileController.document2==null?SizedBox() : Row(
                              children: [
                                Expanded(child: Text("${profileController.document2!.path.split('/').last}",style: poppinsRegular.copyWith(color: AppColors.black,fontSize: 15),overflow: TextOverflow.ellipsis,)),

                                Spacer(),
                                IconButton(onPressed: (){
                                  profileController.removeDocument1();
                                }, icon:Icon(Icons.delete,color: AppColors.red,size: 33,))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),


                ]),
              ),
            ),





            CustomCard(
              padding: Dimensions.paddingSizeFifteen,
              child: CustomButton(
                isLoading: profileController.isLoading,
                buttonText: 'Add Tenant',
                onPressed: () {

                  if(formKey.currentState!.validate()){
                    profileController.addTenant(
                        name: _nameController.text.toString(),
                        mobile: _phoneController.text.toString(),
                        email: _emailController.text.toString(),
                        houseNumber: _houseNoController.text.toString(),
                        flatNo: selectedFlatNo,
                        advanceRent: _advanceRentController.text.toString(),
                        rentPerMonth: _rentPerMonthController.text.toString(),
                        rentMonth: rentMonth,
                        rentYear: rentYear,
                        address: _addressController.text.toString(),
                        nidNumber: _nidNumberController.text.toString(),
                      document1Title: _document1TitleController.text.toString(),
                      document2Title: _document2TitleController.text.toString(),


                    );
                  }
                },
              ),
            ),
          ]),
        );
      }),
    );
  }

  bool isDocument1=false;
  bool isDocument2=false;
}
