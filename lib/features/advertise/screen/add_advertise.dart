import 'dart:io';

import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';


class AddAdvertiseScreen extends StatefulWidget {
  const AddAdvertiseScreen({super.key});

  @override
  State<AddAdvertiseScreen> createState() => _AddAdvertiseScreenState();
}

class _AddAdvertiseScreenState extends State<AddAdvertiseScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _paymentDetailsController = TextEditingController();
  String? startDate = '';
  String? endDate = '';
  String ?paymentStatus,paymentMethod;
  int daysDifference=1;
  dynamic totalPayment;

  @override
  void initState() {
    // TODO: implement initState
    Get.find<HomeController>().getAdvertiseSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Advertise'),
      resizeToAvoidBottomInset: true,
      body: GetBuilder<HomeController>(builder: (homeController) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



              CustomTextField(
                controller: _titleController,
                hintText: 'Enter Title',
                prefixIcon: TablerIcons.ad_2,
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: _descriptionController,
                hintText: 'Enter Description',
                prefixIcon: TablerIcons.details,
                maxLines: 5,
              ),
              const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start Date", style: poppinsMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
                            SizedBox(height: 8),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: startDate!.isEmpty ? "Select Start Date" : startDate,
                                prefixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    startDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("End Date", style: poppinsMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
                            SizedBox(height: 8),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: endDate!.isEmpty ? "Select End Date" : endDate,
                                prefixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    endDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                  });
                                }

                                if (daysDifference < 0) {
                                  Get.snackbar('Error', 'End date cannot be before start date',
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 2));
                                }
                                endDate = DateFormat('dd-MM-yyyy').format(pickedDate!);
                                setState(() {

                                });
                                daysDifference = DateFormat('dd-MM-yyyy').parse(endDate!).difference(DateFormat('dd-MM-yyyy').parse(startDate!)).inDays;
                                print("Days Difference: $daysDifference");
                                totalPayment= int.parse(homeController.advertiseSettingsModel!.perdayPrice!)*daysDifference;
                                if(totalPayment==0){
                                  totalPayment=homeController.advertiseSettingsModel!.perdayPrice;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                /*  CustomDropdownButton(
                    hintText: "payment method",
                    selectedValue:paymentStatus ,
                    onChanged: (String? newValue) {
                      setState(() {
                        paymentStatus = newValue!;
                      });
                    },
                    items: [
                      'UnPaid',
                      'Paid',
                    ],
                  ),
              const SizedBox(height: 15),
               paymentStatus=="Paid"?   Column(
                 children: [
                   CustomDropdownButton(
                        hintText: "payment method",
                        selectedValue:paymentMethod ,
                        onChanged: (String? newValue) {
                          setState(() {
                            paymentMethod = newValue!;
                          });
                        },
                        items: [
                          'Bank',
                          'Cash',
                          "Cheque",
                          "Others"
                        ],
                      ),
                   SizedBox(height: 15),
                 ],
               ):SizedBox(),
                  paymentMethod!="Cash"?Column(
                    children: [
                      CustomTextField(
                        controller: _paymentDetailsController,
                        hintText: 'Enter Payment Details',
                        prefixIcon: TablerIcons.details,
                      ),
                      const SizedBox(height: 15),
                      Text("Payment Document,",style: poppinsMedium.copyWith(fontSize: 16,fontWeight: FontWeight.w800),),
                      SizedBox(height: 20),
                      Center(
                        child: Stack(
                            children: [
                              homeController.pickedPaymentDocument != null ? GetPlatform.isWeb ? Image.network(
                                  homeController.pickedPaymentDocument!.path, width: 80, height: 80, fit: BoxFit.cover) : Image.file(
                                  File(homeController.pickedPaymentDocument!.path), width: 80, height: 80, fit: BoxFit.cover) : const CustomNetworkImage(
                                image: '',
                                height: 120, width: 120, fit: BoxFit.cover,
                              ),

                              Positioned(
                                bottom: 0, right: 0, top: 0, left: 0,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () => homeController.pickPaymentDocumentImage(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      border: Border.all(width: 1, color: AppColors.primary),
                                    ),
                                    child: homeController.pickedPaymentDocument != null ? const SizedBox() : Container(
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
                  ):SizedBox(height: 0),*/



              const SizedBox(height: 15),

              Text("Choose Media Type",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Image'),
                      leading: Radio<String>(
                        value: 'image',
                        groupValue: mediaValue,
                        onChanged: (String? value) {
                          mediaValue=value;
                          setState(() {

                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Video'),
                      leading: Radio<String>(
                        value: 'video',
                        groupValue:mediaValue,
                        onChanged: (String? value) {
                          mediaValue=value;
                          setState(() {

                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mediaValue=="video"? "Choose Thumbnail" : "Choose Image",style: poppinsMedium.copyWith(fontSize: 16,fontWeight: FontWeight.w800),),
                  SizedBox(height: 20),
                  Center(
                    child: Stack(
                        children: [
                          homeController.pickedFile != null ? GetPlatform.isWeb ? Image.network(
                              homeController.pickedFile!.path, width: 80, height: 80, fit: BoxFit.cover) : Image.file(
                              File(homeController.pickedFile!.path), width: 80, height: 80, fit: BoxFit.cover) : const CustomNetworkImage(
                            image: '',
                            height: 120, width: 120, fit: BoxFit.cover,
                          ),

                          Positioned(
                            bottom: 0, right: 0, top: 0, left: 0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => homeController.pickImage(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  border: Border.all(width: 1, color: AppColors.primary),
                                ),
                                child: homeController.pickedFile != null ? const SizedBox() : Container(
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
              const SizedBox(height: 25),

                  mediaValue=="video"?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Choose Video",style: poppinsMedium.copyWith(fontSize: 16,fontWeight: FontWeight.w800),),
                        _videoPlayerController != null && _videoPlayerController!.value.isInitialized
                            ? Stack(
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 300,
                                    width: 200,
                                    child: VideoPlayer(_videoPlayerController!,),
                                  ),
                                ),
                                Positioned(
                                  top: 0,right: 30,
                                  child: IconButton(onPressed: (){
                                    _videoPlayerController!.dispose();
                                    _videoPlayerController=null;
                                    setState(() {

                                    });
                                  },
                                    icon: Icon(Icons.delete_outline,color: Colors.red,size: 33,),)
                                )
                              ],
                            )
                            : Text(''),
                        SizedBox(height: 0),

                        Center(
                          child: ElevatedButton(
                            onPressed: _pickVideo,
                            child: Text('Pick Video'),
                          ),
                        ),
                      ],
                    ):Text(''),
                    const SizedBox(height: 45),



                  Row(
                    children: [
                      Text("Total Days",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                      Text("${daysDifference==0?"1":daysDifference} Days",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
 Row(
                    children: [
                      Text("Payment Summary",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                      Text("${totalPayment??"0"} BDT",style: poppinsRegular.copyWith(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),



                  CustomCard(
                      padding: Dimensions.paddingSizeFifteen,
                      child: CustomButton(
                        isLoading: homeController.isLoading,
                        buttonText: 'Add Advertise',
                        onPressed: () {
                          bool responce;
                            if(mediaValue==null){
                              Get.snackbar('Error', 'Please select media type',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  duration: const Duration(seconds: 2));
                            } else{
                              homeController.pickedFile==null?Get.snackbar("Error", "Please select media"):
                              mediaValue=="image"? homeController.addAdvertise(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                ad_type: mediaValue!,
                                paymentDetails: _paymentDetailsController.text.toString(),
                                paymentMethod: paymentMethod,
                                startDate: startDate,
                                endDate: endDate,

                              ): homeController.addAdvertise(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  ad_type: mediaValue!,
                                  video: videoFile,
                                  paymentDetails: _paymentDetailsController.text.toString(),
                                  paymentMethod: paymentMethod,
                                  startDate: startDate,
                                  endDate: endDate,
                              );

                            }
                          },
                      ),
                    ),


            ]),
          ),
        );
      }),
    );
  }
  String ?mediaValue;
  VideoPlayerController? _videoPlayerController;
    XFile? videoFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    videoFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (videoFile != null) {
      _videoPlayerController = VideoPlayerController.file(File(videoFile!.path))
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController!.play();
        });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }
}
