import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/widgets/custom_button_widget.dart';
import 'package:fruit_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app_dashboard/core/widgets/is_checkbox.dart';
import 'package:fruit_app_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';
import 'package:fruit_app_dashboard/features/add_products/presentation/manager/cubit/add_products_cubit.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String productName, productCode, productDescription;
  late num productPrice, expirationMonths, numberOfCalories, unitAmount;
  File? productImage;
  bool isFeatured = false, isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (value) {
                productName = (value!);
              },
              hintText: "Product Name",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              hintText: "Product Price",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                expirationMonths = num.parse(value!);
              },
              hintText: "Expiration Months",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                numberOfCalories = num.parse(value!);
              },
              hintText: "Number of calories",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                unitAmount = num.parse(value!);
              },
              hintText: "Unit Amount",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                productCode = (value!.toLowerCase());
              },
              hintText: "Product Code",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                productDescription = (value!);
              },
              hintText: "Product Description",
              maxLines: 5,
            ),
            IsCheckbox(
              onChanged: (value) {
                isOrganic = (value);
              },
              text: "is Product Organic ?",
            ),
            const SizedBox(
              height: 16,
            ),
            IsCheckbox(
              onChanged: (value) {
                isFeatured = (value);
              },
              text: "is Featured item ?",
            ),
            ImageField(
              onImagePicked: (image) {
                productImage = image;
              },
            ),
            CustomButtonWidget(
                text: "Add product",
                onPressed: () {
                  if (productImage != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                          name: productName,
                          code: productCode,
                          description: productDescription,
                          price: productPrice,
                          expirationsMonths: expirationMonths.toInt(),
                          numberOfCalories: numberOfCalories.toInt(),
                          unitAmount: unitAmount.toInt(),
                          isOrganic: isOrganic,
                          image: productImage!,
                          isFeatured: isFeatured);
                      context.read<AddProductsCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context, "Please select an image");
                  }
                })
          ],
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
