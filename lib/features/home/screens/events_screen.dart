import 'package:chandrima_real_estate/common/widgets/custom_app_bar.dart';
import 'package:chandrima_real_estate/features/gate_pass/screens/gate_pass_details.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart'; 
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  late ScrollController _scrollController;
  int page=1 ;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Get.find<ProfileController>().eventList!.clear();
    Get.find<ProfileController>().getEventList(page: page);
    /// Manage scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !Get.find<ProfileController>().isLoading) {
        Get.find<ProfileController>().loadMore(page=page+1);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final events = profileController.eventList;

      return Scaffold(
        appBar:   CustomAppBar(title: 'Events',),
        body: Column(
          children: [
            events != null && events.isNotEmpty ? Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];

                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Event Details', style: poppinsMedium.copyWith(fontSize: 18)),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichText(title: 'Sl No:', value: (index + 1).toString()),
                                  CustomRichText(title: 'Event Name:', value: event.title ?? "N/A"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Description : ',
                                          style: poppinsMedium.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            event.description ?? "N/A",
                                            style: poppinsMedium.copyWith(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 17,
                                            ),
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomRichText(
                                    title: 'Date:',
                                    value: event.sendingDate != null
                                        ? DateFormat('dd-MM-yyyy').format(event.sendingDate!)
                                        : 'N/A',
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close', style: poppinsMedium.copyWith(color: AppColors.primary)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.only(
                        bottom: index == events.length - 1 ? 0 : Dimensions.paddingSizeFifteen,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichText(title: 'Sl No:', value: (index + 1).toString()),
                            CustomRichText(title: 'Event Name:', value: event.title ?? "N/A"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description : ',
                                    style: poppinsMedium.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      event.description ?? "N/A",
                                      style: poppinsMedium.copyWith(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 17,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomRichText(
                              title: 'Date:',
                              value: event.sendingDate != null
                                  ? DateFormat('dd-MM-yyyy').format(event.sendingDate!)
                                  : 'N/A',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ) : const Expanded(child: Center(child: Text("No Events available."))),


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