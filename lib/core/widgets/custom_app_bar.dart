import 'package:flutter/material.dart';

import '../utilis/app_text_styles.dart';

AppBar buildAppBar(BuildContext context,
    { required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios_new)),
  );
}
