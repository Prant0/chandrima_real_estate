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
import 'package:video_player/video_player.dart';


class AddAdvertiseScreen extends StatefulWidget {
  const AddAdvertiseScreen({super.key});

  @override
  State<AddAdvertiseScreen> createState() => _AddAdvertiseScreenState();
}

class _AddAdvertiseScreenState extends State<AddAdvertiseScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? dateOfBirth = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Advertise'),

      body: GetBuilder<HomeController>(builder: (profileController) {
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
                          profileController.pickedFile != null ? GetPlatform.isWeb ? Image.network(
                              profileController.pickedFile!.path, width: 80, height: 80, fit: BoxFit.cover) : Image.file(
                              File(profileController.pickedFile!.path), width: 80, height: 80, fit: BoxFit.cover) : const CustomNetworkImage(
                            image: '',
                            height: 120, width: 120, fit: BoxFit.cover,
                          ),

                          Positioned(
                            bottom: 0, right: 0, top: 0, left: 0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => profileController.pickImage(),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.2),
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


                    CustomCard(
                      padding: Dimensions.paddingSizeFifteen,
                      child: CustomButton(
                        isLoading: profileController.isLoading,
                        buttonText: 'Add Advertise',
                        onPressed: () {
                         profileController.pickedFile==null?Get.snackbar("Error", "Please select media"):
                        mediaValue=="image"? profileController.addAdvertise(
                             title: _titleController.text,
                             description: _descriptionController.text,
                             ad_type: mediaValue!,

                         ): profileController.addAdvertise(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            ad_type: mediaValue!,
                            video: videoFile
                        );
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
