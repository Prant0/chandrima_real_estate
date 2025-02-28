import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/gate_pass/controller/gate_pass_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGatePassScreen extends StatefulWidget {
  const AddGatePassScreen({super.key});

  @override
  State<AddGatePassScreen> createState() => _AddGatePassScreenState();
}

class _AddGatePassScreenState extends State<AddGatePassScreen> {
  final TextEditingController _gatePassTypeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _visitPurposeController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _drivingLicenseController = TextEditingController();
  final TextEditingController _paymentMethodController = TextEditingController();
  final TextEditingController _paymentDetailsController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String? entryDate = '';
  String? expiredDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Gate Pass'),
      body: GetBuilder<GatePassController>(builder: (gatePassController) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _gatePassTypeController,
                      hintText: 'Gate Pass Type',
                      prefixIcon: Icons.verified_user,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _phoneController,
                      hintText: 'Phone',
                      prefixIcon: Icons.phone,
                      inputType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _addressController,
                      hintText: 'Address',
                      prefixIcon: Icons.location_on,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _visitPurposeController,
                      hintText: 'Visit Purpose',
                      prefixIcon: Icons.work,
                    ),
                    const SizedBox(height: 15),

                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                      ),
                      child: Row(children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(entryDate!.isEmpty ? 'Entry Date' : entryDate!, style: poppinsRegular.copyWith(color: AppColors.black, fontSize: 15)),
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
                                  entryDate = '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                      ]),
                    ),
                    const SizedBox(height: 15),

                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                      ),
                      child: Row(children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(expiredDate!.isEmpty ? 'Expired Date' : expiredDate!, style: poppinsRegular.copyWith(color: AppColors.black, fontSize: 15)),
                        )),
                        IconButton(
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2200),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  expiredDate = '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
                                });
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                      ]),
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _vehicleTypeController,
                      hintText: 'Vehicle Type',
                      prefixIcon: Icons.directions_car,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _vehicleNumberController,
                      hintText: 'Vehicle Number',
                      prefixIcon: Icons.confirmation_number,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _vehicleModelController,
                      hintText: 'Vehicle Model',
                      prefixIcon: Icons.directions_car,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _drivingLicenseController,
                      hintText: 'Driving License',
                      prefixIcon: Icons.credit_card,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _paymentMethodController,
                      hintText: 'Payment Method',
                      prefixIcon: Icons.payment,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _paymentDetailsController,
                      hintText: 'Payment Details',
                      prefixIcon: Icons.details,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _noteController,
                      hintText: 'Note',
                      prefixIcon: Icons.note,
                    ),
                    const SizedBox(height: 15),

                    Text("Payment Document", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 15)),
                    const SizedBox(height: 10),
                    Center(
                      child: Stack(children: [
                        gatePassController.paymentDocument != null ? GetPlatform.isWeb ? Image.network(
                            gatePassController.paymentDocument!.path, width: 200, height: 150, fit: BoxFit.cover) : Image.file(
                          File(gatePassController.paymentDocument!.path), width: 200, height: 150, fit: BoxFit.cover) : const CustomNetworkImage(
                          image: '',
                          height: 150, width: 200, fit: BoxFit.cover,
                        ),

                        Positioned(
                          bottom: 0, right: 0, top: 0, left: 0,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => gatePassController.pickPaymentDocument(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                border: Border.all(width: 1, color: AppColors.primary),
                              ),
                              child: gatePassController.paymentDocument != null ? const SizedBox() : Container(
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

                      ]),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CustomButton(
                buttonText: 'Add Gate Pass',
                isLoading: gatePassController.isLoading,
                onPressed: () {

                  Map<String, String> data = {
                    'gatepass_type': _gatePassTypeController.text,
                    'name': _nameController.text,
                    'phone': _phoneController.text,
                    'address': _addressController.text,
                    'visit_purpose': _visitPurposeController.text,
                    'entry_date': entryDate!,
                    'expired_date': expiredDate!,
                    'vehicle_type': _vehicleTypeController.text,
                    'vehicle_number': _vehicleNumberController.text,
                    'vehicle_model': _vehicleModelController.text,
                    'driving_license': _drivingLicenseController.text,
                    'payment_method': _paymentMethodController.text,
                    'payment_details': _paymentDetailsController.text,
                    'note': _noteController.text,
                  };

                  if(_gatePassTypeController.text.isEmpty){
                    showCustomSnackBar('Enter Gate Pass Type');
                  }else if(_nameController.text.isEmpty){
                    showCustomSnackBar('Enter Name');
                  }else if(_phoneController.text.isEmpty){
                    showCustomSnackBar('Enter Phone');
                  }else if(_visitPurposeController.text.isEmpty){
                    showCustomSnackBar('Enter Visit Purpose');
                  }else if(entryDate!.isEmpty){
                    showCustomSnackBar('Select Entry Date');
                  }else if(expiredDate!.isEmpty){
                    showCustomSnackBar('Select Expired Date');
                  }else if(_vehicleTypeController.text.isEmpty){
                    showCustomSnackBar('Enter Vehicle Type');
                  } else {
                    gatePassController.addGatePass(data);
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}