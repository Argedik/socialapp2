import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Yukle extends StatefulWidget {
  @override
  _YukleState createState() => _YukleState();
}

class _YukleState extends State<Yukle> {
  File dosya;

  @override
  Widget build(BuildContext context) {
    return dosya == null ? yukleButonu() : gonderiFormu();
  }

  Widget yukleButonu() {
    return IconButton(
      icon: Icon(Icons.file_upload, size: 50.0),
      onPressed: () {
        fotografSec();
      },
    );
  }

  Widget gonderiFormu() {
    return Center(child: Text("Yüklenen resim ve text alanları gelecek."));
  }

  fotografSec() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Gönderi Oluştur"),
          children: [
            SimpleDialogOption(
              child: Text("Fotoğraf Çek"),
              onPressed: () {
                fotoCek();
              },
            ),
            SimpleDialogOption(
              child: Text("Galeriden  Yükle"),
              onPressed: () {},
            ),
            SimpleDialogOption(
              child: Text("İptal"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  fotoCek() async {
    Navigator.pop(context);
    var image = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 80,
    );
    setState(() {
      dosya = File(image.path);
    });
  }

  galeridenSec() async {
    Navigator.pop(context);
    var image = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 80,
    );
    setState(() {
      dosya = File(image.path);
    });
  }
}
