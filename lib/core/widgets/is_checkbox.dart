import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utilis/app_text_styles.dart';

import 'check_box_widget.dart';

class IsCheckbox extends StatelessWidget {
  IsCheckbox({super.key, required this.onChanged, required this.text});
  final void Function(bool) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
            scale: 1.5,
            child: CheckBoxWidget(
              onChanged: onChanged,
            )),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
