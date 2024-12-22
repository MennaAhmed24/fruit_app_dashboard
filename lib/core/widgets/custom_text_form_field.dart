import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utilis/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false,
      this.maxLines = 1});
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "هذا الحقل مطلوب";
          }
          return null;
        },
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            suffix: suffixIcon,
            filled: true,
            fillColor: Colors.grey.withOpacity(.1),
            hintStyle: TextStyles.bold13.copyWith(color: Colors.grey),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            errorBorder: buildBorder(),
            focusedErrorBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.grey, width: 0.4),
    );
  }
}
