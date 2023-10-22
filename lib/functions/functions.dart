
import 'package:camera_app/model.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future <void> initiliazeDatabase()async{
  _db = await openDatabase(
    "CameraModel.db",
    version: 2,
    onCreate: (db, version) async {
      await db.execute(
        " CREATE TABLE camera(id INTEGER PRIMARY KEY,imageurl);"
      );
    },
  );
}

Future <void> addphoto(CameraModel value) async{
  await _db.rawInsert(
    " INSERT INTO camera( imageurl )  VALUES (?)",
    [
      value.imageurl,
     
    ]
  );
}

Future <List<CameraModel>> getPhotos () async {
  final List <Map<String,dynamic>> results = await _db.rawQuery('SELECT * FROM camera');
  print(results);
  List<CameraModel> photos =[];
  for (Map<String,dynamic> map in results){
    photos.add(CameraModel(imageurl: map['imageurl']));
  }
  return  photos;
}

Future <void> deleteimage(int id)async{
  await _db.rawDelete('DELETE FROM camera WHERE id = ?', [id]);
}
