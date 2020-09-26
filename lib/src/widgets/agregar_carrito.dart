import 'package:flutter/material.dart';
import 'package:trainers/src/widgets/custom_widgets.dart';
class AgregarCarritoBoton extends StatelessWidget {

  final double monto;

  const AgregarCarritoBoton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadiusDirectional.circular(100),
        ),
        child: Row(
          children: <Widget>[
            SizedBox( width: 20,),
            Text('\$${this.monto}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Spacer(),
            BotonNaranja(texto: 'Add to cart',),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}