import 'package:flutter/material.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

class NumberBox extends StatelessWidget {
  const NumberBox({
    Key? key,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  final String number;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.pink,
        width: 40.0,
        height: 40.0,
        child: Center(
          child: Text(
            number,
            style: AppTextStyles.darkGrayS5W4,
          ),
        ),
      ),
    );
  }
}
