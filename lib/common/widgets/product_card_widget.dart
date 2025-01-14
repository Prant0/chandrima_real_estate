import 'package:flutter/material.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';


class ProductCardWidget extends StatelessWidget {
  ProductCardWidget({super.key, this.imageUrl,this.productName,this.onPressed});

  //VoidCallback? onPressed;
  VoidCallback ?onPressed;
  String? imageUrl,productName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            child: Image.network(
              "$imageUrl",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 120,
            ),
          ),
          Spacer(),
          Text("$productName",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge),maxLines: 3,)
        ],
      ),
    );
  }
}


