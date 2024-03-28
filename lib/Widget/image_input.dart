// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function (File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imagefile;

  void _takePickture () async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return ;
    }

    setState(() => _imagefile = File(pickedImage.path));
    widget.onPickImage(_imagefile!);
    
  }

  @override
  Widget build(BuildContext context) {

    Widget content =  TextButton.icon(
        onPressed: _takePickture,
        icon: const Icon(Icons.camera),
        label: const Text("Take Picture"),
      );

    if(_imagefile != null) {
      content = GestureDetector(
        onDoubleTap: _takePickture,
        child: Image.file(_imagefile!, fit: BoxFit.cover,width: double.infinity,),
      );
    }

    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      child: content,
    );
  }
}
