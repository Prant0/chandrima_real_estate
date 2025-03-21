import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/dashboard/screens/dashboard_screen.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_screen.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Notification'),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return homeController.notificationModel != null ? ListView.builder(
          padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
          itemCount: homeController.notificationModel!.data!.data!.length,
          itemBuilder: (context, index) {
            var data=homeController.notificationModel!.data!.data![index];
            return InkWell(
              onTap: (){
                 if(data.type == "gatepass"){
                   Get.to(() => const GatePassScreen());
                 }else if(data.type == 'familyIdCardRequest'){
                   Get.to(const DashboardScreen(pageIndex: 3, profilePageIndex: 2));
                 }else if(data.type == 'advertise'){
                   showDialog(context: context, builder: (context){
                     return Dialog(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                       child: AdvertiseNotification(uri: data.link.toString()),
                     );
                   });
                 }else if(data.type == 'service_charge'){
                   showDialog(context: context, builder: (context){
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
                   });
                 }
              },
              child: CustomCard(
                margin: EdgeInsets.only(bottom: index == homeController.notificationModel!.data!.data!.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                child: ListTile(

                  title: Text("SL : ${index+1}  ${data.notify.toString()}",style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,),),
                  subtitle: Row(
                    children: [
                      Text(data.type.toString(), style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,color: Colors.black54),),
                      const Spacer(),
                      Text("${data.date}")
                      //Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(data.createdAt.toString())),style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,color: Colors.black54,fontSize: Dimensions.fontSizeFifteen),),
                    ],
                  ),
                  //subtitle: Text(homeController.notificationModel!.data!.notifications![index].description!),
                ),
              ),
            );
          },
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
