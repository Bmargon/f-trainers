
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainers/src/helpers/helpers.dart';
import 'package:trainers/src/models/provider.dart';
import 'package:trainers/src/widgets/custom_widgets.dart';


class ZapatoDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Hero(
                tag: 'nike',
                child: ZapatoPreview( fullScreen: true )),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 40,),
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  hoverElevation: 0,
                  backgroundColor: Colors.transparent,
                )
              )
            ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ZapatoDescripcion(titulo: 'Nike Air Max 720' , descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                  _MontoBuyNow(),
                  _ColoresyMas(),
                  _BotonesLikeSetting()
                ],
              ),
            )
          )
        ],
      )
   );
  }
}

class _BotonesLikeSetting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonSombreado(icono: Icons.star, color: Colors.red, size: 55),
          _BotonSombreado(icono: Icons.add_shopping_cart, color: Colors.grey, size: 55),
          _BotonSombreado(icono: Icons.settings, color: Colors.orange, size: 55),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
 
  final IconData icono;
  final Color color; 
  final double size;

  const _BotonSombreado({Key key, this.icono, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),      
      child: Icon(this.icono, color: this.color,),
    );
  }
}

class _ColoresyMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned (  child:_BotonColor(color: Color(0xff364D56),index: 1,            path: 'assets/imgs/negro.png')),
                Positioned ( left: 30, child: _BotonColor(color: Color(0xff2099f1),index: 2 , path: 'assets/imgs/azul.png')),
                Positioned ( left: 60 ,child: _BotonColor(color: Color(0xffffad29),index: 3 , path: 'assets/imgs/amarillo.png')),
                Positioned ( left: 90,child: _BotonColor(color: Color(0xffc6d642), index:4  , path: 'assets/imgs/verde.png')),
              ],
            )
          ),
          BotonNaranja(
            texto: 'Morereleted items', alto: 30, ancho: 170,)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String path;
  _BotonColor({this.color, this.index, this.path});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
        duration: Duration(milliseconds: 100),
        delay: Duration(milliseconds: this.index * 300),
        child: GestureDetector(
          onTap: () {
            final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
            zapatoModel.assetImg = this.path;
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: this.color,
              shape: BoxShape.circle
            ),
          ),
        ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold) ,),
            Spacer(),
            Bounce(
              from: 20,
              delay: Duration(seconds: 1),
              child: BotonNaranja(
                texto: 'Buy now', ancho: 130, alto: 40, color: Color(0xffFFC675),))
          ],
        ),
      ),
    );
  }
}