import 'package:flutter/material.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/theme/styles/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      maxLines: 1,
      maxLength: 100,
      style: AppTextStyles.greenS4W4,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Quick Search For Your Complaints...',
        hintStyle: AppTextStyles.darkGrayS4W4,
        counterText: '',
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),
        fillColor: AppColors.lightGray,
        focusColor: AppColors.lightGray,
        hoverColor: AppColors.lightGray,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(
            Icons.search,
            color: AppColors.darkGray,
            size: 20.0,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40.0,
          maxWidth: 40.0,
        ),
      ),
    );
  }
}
