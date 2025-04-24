import 'package:flutter/material.dart';

import 'sabitler.dart';
class DataHelper {

  static List<String> tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "BC", "CC", "DC", "DD", "FF"];
  }

  static List<int> tumkrediler() {
    return [1, 2, 3, 4, 5, 6];
  }


  static double _harfinotacevir(String harf) {
    switch (harf) {
      case('AA'):
        {
          return 4;
        }
      case('BA'):
        {
          return 3.5;
        }
      case('BB'):
        {
          return 3;
        }
      case('BC'):
        {
          return 2.5;
        }
      case('CC'):
        {
          return 2;
        }
      case('DC'):
        {
          return 1.5;
        }
      case('DD'):
        {
          return 1;
        }
      case('FF'):
        {
          return 0;
        }

      default:
        return -1;
    }
  }

  List<DropdownMenuItem<double>> Cevir() {
    return tumDerslerinHarfleri().map((e) => DropdownMenuItem(
        child: Text(e, style: Sabitler.dropdownstyle,),
        value: _harfinotacevir(e))).toList();
  }

  List<DropdownMenuItem<int>> KrediCevir() {
    return tumkrediler()
        .map((e) => DropdownMenuItem(
        child: Text(e.toString(), style: Sabitler.dropdownstyle), value: e))
        .toList();
  }


}
