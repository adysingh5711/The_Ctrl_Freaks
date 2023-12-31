
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class Storage{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
      String filepath,
      String fileName,
      )
 async {
  File file = File(filepath);
try {
  await storage.ref('test/$fileName').putFile(file);
} on firebase_core.FirebaseException catch (e) {print(e);
}
             }
  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results = await storage.ref('test/').listAll();
    results.items.forEach((firebase_storage.Reference ref){
      print('Found file: $ref');
    });
    return results;
  }
  Future<String> downloadUrl(String imageName) async{
    String downloadUrl = await storage.ref('test/$imageName').getDownloadURL();
    return downloadUrl;
  }
 }
