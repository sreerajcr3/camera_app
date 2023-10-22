import 'dart:io';

import 'package:camera_app/functions/functions.dart';
import 'package:flutter/material.dart';

class Fullscreen extends StatelessWidget {
  final String? image;
  final int id;

  const Fullscreen({super.key,  this.image = '', required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        actions: [
          IconButton(
            onPressed: () {
              deleteimage(id);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: image != null
            ? Image.file(File(image!))
            : const Text('Image not found'),
      ),
    );
  }
}
