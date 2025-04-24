import 'package:flutter/material.dart';
import 'package:ortalamahesaplamauygulamasi/Ders.dart';
import 'package:ortalamahesaplamauygulamasi/Derslistesi.dart';

import 'datahelper.dart';
import 'ortalamagoster.dart';
import 'sabitler.dart';

class Ortalamahesaplaapp extends StatefulWidget {
  const Ortalamahesaplaapp({super.key});

  @override
  State<Ortalamahesaplaapp> createState() => _OrtalamahesaplaappState();
}

class _OrtalamahesaplaappState extends State<Ortalamahesaplaapp> {

  String dersadi=" ";

  double dersBasariharf=0;

   int kredi=1;

  var formkey=GlobalKey<FormState>();

  var derssayisi=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(backgroundColor: Sabitler.Anarenk,
        title:Center(child:Text(Sabitler.baslikText,style:Sabitler.style)),
      ),
      body:Center(

        child:Column(

          //CrossAxisAlignment.stretch ise tum alana kaplanmasini saglar//
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Row(
                children:[
                  Expanded(
                    flex:2,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [

                            _buildForm(),

                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:EdgeInsets.symmetric(horizontal: 26,vertical: 16),
                                    decoration:BoxDecoration(
                                      color:Colors.white30.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    child: DropdownButton<double>
                                      (
                                      underline: Container(),
                                      value:dersBasariharf,
                                      items:DataHelper().Cevir(),
                                      onChanged: (istenilen)
                                      {
                                        setState(() {
                                          dersBasariharf=istenilen!;
                                          print(dersBasariharf);
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.symmetric(horizontal: 16,vertical:8),
                                    decoration:BoxDecoration(
                                      color:Colors.white54.withOpacity(0.2),

                                    ),

                                    child:DropdownButton<int>(
                                        underline:Container(),
                                        value:kredi,
                                        items:DataHelper().KrediCevir(),
                                        onChanged: (istenilen)
                                        {
                                          setState(() {
                                            kredi=istenilen!;
                                            print(kredi);
                                          });
                                        }
                                    ),
                                  ),

                                  Expanded(
                                    child: IconButton(onPressed:_dersEkleveOrtalamaHesapla,icon: Icon(Icons.arrow_forward_ios,size:45,color:Sabitler.Anarenk)),
                                  ),
                                ],

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                  Expanded(
                    flex:1,
                    child:Container(
                      child:Ortalamagoster(dersayisi: KontrolEt(Ders.dersler.length), ortalama:Ders.ortalamaHesapla()),
                    ),

                  ),
                ]
            ),

            //Bu sayede liste tum alani kaplayabilecek//
            Expanded(
              child:Derslistesi(onElemanCikart: (secilen)
              {
                Ders.DersCikart(secilen);
                setState(() {

                });

              },


              )
              ),

          ],
        ),

      ),
    );
  }

  Form _buildForm()
  {
    return Form(
      key:formkey,

      child:Column(

        children: [

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:(secilen)
             {

               if(secilen!.length<3)
                 {
                   return "Girilen ders tanimsizdir ";
                 }
             },
             onSaved: (secilen)
             {
               setState(() {
                 dersadi=secilen!;
               });
             },
            decoration: InputDecoration(
              labelText: "Dersin Adi",
              border:OutlineInputBorder(),

            ),
          ),

        ],

      ),

    );

  }
   _dersEkleveOrtalamaHesapla()
  {

    setState(() {

      if(formkey.currentState!.validate())
        {
          formkey.currentState!.save();
          print(dersadi);
          var Eklenecekders=Ders(dersadi,kredi,dersBasariharf);
          Ders.DersEkle(Eklenecekders);
          print(Ders.ortalamaHesapla());
          print(Ders.dersler);
        }
    });
  }
  int KontrolEt(int a)
  {
    if(a==0)
      {
        return 0;
      }
    else
      {
        return a;
      }
  }




}








