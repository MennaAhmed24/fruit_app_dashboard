import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';


class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<bool> onChanged;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: check,
      onChanged: (value) {
        if (check == true) {
          check = false;
        } else {
          check = true;
        }
        widget.onChanged(value!);
        setState(() {});
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      side: BorderSide(
        color: Colors.grey.withOpacity(0.8),
      ),
      activeColor: AppColors.primary,
      checkColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.maximumDensity,
        vertical: VisualDensity.maximumDensity,
      ),
      autofocus: false,
      semanticLabel: "من خلال انشاء حساب, فانك توافق علي",
    );
  }
}
