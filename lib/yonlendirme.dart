import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/KSS/Desktop/AndroidStudio/Denemeler/socialapp2/lib/sayfalar/girissayfasi.dart';
import 'package:socialapp2/modeller/kullanici.dart';
import 'package:socialapp2/sayfalar/anasayfa.dart';
import 'package:socialapp2/servisler/yetkilendirmeservisi.dart';

class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);

    return StreamBuilder(
      stream: _yetkilendirmeServisi.durumTakipcisi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          Kullanici aktifKullanici = snapshot.data;
          _yetkilendirmeServisi.aktifKullaniciId = aktifKullanici.id;
          return AnaSayfa();
        } else
          return GirisSayfasi();
      },
    );
  }
}
