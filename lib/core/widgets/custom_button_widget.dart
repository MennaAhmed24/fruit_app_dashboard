

import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';
import '../utilis/app_text_styles.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({super.key, required this.text, required this.onPressed});
  final String text;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: SizedBox(
          width: double.infinity,
          height: 54,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primary,
            ),
          )),
    );
  }
}
