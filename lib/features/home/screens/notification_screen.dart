import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:CustomAppBar(title: 'Notification',),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return homeController.notificationModel != null
            ? ListView.builder(
          itemCount: homeController.notificationModel!.data!.data!.length,
          itemBuilder: (context, index) {
            var data=homeController.notificationModel!.data!.data![index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(

                title: Text("SL : ${index+1}${data.notify.toString()}",style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,),),
                subtitle: Row(
                  children: [
                    Text("${data.type.toString()}",style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,fontSize: Dimensions.fontSizeFifteen,color: Colors.black54),),
                    const Spacer(),
                    Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(data.createdAt.toString())),style: poppinsRegular.copyWith(fontWeight: FontWeight.w800,color: Colors.black54,fontSize: Dimensions.fontSizeFifteen),),
                  ],
                ),
                //subtitle: Text(homeController.notificationModel!.data!.notifications![index].description!),
              ),
            );
          },
        )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
