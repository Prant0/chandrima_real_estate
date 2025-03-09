import 'package:carousel_slider/carousel_slider.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/features/home/screens/advertises_details_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/events_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/notification_screen.dart';
import 'package:chandrima_real_estate/features/invoice/screens/invoice_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/images.dart';
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

  @override
  void initState() {
    super.initState();
    HomeController homeController = Get.find<HomeController>();
    homeController.getAdvertisesList();
    homeController.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      body: GetBuilder<ProfileController>(builder: (profileController) {
        return GetBuilder<HomeController>(builder: (homeController) {
          return SingleChildScrollView(
            child: Column(
                children: [
              Stack(
                  clipBehavior: Clip.none,
                  children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
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
                          Get.to(NotificationScreen());
                          //Get.find<AuthController>().removeToken();
                        },
                        child: const Icon(Icons.notifications, color: AppColors.white),
                      ),
                    ]),
                    const SizedBox(height: 20),

                    Text('Welcome to Chandrima Real Estate', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.white), textAlign: TextAlign.center),
                    const SizedBox(height: 20),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.offAll(const DashboardScreen(pageIndex: 3,profilePageIndex: 1,));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            ),
                            child: Column(children: [
                              Image.asset(Images.land_info, height: 40),
                              const SizedBox(height: 10),

                              Text('Land/Flat', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1),textAlign: TextAlign.center),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.offAll(const DashboardScreen(pageIndex: 3, profilePageIndex: 2));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            ),
                            child: Column(children: [
                              Image.asset(Images.family, height: 40),
                              const SizedBox(height: 10),

                              Center(child: Text('Family Member', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1,),textAlign: TextAlign.center,)),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.offAll(const DashboardScreen(pageIndex: 2, profilePageIndex: 0));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            ),
                            child: Column(children: [
                              Image.asset(Images.complaign, height: 40),
                              const SizedBox(height: 10),

                              Center(child: Text('Complain', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1),textAlign: TextAlign.center)),
                            ]),
                          ),
                        ),
                      ),
                    ]),

                  ]),
                ),
              ]),
              const SizedBox(height: 65),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTwenty),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.getGatePassScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        ),
                        child: Column(children: [
                          Image.asset(Images.gate_pass, height: 40),
                          const SizedBox(height: 10),

                          Text('Gate Pass', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1),textAlign: TextAlign.center),
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.offAll(const DashboardScreen(pageIndex: 3, profilePageIndex: 4));

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        ),
                        child: Column(children: [
                          Image.asset(Images.payment, height: 40),
                          const SizedBox(height: 10),

                          Text('Payment', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1)),
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(EventsScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        ),
                        child: Column(children: [
                          Image.asset(Images.event, height: 40),
                          const SizedBox(height: 10),
                          Text('Events', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeFourteen - 1)),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
                child: Column(children: [

                  CarouselSlider(
                    items: homeController.advertisesList?.data?.map((advertise) {
                      return InkWell(
                        onTap: () {
                          Get.to(AdvertisesDetailsScreen(advertisesId: advertise.id!));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                          child: CustomNetworkImage(
                            image: advertise.image ?? '',
                            height: 150, width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList() ?? [],
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

                  homeController.advertisesList == null ? const SizedBox() : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: homeController.advertisesList!.data!.map((url) {
                      int? index = homeController.advertisesList?.data?.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? AppColors.primary : AppColors.grey,
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

                  profileController.userInvoiceModel == null ? const SizedBox() : ListView.builder(
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
                          margin: EdgeInsets.only(bottom: index == profileController.userInvoiceModel!.data!.data!.length - 1 ? 0 : Dimensions.paddingSizeTen),
                          padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                          ),
                          child: Column(children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Invoice #${data.invoiceId}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                    border: Border.all(color: Colors.deepOrange,width: 1),
                                  ),
                                  child: Text('${data.paymentStatus=="null"?"Pending":data.paymentStatus}', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFourteen,color: Colors.white)),
                                ),

                              ],
                            ),
                            const SizedBox(height: 8),

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
        });
      }),
    );
  }
}