import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/complain/screens/complain_screen.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_screen.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController _scrollController;
  int page=1 ;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();


    /// Manage scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !Get.find<HomeController>().isLoading) {
        Get.find<HomeController>().loadMore(page=page+1);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Notification'),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return homeController.notificationModel != null ? homeController.notificationModel!.isEmpty?Center(child: Text("No Data Found",style: poppinsMedium,)):
        SingleChildScrollView(

          controller: _scrollController,
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                itemCount: homeController.notificationModel!.length,
                itemBuilder: (context, index) {
                  var data=homeController.notificationModel![index];
                  return  InkWell(
                    onTap: (){
                       if(data.type == "gatepass"){
                         Get.to(() => const GatePassScreen());
                       }else if(data.type == 'familyIdCardRequest'){
                         Get.to(const DashboardScreen(pageIndex: 3, profilePageIndex: 2));
                       }else if(data.type == 'complaint'){
                         Get.to(ComplainScreen(isShowAppBar: true));
                       }else if(data.type == 'advertise'){
                         showDialog(context: context, builder: (context){
                           return Dialog(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                             child: AdvertiseNotification(uri: data.link.toString()),
                           );
                         });
                       }else if(data.type == 'service_charge'){
                         Get.to(DashboardScreen(pageIndex: 1, profilePageIndex: 0));
                         /*showDialog(context: context, builder: (context){
                           return Dialog(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20.0)
                             ),
                             child: Container(
                               height: MediaQuery.of(context).size.height*0.5,
                               width: MediaQuery.of(context).size.width*0.8,
                               child: const Column(
                                 children: [
          
                                 ],
                               ),
                             ),
                           );
                         });*/
                       }
                    },
                    child: CustomCard(
                      margin: EdgeInsets.only(bottom: index == homeController.notificationModel!.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                      child: ListTile(

                        leading:  Icon( Icons.notifications_none,color: AppColors.primary,size: 25,),

                        title: Text("${data.notify.toString()}",style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,),maxLines: 2,),
                        subtitle: Row(
                          
                          children: [
                            Expanded(child: Text("${data.type.toString()}", style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,color: Colors.black54),)),
                             
                            Text("${data.date}")
                            //Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(data.createdAt.toString())),style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,color: Colors.black54,fontSize: Dimensions.fontSizeFifteen),),
                          ],
                        ),
                        //subtitle: Text(homeController.notificationModel!.data!.notifications![index].description!),
                      ),
                    ),
                  );
                },
              ),
              homeController.isLoading?Padding(
                padding: const EdgeInsets.all(30.0),
                child: CircularProgressIndicator(),
              ):SizedBox(
                height: 20,
              )
            ],
          ),
        )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class AdvertiseNotification extends StatefulWidget {
  final String uri;
  const AdvertiseNotification({super.key, required this.uri});

  @override
  State<AdvertiseNotification> createState() => _AdvertiseNotificationState();
}

class _AdvertiseNotificationState extends State<AdvertiseNotification> {

  @override
  void initState() {
    super.initState();
    Uri uri = Uri.parse(widget.uri);
    String path = uri.path;
    String desiredPath = path.replaceFirst('/api', '');

    Get.find<HomeController>().getAdvertiseNotificationDetails(desiredPath);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: homeController.advertiseNotification != null ? Column(mainAxisSize: MainAxisSize.min, children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomNetworkImage(
                image: homeController.advertiseNotification!.data!.image.toString(),
                height: 150, width: double.infinity,
              ),
            ),
            const SizedBox(height: 10),

            Text(homeController.advertiseNotification?.data?.title ?? '', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeFifteen), maxLines: 4, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),

            Text(homeController.advertiseNotification?.data?.description ?? '', style: poppinsRegular, maxLines: 7, overflow: TextOverflow.ellipsis),

          ]) : const Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}
