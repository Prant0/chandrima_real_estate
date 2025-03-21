import 'package:chandrima_real_estate/common/widgets/custom_card.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/features/profile/widgets/build_details_row.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandInformationTab extends StatefulWidget {
  const LandInformationTab({super.key});

  @override
  State<LandInformationTab> createState() => _LandInformationTabState();
}

class _LandInformationTabState extends State<LandInformationTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final plots = profileController.profileDetails?.data?.plots;

      if (plots == null || plots.isEmpty) {
        return const Center(child: Text("No land information available."));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
        itemCount: plots.length,
        itemBuilder: (context, index) {
          final plot = plots[index];

          return CustomCard(
            margin: EdgeInsets.only(bottom: index == plots.length - 1 ? 0 : Dimensions.paddingSizeFifteen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text(
                      'Sl No: ${index+1}',
                      style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          plot.isExpanded = !plot.isExpanded!;
                          print("wewewewewewewewewe${plot.isExpanded}");
                          setState(() {

                          });
                          //profileController.togglePlotVisibility(index);
                        },
                        child: Icon(Icons.arrow_drop_down, color: AppColors.primary,size: 32,)),
                  ],
                ),
                const SizedBox(height: 8),

               index==0? Column(
                 children: [
                   BuildDetailsRow(title: 'Plot No', value: plot.plotNo),
                   BuildDetailsRow(title: 'Land Condition', value: plot.landCondition),
                   BuildDetailsRow(title: 'Net Land', value: '${plot.netLand} sq ft'),
                   BuildDetailsRow(title: 'Deed No', value: '${plot.deedNo??"N/A"}'),
                   BuildDetailsRow(title: 'House No', value: plot.houseNumber),
                   BuildDetailsRow(title: 'Road No', value: plot.roadNumber),
                   BuildDetailsRow(title: 'Block No', value: plot.blockNumber),
                   BuildDetailsRow(title: 'Date', value: plot.date),

                   // Flats Information
                   if (plot.getFlats != null && plot.getFlats!.isNotEmpty)
                     Padding(
                       padding: const EdgeInsets.only(top: Dimensions.paddingSizeFifteen),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Flats:',
                             style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
                           ),
                           const SizedBox(height: 8),

                           ...plot.getFlats!.map((flat) {
                             return Container(
                               margin: EdgeInsets.only(bottom: plot.getFlats!.last == flat ? 0 : Dimensions.paddingSizeTen),
                               decoration: BoxDecoration(
                                 color: AppColors.grey.withOpacity(0.1),
                                 borderRadius: BorderRadius.circular(Dimensions.radiusEight),
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     BuildDetailsRow(title: 'Flat No', value: flat.flatNo),
                                     BuildDetailsRow(title: 'Flat Type', value: flat.flatType),
                                     BuildDetailsRow(title: 'Flat Size', value: flat.flatSize),
                                     // BuildDetailsRow(title: 'CS Record', value: flat.csRecord),
                                     //BuildDetailsRow(title: 'RS Record', value: flat.rsRecord),
                                     //BuildDetailsRow(title: 'BS Record', value: flat.bsRecord),
                                     BuildDetailsRow(title: 'Sell Status', value: "flat"),
                                   ],
                                 ),
                               ),
                             );
                           }),
                         ],
                       ),
                     ),
                 ],
               ):SizedBox(height: 1,),


               plot.isExpanded!=true && index!=0? Column(
                  children: [
                    BuildDetailsRow(title: 'Plot No', value: plot.plotNo),
                    BuildDetailsRow(title: 'Land Condition', value: plot.landCondition),
                    BuildDetailsRow(title: 'Net Land', value: '${plot.netLand} sq ft'),
                    BuildDetailsRow(title: 'Deed No', value: '${plot.deedNo??"N/A"}'),
                    BuildDetailsRow(title: 'House No', value: plot.houseNumber),
                    BuildDetailsRow(title: 'Road No', value: plot.roadNumber),
                    BuildDetailsRow(title: 'Block No', value: plot.blockNumber),
                    BuildDetailsRow(title: 'Date', value: plot.date),

                    // Flats Information
                    if (plot.getFlats != null && plot.getFlats!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: Dimensions.paddingSizeFifteen),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flats:',
                              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen),
                            ),
                            const SizedBox(height: 8),

                            ...plot.getFlats!.map((flat) {
                              return Container(
                                margin: EdgeInsets.only(bottom: plot.getFlats!.last == flat ? 0 : Dimensions.paddingSizeTen),
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(Dimensions.radiusEight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BuildDetailsRow(title: 'Flat No', value: flat.flatNo),
                                      BuildDetailsRow(title: 'Flat Type', value: flat.flatType),
                                      BuildDetailsRow(title: 'Flat Size', value: flat.flatSize),
                                     // BuildDetailsRow(title: 'CS Record', value: flat.csRecord),
                                      //BuildDetailsRow(title: 'RS Record', value: flat.rsRecord),
                                      //BuildDetailsRow(title: 'BS Record', value: flat.bsRecord),
                                      BuildDetailsRow(title: 'Sell Status', value: "flat"),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                  ],
                ):SizedBox(height: 1,)
              ],
            ),
          );
        },
      );
    });
  }
}
