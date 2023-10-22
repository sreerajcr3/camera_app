import 'package:camera_app/Home.dart';
import 'package:camera_app/functions/functions.dart';
import 'package:flutter/material.dart';

Future<void> main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await initiliazeDatabase();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}