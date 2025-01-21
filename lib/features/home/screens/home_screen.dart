import 'package:chandrima_real_estate/common/widgets/custom_network_image.dart';
import 'package:chandrima_real_estate/features/auth/controller/auth_controller.dart';
import 'package:chandrima_real_estate/features/profile/controller/profile_controller.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (profileController) {
        return SingleChildScrollView(
          child: Column(children: [

            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
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
                  const SizedBox(height: 20),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                            const Icon(Icons.account_box_rounded, color: AppColors.primary, size: 25),
                            const SizedBox(height: 10),

                            Text('Account', style: poppinsRegular.copyWith(color: AppColors.primary)),
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
                            boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                            const Icon(Icons.account_balance_wallet_rounded, color: AppColors.primary, size: 25),
                            const SizedBox(height: 10),

                            Text('Wallet', style: poppinsRegular.copyWith(color: AppColors.primary)),
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
                            boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [
                            const Icon(Icons.account_balance_rounded, color: AppColors.primary, size: 25),
                            const SizedBox(height: 10),

                            Text('Bank', style: poppinsRegular.copyWith(color: AppColors.primary)),
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

                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                  child: const CustomNetworkImage(
                    height: 200, width: double.infinity,
                    image: 'https://media.istockphoto.com/id/1469214984/photo/welcome-written-speech-bubble-and-blue-megaphone-on-blue-background.jpg?s=612x612&w=0&k=20&c=eprduKO1QEqdxLDgZvBIxNA83cte4rp0_3Kg6IzcgQU=',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Invoice List', style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  InkWell(
                    onTap: () {},
                    child: Text('View All', style: poppinsRegular.copyWith(color: AppColors.primary)),
                  ),
                ]),
                const SizedBox(height: 20),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                          boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
                        ),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            child: const CustomNetworkImage(
                              height: 50, width: 50,
                              image: 'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('John Doe', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                              Text('ID: 1243', style: poppinsRegular),
                            ],
                          ),
                          const Spacer(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Invoice #1243', style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                              Text('Due Date: 12/12/2021', style: poppinsRegular),
                            ],
                          ),
                        ]),
                      ),
                      const SizedBox(height: 10),
                    ]);
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
