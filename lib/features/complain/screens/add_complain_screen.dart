import 'dart:io';
import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drop_down_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_text_field.dart';
import 'package:chandrima_real_estate/features/complain/controller/complain_controller.dart';
import 'package:chandrima_real_estate/features/complain/model/complain_model.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
class AddComplainScreen extends StatefulWidget {
    AddComplainScreen({super.key,required this.complaintCategories});
  List<ComplaintCategory>? complaintCategories;
  @override
  State<AddComplainScreen> createState() => _AddComplainScreenState();
}

class _AddComplainScreenState extends State<AddComplainScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var formKey=GlobalKey<FormState>();
  String ?categoryId ;
  @override
  void initState() {
    // TODO: implement initState
    print("xxxxsxsxsxsxsxsxsxsxsxsxsxsxsxsx${widget.complaintCategories!.length}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title:   Text('Add Complaints',style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeTwenty,color: Colors.white),),
        backgroundColor: AppColors.purpleColor,
      ),
      body: GetBuilder<ComplainController>(builder: (complainController) {
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
                          DropdownButtonFormField<ComplaintCategory>(
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a category';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Select Category',
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor:  AppColors.grey.withOpacity(0.2),
                            ),
                            items: widget.complaintCategories?.map((ComplaintCategory category) {
                              return DropdownMenuItem<ComplaintCategory>(
                                value: category,
                                child: Text(category.name.toString()), // Assuming ComplaintCategories has a 'name' property
                              );
                            }).toList(),
                            onChanged: (ComplaintCategory? newValue) {
                              // Handle change
                              categoryId=newValue!.id.toString();
                            },
                          ),


                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: _titleController,
                            hintText: 'Title',
                            prefixIcon: TablerIcons.user,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),



                          CustomTextField(
                            maxLines: 6,
                            controller: _descriptionController,
                            hintText: 'Description',
                            titleText: 'Description',
                            showTitle: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },

                          ),
                          const SizedBox(height: 15),

                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Add Images", style: poppinsMedium.copyWith(color: AppColors.black, fontSize: 20)),
                              SizedBox(width: 20),
                              IconButton(onPressed: (){
                                complainController.pickNidFrontImage();
                              }, icon:Icon(Icons.add_circle_outlined,color: AppColors.primary,size: 33,))
                            ],
                          ),
                          SizedBox(height: 10),
                          Center(
                              child: GridView.builder(
                                  itemCount: complainController.complaintImages != null ? complainController.complaintImages!.length : 1,
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
                                    complainController.complaintImages != null ? GetPlatform.isWeb ? Image.network(
                                        complainController.complaintImages![index].path, width: 200, height: 150, fit: BoxFit.cover) : Image.file(
                                            File(complainController.complaintImages![index].path), width: 200, height: 150, fit: BoxFit.cover) :   CustomNetworkImage(
                                      image: '',
                                      height: 150, width: 200, fit: BoxFit.cover,
                                    ),

                                    Positioned(
                                      bottom: 0, right: 0, top: 0, left: 0,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          complainController.pickNidFrontImage();
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.2),
                                            border: Border.all(width: 1, color: AppColors.primary),
                                          ),
                                          child: complainController.complaintImages != null ? const SizedBox() : Container(
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
                                          complainController.complaintImages!.removeAt(index);
                                          complainController.update();
                                          setState(() {

                                          });
                                        },
                                        child: complainController.complaintImages == null ? const SizedBox() :
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


                        ]),
                  ),
                ),





                CustomCard(
                  padding: Dimensions.paddingSizeFifteen,
                  child: CustomButton(
                    isLoading: complainController.isLoading,
                    buttonText: 'Add Complaints',
                    onPressed: () {
                       if(formKey.currentState!.validate()){
                          complainController.addComplaint(categoryId: categoryId!, title: _titleController.text, details: _descriptionController.text);
                       }
                    },
                  ),
                ),
              ]),
        );
      }),
    );
  }
}
