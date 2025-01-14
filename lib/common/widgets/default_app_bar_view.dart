import 'package:flutter/material.dart';
import 'package:chandrima_real_estate/common/widgets/app_bar_back_button.dart';
import 'package:chandrima_real_estate/common/widgets/custom_asset_image_widget.dart';
import 'package:chandrima_real_estate/utils/images.dart';

class DefaultAppBarView extends StatelessWidget {
  final VoidCallback? onPressed;

  const DefaultAppBarView({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //AppBarBackButton(),
        Expanded(
          child: Align(
            child: CustomAssetImage(
              Images.transparentRectangleAppLogo,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
