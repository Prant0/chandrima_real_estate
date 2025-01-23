import 'package:carousel_slider/carousel_slider.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/features/invoice/screens/invoice_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    "https://media.istockphoto.com/id/1469214984/photo/welcome-written-speech-bubble-and-blue-megaphone-on-blue-background.jpg?s=612x612&w=0&k=20&c=eprduKO1QEqdxLDgZvBIxNA83cte4rp0_3Kg6IzcgQU=",
    "https://media.istockphoto.com/id/1469214984/photo/welcome-written-speech-bubble-and-blue-megaphone-on-blue-background.jpg?s=612x612&w=0&k=20&c=eprduKO1QEqdxLDgZvBIxNA83cte4rp0_3Kg6IzcgQU=",
    "https://media.istockphoto.com/id/1469214984/photo/welcome-written-speech-bubble-and-blue-megaphone-on-blue-background.jpg?s=612x612&w=0&k=20&c=eprduKO1QEqdxLDgZvBIxNA83cte4rp0_3Kg6IzcgQU=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      body: GetBuilder<ProfileController>(builder: (profileController) {
        return SingleChildScrollView(
          child: Column(children: [

            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xff4B50CA),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
              ),

              Positioned(
                top: 50, left: 20, right: 20,
                child: Column(children: [
                  Row(children: [
                    ClipOval(
                      child: CustomNetworkImage(
                        image: profileController.profileDetails?.data?.member?.photo ?? '',
                        height: 50, width: 50,
                      ),
                    ),
                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profileController.profileDetails?.data?.member?.name ?? '', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.white)),
                        Text('ID: ${profileController.profileDetails?.data?.member?.memberId ?? ''}', style: poppinsRegular.copyWith(color: AppColors.white)),
                      ],
                    ),
                    const Spacer(),

                    InkWell(
                      onTap: () {
                        Get.find<AuthController>().removeToken();
                      },
                      child: const Icon(Icons.notifications, color: AppColors.white),
                    ),
                  ]),
                  const SizedBox(height: 20),

                  Text('Welcome to Chandrima Real Estate', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.white), textAlign: TextAlign.center),
                  SizedBox(height: 20),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                           // boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                            const Icon(Icons.garage_outlined, color: AppColors.purpleColor, size: 25),
                            const SizedBox(height: 10),

                            Text('Gate Pass', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                           // boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                            const Icon(Icons.payment, color: AppColors.purpleColor, size: 25),
                            const SizedBox(height: 10),

                            Text('Payment', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                           // boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                              Icon(Icons.add_chart_sharp, color: AppColors.purpleColor, size: 25),
                            const SizedBox(height: 10),

                            Text('Complain', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ),
                    ),

                  ]),

                ]),
              ),
            ]),
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
              child: Column(children: [

                CarouselSlider(
                  items: _imageUrls.map((url) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        child: Image.network(url, fit: BoxFit.cover, width: double.infinity));
                  }).toList(),
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imageUrls.map((url) {
                    int index = _imageUrls.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),


                const SizedBox(height: 15),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Invoice List', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  InkWell(
                    onTap: () {},
                    child: Text('View All', style: poppinsRegular.copyWith(color: AppColors.purpleColor,fontWeight: FontWeight.w600)),
                  ),
                ]),
                const SizedBox(height: 12),

                profileController.userInvoiceModel==null?SizedBox(): ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileController.userInvoiceModel!.data!.data!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var data= profileController.userInvoiceModel!.data!.data![index];
                    return InkWell(
                      onTap: () {
                        Get.to(InvoiceDetails(userInvoice: data));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                          // boxShadow:  [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 5)],
                        ),
                        child: Column(children: [
                          /* ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            child: const CustomNetworkImage(
                              height: 50, width: 50,
                              image: 'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),*/

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Invoice #${data.invoiceId}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                  border: Border.all(color: Colors.deepOrange,width: 1),
                                ),
                                child: Text('${data.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white)),
                              ),

                            ],
                          ),
                          SizedBox(height: 8,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount: ${data.totalAmount} Tk', style: poppinsRegular),
                              Text('Due Date: ${DateFormat('M-d-yyyy').format(DateTime.parse(data.createdAt.toString()))}', style: poppinsRegular),
                            ],
                          ),



                        ]),
                      ),
                    );
                  },
                ),

              ]),
            ),

          ]),
        );
      }),
    );
  }
}
