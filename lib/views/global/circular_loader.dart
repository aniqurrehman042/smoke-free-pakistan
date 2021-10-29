import 'package:flutter/material.dart';
import 'package:no_smoking_app/theme/app_colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.semiTransparentWhite,
      width: width,
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.darkGreen,
        ),
      ),
    );
  }
}