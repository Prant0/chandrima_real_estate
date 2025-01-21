import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String buttonText;
  final Color? color;
  final Color? textColor;
  final Function()? onPressed;
  final bool isBorderEnable;
  final bool isLoading;
  final EdgeInsetsGeometry? margin;
  const CustomButton({super.key, this.height = 50, this.width, required this.buttonText, this.color = AppColors.primary,
    this.textColor, this.onPressed, this.isBorderEnable = true, this.isLoading = false, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),
        ),
        child: Center(
          child: isLoading ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 15, width: 15,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                strokeWidth: 2,
              ),
            ),
            const SizedBox(width: 14),

            Text('Loading', style: poppinsMedium.copyWith(color: AppColors.white, fontSize: Dimensions.fontSizeSixteen)),
          ]) : Text(
            buttonText,
            style: poppinsMedium.copyWith(color: textColor ?? AppColors.white, fontSize: Dimensions.fontSizeSixteen),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
