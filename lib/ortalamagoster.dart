import 'package:flutter/material.dart';

import 'sabitler.dart';

class Ortalamagoster extends StatelessWidget {

  final double ortalama;

  final int dersayisi;

  const Ortalamagoster({required this.dersayisi, required this.ortalama});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Text(
            dersayisi > 0 ? '$dersayisi Ders Girildi ' : 'Ders Giriniz',
            style: TextStyle(color: Sabitler.Anarenk,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),

          Text(style: Sabitler.ortalamastyle,
              ortalama > 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0'),

          Text("Ortalama", style: Sabitler.derssayisistyle)

        ],


      );
  }
}
