import 'dart:io';

import 'package:camera_app/functions/functions.dart';
import 'package:camera_app/gallery.dart';
import 'package:camera_app/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedImage;
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/bg image.jpeg',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('My Cam',style:GoogleFonts.dancingScript(fontSize: 60,color: Colors.white,fontWeight: FontWeight.w800),),
            ),
            Center(
                child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: IconButton(onPressed: ()  async{ File? pickimage = await _pickedImageFromCamera();
                      setState(() {
                        _selectedImage = pickimage;
                      });
                      final photo = CameraModel(
                        imageurl: _selectedImage != null
                            ? _selectedImage!.path
                            : null,
                      );
                      await addphoto(photo);}, icon: Icon(Icons.camera_enhance_rounded,color: Colors.white,size: 70,)),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Gallery()));
                },style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Colors.black)),
                child: Text('Gallery'))
          ],
        ),
      ),
    );
  }

  Future<File?> _pickedImageFromCamera() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      return File(pickedimage.path);
    }
    return null;
  }
}
