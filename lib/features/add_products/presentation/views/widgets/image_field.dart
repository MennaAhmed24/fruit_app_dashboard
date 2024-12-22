import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagePicked});
  final ValueChanged<File?> onImagePicked;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Skeletonizer(
        enabled: isLoading,
        child: GestureDetector(
          onTap: () async {
            isLoading = true;
            setState(() {});
            await pickImage();
            isLoading = false;
            setState(() {});
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(imageFile!))
                    : const Icon(
                        Icons.image_outlined,
                        size: 180,
                      ),
              ),
              Visibility(
                visible: imageFile != null,
                child: IconButton(
                    onPressed: () {
                      imageFile = null;
                      widget.onImagePicked(null);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(image!.path);

      widget.onImagePicked(imageFile!);
    } on Exception catch (e) {
      // TODO
    }
  }
}
