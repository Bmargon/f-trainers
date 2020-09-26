
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainers/src/models/provider.dart';
import 'package:trainers/src/pages/zapato_detail.dart';

class ZapatoPreview extends StatelessWidget {
  
  final bool fullScreen;

  const ZapatoPreview({Key key, this.fullScreen = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDetailPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(

          horizontal: (this.fullScreen) ? 5 : 30, 
          vertical: (this.fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (!this.fullScreen) ? 400 : 430,
          decoration: BoxDecoration(
            color: Color(0xffF5D954),
            borderRadius: 
            (!this.fullScreen) ?  BorderRadius.circular(50) : BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40))
          ),
          child: Column(
            children: <Widget>[
              _ZapatoConSombra(),
              if (!this.fullScreen)
                _Tallas()
              // zapato con sombra
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            right: 0,
            child: _SombraZapato()),
          Image(image: AssetImage(zapatoModel.assetImg))
        ],
      ),
    );
  }
}


class _SombraZapato extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow> [
            BoxShadow( color: Color(0xffeaa14e), blurRadius: 40 )
          ]
        ),
      ),
    );
  }
}

class _Tallas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _TallaZapatoBox(7),
          _TallaZapatoBox(7.7),
          _TallaZapatoBox(8),
          _TallaZapatoBox(8.5),
          _TallaZapatoBox(9),
          _TallaZapatoBox(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoBox extends StatelessWidget {
  final double numero;

  _TallaZapatoBox(this.numero);
  @override
  Widget build(BuildContext context) {
  final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${this.numero.toString().replaceAll('.0', '')}', style: TextStyle(
          color: (this.numero == zapatoModel.talla) ? Colors.white : Color(0xfff1a23a),
          fontSize: 16,
          fontWeight: FontWeight.bold),
        ),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: (this.numero == zapatoModel.talla) ?  Color(0xfff1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (this.numero == zapatoModel.talla)
              BoxShadow( color: Color(0xfff1a23a), blurRadius: 10, offset: Offset(0, 5))
          ]
        ),
      ),
    );
  }
}