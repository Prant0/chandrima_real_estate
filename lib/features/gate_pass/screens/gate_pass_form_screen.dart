import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/gate_pass/controller/gate_pass_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GatePassFormScreen extends StatefulWidget {
   GatePassFormScreen({
     this.gatePassType
});
  String ?gatePassType;

  @override
  State<GatePassFormScreen> createState() => _GatePassFormScreenState();
}

class _GatePassFormScreenState extends State<GatePassFormScreen> {
  final TextEditingController _nameController = TextEditingController(  );
  final TextEditingController _phoneController = TextEditingController(  );
  final TextEditingController _addressController = TextEditingController(   );
 final TextEditingController _visitPurposeController = TextEditingController(  );
  final TextEditingController _vehicleNumberController = TextEditingController(   );
  final TextEditingController _vehicleModelController = TextEditingController(  );
  final TextEditingController _paymentDetailsController = TextEditingController( );
  final TextEditingController _noteController = TextEditingController( );

  int selectedGatePassTypeIndex=0;

  String ?visitPurpose;
  String ?_vehicleType;
  String ?_referenceBy;
  String ?_paymentMethod;
  String ?_paymentStatus;

  String? entryDate = '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';
  String? expiredDate = '';
  int ?priceAmount=0;
  var _key = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    priceAmount=null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:   CustomAppBar(title: 'Add Gate Pass'),
      body: GetBuilder<GatePassController>(builder: (gatePassController) {

        return gatePassController.isLoading?Center(child: CircularProgressIndicator()): Form(
          key: _key,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("      Gate Pass Type : ${widget.gatePassType}", style: poppinsRegular.copyWith(color: AppColors.primary, fontSize: 15 ,fontWeight: FontWeight.w600))),
                      ),
                      const SizedBox(height: 15),
                      widget.gatePassType=="Vehicle"?  Column(
                        children: [
                          SizedBox(height: widget.gatePassType!="Vehicle"? 15:0),
                          CustomDropdownButton(
                            hintText: 'Choose Vehicle Type',
                            items:gatePassController.gatePassTypeModel!.data!.vehicleTypes!
                                .where((item) => item.vehicleFor!.toLowerCase() == widget.gatePassType!.toLowerCase())
                                .map((item) => item.name.toString())
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _vehicleType = value.toString();
                                priceAmount=gatePassController.gatePassTypeModel!.data!.vehicleTypes!.firstWhere((element) => element.name==value).price;
                              });
                            },
                            selectedValue: _vehicleType,
                          ),
                        ],
                      ) :const SizedBox(),
                      const SizedBox(height: 15),

                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                        labelText: "Name",
                        controller: _nameController,
                        hintText: 'Name',
                        prefixIcon: Icons.person,
                        showTitle: true,
                        isRequired: true,
                      ),
                      const SizedBox(height: 15),

                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Phone';
                          }
                          return null;
                        },
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
                      SizedBox(height: 15),
                      /*
                      CustomDropdownButton(
                        hintText: 'Reference By',
                        items:[
                          "Member" , "Developer",  "Others"
                        ],
                        onChanged: (value) {
                          setState(() {
                            _referenceBy = value.toString();
                           });
                        },
                        selectedValue: _referenceBy,
                      ),


                        SizedBox(height:widget.gatePassType!="Equipment"? 15:0),*/

                     widget.gatePassType=="Vehicle"?  CustomDropdownButton(
                        hintText: 'Choose Visit Purpose',
                        items: gatePassController.gatePassTypeModel!.data!.gatepassTypes![1].visitPurpose!.map((e) => e).toList(),
                        onChanged: (value) {
                          setState(() {
                            visitPurpose = value.toString();
                          });
                        },
                        selectedValue: visitPurpose,
                      ):widget.gatePassType=="Visitor"? CustomTextField(
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter Visit Purpose';
                         }
                         return null;
                       },
                       controller: _visitPurposeController,
                       hintText: 'Write Visit Purpose',
                       prefixIcon: Icons.edit,
                     ):SizedBox() ,


                      SizedBox(
                        height:widget.gatePassType=="Equipment"?  0:15,
                      ),

                      widget.gatePassType=="Equipment"?  Column(
                        children: [
                          SizedBox(height: widget.gatePassType=="Equipment"? 0:0),
                          CustomDropdownButton(
                            hintText: 'Choose Vehicle Type',
                            items:gatePassController.gatePassTypeModel!.data!.vehicleTypes!
                                .where((item) => item.vehicleFor!.toLowerCase() == widget.gatePassType!.toLowerCase())
                                .map((item) => item.name.toString())
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _vehicleType = value.toString();
                                priceAmount=gatePassController.gatePassTypeModel!.data!.vehicleTypes!.firstWhere((element) => element.name==value).price;
                              });
                            },
                            selectedValue: _vehicleType,
                          ),
                        ],
                      ) :const SizedBox(),
                      /* CustomTextField(
                        controller: _vehicleTypeController,
                        hintText: 'Vehicle Type',
                        prefixIcon: Icons.directions_car,
                      ),*/



                        SizedBox(height:widget.gatePassType!="Visitor"? 15:0),

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
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
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
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
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



                      widget.gatePassType!="Visitor"?  CustomTextField(
                        controller: _vehicleNumberController,
                        hintText: 'Vehicle Number',
                        prefixIcon: Icons.confirmation_number,
                      ):SizedBox(),
                        SizedBox(height:widget.gatePassType!="Visitor"?   15:0),

                      priceAmount==0?  SizedBox():Column(
                        children: [
                          widget.gatePassType=="Vehicle"? CustomTextField(
                            controller: _vehicleModelController,
                            hintText: 'Vehicle Model',
                            prefixIcon: Icons.directions_car,
                          ):SizedBox(),
                          SizedBox(height: widget.gatePassType=="Vehicle"? 15:0),

                          priceAmount==0?  SizedBox(): Container(
                            height: 55,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("      Total Amount : ${priceAmount} Tk", style: poppinsRegular.copyWith(color: AppColors.black, fontSize: 15 ))),
                          ),

                          widget.gatePassType!="Visitor"? Column(
                            children: [
                              CustomDropdownButton(
                                hintText: 'Choose Payment Method',
                                items:[
                                  "Cash","Bank","MFS","Check","Others"
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _paymentMethod = value.toString();
                                  });
                                },
                                selectedValue: _paymentMethod,
                              ),
                              SizedBox(height: 15),
                            ],
                          ):SizedBox(height: 0,),





                          widget.gatePassType!="Visitor"?  Column(
                            children: [
                              CustomTextField(
                                controller: _paymentDetailsController,
                                hintText: 'Payment Details',
                                prefixIcon: Icons.details,
                              ),
                              SizedBox(height: 15),
                            ],
                          ):SizedBox(),

                        ],
                      ),






                      CustomTextField(
                        controller: _noteController,
                        hintText: 'Note',
                        prefixIcon: Icons.note,
                      ),
                      const SizedBox(height: 15),

                    /*widget.gatePassType=="Vehicle"?  Column(
                       children: [
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
                     ):SizedBox()
*/



                      widget.gatePassType=="Vehicle"? Row(
                        children: [
                          Text("Payment Document", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 20)),
                          SizedBox(width: 20),
                          IconButton(onPressed: (){
                            gatePassController.pickPaymentDocument();
                          }, icon:Icon(Icons.add_circle_outlined,color: AppColors.primary,size: 33,))
                        ],
                      ):SizedBox(),
                      SizedBox(height: 10),
                      widget.gatePassType=="Vehicle"? Center(
                          child: GridView.builder(
                              itemCount: gatePassController.paymentDocument != null ? gatePassController.paymentDocument!.length : 1,
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
                                    gatePassController.paymentDocument != null ? GetPlatform.isWeb ? Image.network(
                                        gatePassController.paymentDocument![index].path, width: 200, height: 150, fit: BoxFit.cover) : Image.file(
                                        File(gatePassController.paymentDocument![index].path), width: 200, height: 150, fit: BoxFit.cover) :   CustomNetworkImage(
                                      image: '',
                                      height: 150, width: 200, fit: BoxFit.cover,
                                    ),

                                    Positioned(
                                      bottom: 0, right: 0, top: 0, left: 0,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          gatePassController.pickPaymentDocument();
                                          setState(() {

                                          });
                                        },
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

                                    Positioned(
                                      right: 0, top: 0,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: (){
                                          gatePassController.paymentDocument!.removeAt(index);
                                          gatePassController.update();
                                          setState(() {

                                          });
                                        },
                                        child: gatePassController.paymentDocument == null ? const SizedBox() :
                                        Container(
                                          margin: const EdgeInsets.all(Dimensions.marginSizeFifteen),

                                          child: const Icon(Icons.remove_circle_outline, color: AppColors.red,size: 30,),
                                        ),
                                      ),
                                    ),

                                  ]),
                                );
                              })

                      ):SizedBox(),
                      SizedBox(height: 15),
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





                    if (_key.currentState!.validate()) {
                      if (entryDate!.isEmpty) {
                        showCustomSnackBar('Select Entry Date', isError: true);
                      } else if (expiredDate!.isEmpty) {
                        showCustomSnackBar('Select Expired Date', isError: true);
                      }  else {
                       widget.gatePassType=="Visitor"? gatePassController.addGatePass({
                          'gatepass_type': widget.gatePassType!,
                          'name': _nameController.text,
                          'phone': _phoneController.text,
                          'address': _addressController.text,
                          'visit_purpose': _visitPurposeController.text.toString(),
                          'entry_date': entryDate!,
                          'expired_date': expiredDate!,
                          'note': _noteController.text,
                        }):widget.gatePassType=="Vehicle"? gatePassController.addGatePass({
                         'gatepass_type': widget.gatePassType!,
                         'name': _nameController.text,
                         'phone': _phoneController.text,
                         'address': _addressController.text,
                         'visit_purpose': visitPurpose!,
                         'vehicle_type': _vehicleType!,
                         'entry_date': entryDate!,
                         'expired_date': expiredDate!,
                         'vehicle_number': _vehicleNumberController.text,
                         'vehicle_model': _vehicleModelController.text,
                         //'driving_license': _drivingLicenseController.text,
                         //'payment_status': _paymentStatus!,
                         "payment_method":_paymentMethod!,
                         'payment_details': _paymentDetailsController.text,
                         'note': _noteController.text,
                       }): gatePassController.addGatePass({
                         'gatepass_type': widget.gatePassType!,
                         'name': _nameController.text,
                         'phone': _phoneController.text,
                         'address': _addressController.text,
                        // 'visit_purpose': visitPurpose!,
                         'vehicle_type': _vehicleType!,
                         'entry_date': entryDate!,
                         'expired_date': expiredDate!,
                         'vehicle_number': _vehicleNumberController.text,
                         //'vehicle_model': _vehicleModelController.text,
                        // 'driving_license': _drivingLicenseController.text,
                         //'payment_status': _paymentStatus.toString(),
                         "payment_method":_paymentMethod!,
                         //'payment_details': _paymentDetailsController.text,
                         'note': _noteController.text,
                       });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}