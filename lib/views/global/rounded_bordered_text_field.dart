import 'package:flutter/material.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

class RoundedBorderedTextField extends StatelessWidget {
  const RoundedBorderedTextField({
    Key? key,
    this.hint,
    required this.controller,
    required this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.isTextArea = false,
    this.readOnly = false,
  }) : super(key: key);

  final String? hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isTextArea;
  final bool readOnly;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: isTextArea ? 4 : 1,
      maxLength: isTextArea ? 300 : 100,
      readOnly: readOnly,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      style: AppTextStyles.greenS4W4,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.darkGrayS4W4,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
          vertical: isTextArea ? 8.0 : 0.0,
          horizontal: 20.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
