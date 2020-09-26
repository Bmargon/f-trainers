
import 'package:flutter/material.dart';
class ZapatoModel with ChangeNotifier {

  String _assetImg = 'assets/imgs/azul.png';
  double _talla = 9.0;


  String get assetImg => this._assetImg;
  set assetImg(String valor) {
    this._assetImg = valor;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla(double valor) {
    this._talla = valor;
    notifyListeners();
  }

}