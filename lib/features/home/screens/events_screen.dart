import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart'; 
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final events = profileController.profileDetails?.data?.events;

      return Scaffold(
        appBar:   CustomAppBar(title: 'Events',),
        body: Column(
          children: [
            events != null && events.isNotEmpty ? Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];

                  return  Card(

                    margin: EdgeInsets.only(bottom: index == events.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
                    child:  Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        // boxShadow:  [BoxShadow(color: Colors.black12, spreadRadius: 0.5, blurRadius: 5)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(title: 'Sl No:', value: (index + 1).toString()),
                          CustomRichText(title: 'Event Name:', value: event.title??"N/A"),
                          CustomRichText(title: 'Description:', value: event.description??""),
                          CustomRichText(title: 'Date:', value:event.sendingDate != null ? DateFormat('dd-MM-yyyy').format(event.sendingDate!) : 'N/A'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ) : const Expanded(child: Center(child: Text("No tenant information available."))),


          ],
        ),
      );
    });
  }

  Widget buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            '$title ', style: poppinsRegular.copyWith(color: AppColors.grey),
          ),
          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: AppColors.grey), overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }

}