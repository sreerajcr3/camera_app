import 'dart:io';

import 'package:camera_app/Fullscreen.dart';
import 'package:camera_app/functions/functions.dart';
import 'package:camera_app/model.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<CameraModel> _photos = [];
 

  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    final photos = await getPhotos();
    setState(() {
      _photos = photos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                   crossAxisSpacing: 10, 
                  mainAxisSpacing: 10, 
                ),
                itemCount: _photos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Fullscreen(image: _photos[index].imageurl,id:_photos[index].id!)));
                    },
                  child: Image.file(File(_photos[index].imageurl!)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
