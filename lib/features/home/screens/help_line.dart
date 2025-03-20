import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/features/home/controller/home_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class HelpLineScreen extends StatefulWidget {


  @override
  State<HelpLineScreen> createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLineScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Get.find<HomeController>().getHelpLine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Help Line',

      backButton: false,
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return homeController.helpLineModel == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: homeController.helpLineModel!.data!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,color: Colors.white,
                margin: const EdgeInsets.all(12),
                child: ListTile(

                  subtitle:   Html(data: homeController.helpLineModel!.data![index].details! ,
                  shrinkWrap: true,
                  style: {
                    "body":Style(
                      fontSize: FontSize(16),
                      color: Colors.black,
                    )
                  },
                  ),
                
                  title: Text(homeController.helpLineModel!.data![index].title!,style: poppinsBold),
                  //subtitle: Text(homeController.helpLineModel!.data![index].details!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
