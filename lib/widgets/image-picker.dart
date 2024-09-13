import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImagePicked;

  ImagePickerWidget({required this.onImagePicked});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      widget.onImagePicked(_image);
    } else {
      widget.onImagePicked(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick Image from Gallery'),
        ),
        _image != null
            ? Image.file(
                _image!,
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              )
            : Text('No image selected.'),
        SizedBox(height: 20),
      ],
    );
  }
}
