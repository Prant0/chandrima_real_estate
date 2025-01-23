import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:flutter/material.dart';

class BuildDetailsRow extends StatelessWidget {
  final String title;
  final String? value;
  const BuildDetailsRow({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title, style: poppinsRegular.copyWith(color: AppColors.grey,fontWeight: FontWeight.w900)),
          ),

          Text(': ', style: poppinsRegular.copyWith(color: AppColors.grey)),

          Expanded(
            child: Text(value ?? 'N/A', style: poppinsRegular.copyWith(color: AppColors.grey)),
          ),
        ],
      ),
    );
  }
}
