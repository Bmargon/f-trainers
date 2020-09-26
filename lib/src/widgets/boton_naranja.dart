import 'package:flutter/material.dart';
class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;
  const BotonNaranja({Key key, @required this.texto, this.ancho = 150, this.alto = 50, this.color = Colors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(this.texto, style: TextStyle(color: Colors.white)),
    );
  }
}