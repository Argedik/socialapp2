import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServisi {
  StorageReference _storage = FirebaseStorage.instance.ref();
  Future<String> gonderiResmiYukle(File resimDosyasi) async {
    StorageUploadTask yuklemeYoneticisi =
        _storage.child("resimler/gonderiler/gonderi.jpg").putFile(resimDosyasi);
    StorageTaskSnapshot snapshot = await yuklemeYoneticisi.onComplete;
    String yuklenenResimUrl = await snapshot.ref.getDownloadURL();
    return yuklenenResimUrl;
  }
}
