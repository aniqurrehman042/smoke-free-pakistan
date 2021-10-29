import 'package:flutter/material.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.isCircular = true,
    this.isMini = false,
  }) : super(key: key);

  final String text;
  final bool isCircular;
  final bool isMini;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      visualDensity: isMini ? VisualDensity.compact : null,
      padding: EdgeInsets.symmetric(vertical: isMini ? 2.0 : 12.0),
      color: AppColors.darkGreen,
      child: Text(
        text,
        style: isMini ? AppTextStyles.whiteS2W4 : AppTextStyles.whiteS4W4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: isCircular
            ? BorderRadius.circular(100.0)
            : BorderRadius.circular(14.0),
      ),
    );
  }
}
