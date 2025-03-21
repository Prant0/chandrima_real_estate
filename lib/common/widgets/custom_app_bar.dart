import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final Function? onBackPressed;
  final Widget? actionWidget;

  const CustomAppBar({super.key, required this.title, this.backButton = true, this.onBackPressed, this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeEighteen, fontWeight: FontWeight.w800,color: Colors.white)),
      centerTitle: true,
      leading: backButton ? IconButton(
        icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        color: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
      ) : const SizedBox(),
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.white,
      shadowColor: Theme.of(context).disabledColor.withValues(alpha: 0.5),
      elevation: 2,
      actions: actionWidget != null ? [actionWidget!] : [const SizedBox()],
    );
  }

  @override
  Size get preferredSize => const Size(1170, 50);
}