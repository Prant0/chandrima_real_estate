import 'package:carousel_slider/carousel_slider.dart';
import 'package:chandrima_real_estate/common/widgets/custom_asset_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_drawer.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/features/advertise/screen/advertises_details_screen.dart';
import 'package:chandrima_real_estate/features/advertise/screen/my_advertise_screen.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_screen.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
 import 'package:chandrima_real_estate/features/home/screens/events_screen.dart';
import 'package:chandrima_real_estate/features/home/screens/help_line.dart';
import 'package:chandrima_real_estate/features/home/screens/notification_screen.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/routes/routes_name.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shimmer/shimmer.dart';
//01723826340
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
    homeController.getNotification(page: 1);
    homeController.getNotificationCount();
  }


  final _scaffoldKey = GlobalKey<ScaffoldState>();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    Get.find<ProfileController>().getProfileDetails();

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        backgroundColor:AppColors.white,
        body: GetBuilder<ProfileController>(builder: (profileController) {
          return GetBuilder<HomeController>(builder: (homeController) {
            return SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration:   BoxDecoration(
                        color: AppColors.primary,
                        border: Border.all(color: AppColors.primary,width: 0),
                       ),
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
      
                              child: const Icon(TablerIcons.menu_4,color: Colors.white,),
                              onTap: (){
                                _scaffoldKey.currentState!.openDrawer();
      
                              },
                            ),
                            const SizedBox(width: 16,),
      
                            profileController.profileDetails != null ? Row(
                              children: [
                                ClipOval(
                                  child: CustomNetworkImage(
                                    image: profileController.profileDetails?.data?.member?.photo ?? '',
                                    height: 50, width: 50,
                                  ),
                                ),
                                const SizedBox(width: 10),
      
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(profileController.profileDetails?.data?.member?.name ?? '', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.white)),
                                    Text('ID: ${profileController.profileDetails?.data?.member?.memberId ?? ''}', style: poppinsRegular.copyWith(color: AppColors.white)),
                                  ],
                                ),
                              ],
                            ) : Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 50, width: 50,
                                    color: AppColors.white,
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.person, color: AppColors.primary),
                                  ),
                                ),
                                const SizedBox(width: 10),
      
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                                      child: Shimmer(
                                        gradient: LinearGradient(
                                          colors: [Colors.white, Colors.grey.shade300, Colors.white],
                                        ),
                                        child: Container(
                                          height: 15, width: 100,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
      
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusFive),
                                      child: Shimmer(
                                        gradient: LinearGradient(
                                          colors: [Colors.white, Colors.grey.shade300, Colors.white],
                                        ),
                                        child: Container(
                                          height: 10, width: 130,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
      
                            InkWell(
                                onTap: () {
                                  Get.to(const NotificationScreen());
                                  //Get.find<AuthController>().removeToken();
                                },
                                child:  Container(
                                  height: 50,
                                  width: 45,
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    children: [
                                      const Icon(Icons.notifications, color: AppColors.white,size: 35,),
                                      Positioned(
                                          top: -4, right: -0,
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                              color: AppColors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text('${homeController.notificationCount??"0"}', style: poppinsRegular.copyWith(color: AppColors.white, fontSize: Dimensions.fontSizeFourteen - 1)),
                                          )),
                                    ],
                                  ),
                                )
                            ),
                          ]),
                    ),
                Container(
                  decoration: BoxDecoration(
                     color: Colors.transparent,
                      border: Border.all(color: Colors.transparent,width: 0),
                      //  border: Border.symmetric(horizontal: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2)),
                      //  borderRadius: BorderRadius.circular(0)
                      //  border: Border.symmetric(horizontal: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2)),
                      //  borderRadius: BorderRadius.circular(0)
                      //  border: Border.symmetric(horizontal: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2)),
                      //  borderRadius: BorderRadius.circular(0)                    //  border: Border.symmetric(horizontal: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2)),
                      borderRadius: BorderRadius.circular(0)),
                  height: 320,
                  child: Stack(
                      children: [
                    Container(
                      height: 150,
                      decoration:   BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      ),
                    ),
      
      
      
                    Positioned(
                       left: 12, right: 12,
                      top: 0,bottom: 1,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
      
      
                        Text('Welcome to Chandrima Model Town', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeEighteen, color: AppColors.white), textAlign: TextAlign.center),
                        const SizedBox(height: 20),
      
                       Column(
                         children: [
                           Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                             Expanded(
                               child: InkWell(
                                 onTap: () {
                                   Get.offAll(const DashboardScreen(pageIndex: 3,profilePageIndex: 1,));
                                 },
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty,horizontal: 10),
                                   decoration: BoxDecoration(
                                       color: AppColors.white,
                                       borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                       border: Border.all(color: AppColors.secondaryPrimary,width: 1.5)
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.land_info, height: 40),
                                     const SizedBox(height: 10),
      
                                     Text('Land/Flat', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
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
                                     color: AppColors.white, border: Border.all(color: AppColors.secondaryPrimary,width: 1.5),
                                     borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.family, height: 40),
                                     const SizedBox(height: 10),
      
                                     FittedBox(child: Text('Family Member', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve  ,),maxLines: 1,textAlign: TextAlign.center,)),
                                   ]),
                                 ),
                               ),
                             ),
                             const SizedBox(width: 10),
      
                             Expanded(
                               child: InkWell(
                                 onTap: () {
                                   Get.to(ComplainScreen(
                                     isShowAppBar: true,
                                   ));
                                   //Get.offAll(const DashboardScreen(pageIndex: 2, profilePageIndex: 0));
                                 },
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                                   decoration: BoxDecoration(
                                       color: AppColors.white,
                                       borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                       border: Border.all(color: AppColors.secondaryPrimary,width: 1.5)
      
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.complaign, height: 40),
                                     const SizedBox(height: 10),
      
                                     Center(child: Text('Complain', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center)),
                                   ]),
                                 ),
                               ),
                             ),
                           ]),
      
                           SizedBox(height: 16,),
                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                                       border: Border.all(color: AppColors.secondaryPrimary,width: 1.5)
      
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.gate_pass, height: 40),
                                     const SizedBox(height: 10),
      
                                     Text('Gate Pass', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                   ]),
                                 ),
                               ),
                             ),
                             const SizedBox(width: 10),
      
                             Expanded(
                               child: InkWell(
                                 onTap: () {
                                   Get.offAll(  DashboardScreen(pageIndex: 1,profilePageIndex: 0,));
      
                                 },
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                                   decoration: BoxDecoration(
                                       color: AppColors.white,
                                       borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                       border: Border.all(color: AppColors.secondaryPrimary,width: 1.5)
      
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.payment, height: 40),
                                     const SizedBox(height: 10),
      
                                     Text('Payment', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve)),
                                   ]),
                                 ),
                               ),
                             ),
                             const SizedBox(width: 10),
      
                             Expanded(
                               child: InkWell(
                                 onTap: () {
                                   Get.to(const EventsScreen());
                                 },
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(vertical:Dimensions.paddingSizeTwenty),
                                   decoration: BoxDecoration(
                                       color: AppColors.white,
                                       borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                       border: Border.all(color: AppColors.secondaryPrimary,width: 1.5)
      
                                   ),
                                   child: Column(children: [
                                     Image.asset(Images.event, height: 40),
                                     const SizedBox(height: 10),
                                     Text('Events', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve)),
                                   ]),
                                 ),
                               ),
                             ),
                           ]),
      
                         ],
                       )
                      ]),
                    ),
                  ]),
                ),
      
      
      
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                  child: Column(children: [
      
                    homeController.advertisesList != null ? homeController.advertisesList!.data!.isNotEmpty ? CarouselSlider(
                      items: homeController.advertisesList?.data?.map((advertise) {
                        return InkWell(
                          onTap: () {
                            Get.to(AdvertisesDetailsScreen(advertisesId: advertise.id!));
                          },
                          child: Container(
                            //margin: EdgeInsets.symmetric(horizontal: 16),
                            width:double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                              image: DecorationImage(
                                image: NetworkImage(advertise.image ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: advertise.adType == "video"? const Icon(Icons.play_circle_outline, color: Colors.white, size: 70) : null,
                          )
                        );
                      }).toList() ?? [],

                      options: CarouselOptions(

                        height: 150,
                        padEnds: true,

                        viewportFraction: 1.0, // Makes each item full width
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ) : const SizedBox() : CarouselSlider(
                      items: List.generate(3, (index) {
                        return Shimmer(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade300, Colors.white],
                          ),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                              color: AppColors.white,
                            ),
                          ),
                        );
                      }),
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 1,
                        autoPlay: true,
                        enlargeCenterPage: true,
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
                     SizedBox(height: 8),

      
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radiusTen),
                            topRight: Radius.circular(Dimensions.radiusTen),
                          ),
                        border: Border.all(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2,


                        ),

                      ),
                      child: Text("More Service",style: poppinsBold.copyWith(color: AppColors.black,fontSize: Dimensions.fontSizeSixteen),),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.radiusTen),
                          bottomRight: Radius.circular(Dimensions.radiusTen),
                        ),
                        border: Border(
                          left: BorderSide(color:AppColors.secondaryPrimary.withOpacity(0.2),width: 2),
                          right: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2,),
                          bottom: BorderSide(color: AppColors.secondaryPrimary.withOpacity(0.2),width: 2),
                        ),
                      ),
                      child:Container(
                        //height: 120,
                        child:Column(
                          children: [
                            Row(
                             // scrollDirection: Axis.horizontal,
                              //shrinkWrap: true,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      showCustomSnackBar("Coming Soon");
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.vote,fit: BoxFit.cover,height: 50,width: 50,),
                                        SizedBox(height: 10),
                                        Text('Vote', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
      
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      showCustomSnackBar("Coming Soon");
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.service,fit: BoxFit.cover,
                                          height: 50,width: 50,),
                                        SizedBox(height: 10),
                                        Text('Service', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      showCustomSnackBar("Coming Soon");
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.post,fit: BoxFit.cover,height: 50,width: 50,),
                                        SizedBox(height: 10),
                                        Text('Post', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                             // scrollDirection: Axis.horizontal,
                              //shrinkWrap: true,
                              children: [
                                Expanded(
                                  child: InkWell(
                                        
                                    onTap: (){
                                      showCustomSnackBar("Coming Soon");
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.news,fit: BoxFit.cover,height: 45,width: 45,
                                           ),
                                        SizedBox(height: 10),
                                        Text('News', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: InkWell(
                                  
                                    onTap: (){
                                     // showCustomSnackBar("Coming Soon");
                                      Get.to(MyAdvertiseScreen());
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.ads,fit: BoxFit.cover,
                                          height: 50,width: 50,),
                                        SizedBox(height: 10),
                                        Text('Advertise', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: InkWell(
                                  
                                    onTap: (){
                                      // showCustomSnackBar("Coming Soon");
                                      Get.to(HelpLineScreen(
                                        isBackButton: true,
                                      ));
                                     // showCustomSnackBar("Coming Soon");
                                    },
                                    child: Column(
                                      children: [
                                        CustomAssetImage(image: Images.helpline,fit: BoxFit.cover,
                                          height: 50,width: 50,),
                                        SizedBox(height: 10),
                                        Text('Help Line', style: poppinsRegular.copyWith(color: AppColors.textColor,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeTwelve),textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
      
                              ],
                            ),
                          ],
                        )
                      )
                    ),
                  ],
      
                  ),
                ),
      
              ]),
            );
          });
        }),
      ),
    );
  }
}