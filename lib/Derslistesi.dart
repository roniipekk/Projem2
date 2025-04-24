import 'package:flutter/material.dart';

import 'Ders.dart';

class Derslistesi extends StatelessWidget {

  final Function onElemanCikart;

   Derslistesi({required this.onElemanCikart});


  List<Ders> liste=Ders.dersler;

  @override
  Widget build(BuildContext context) {
    return Dondur(liste.length);

  }

  Widget Dondur(int a)
  {
    if(a>0)
    {
      return ListView.builder(
        itemBuilder:(context,int index)
        {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color:index%2==0?Colors.green:Colors.orange,
              child:ListTile(
                leading:CircleAvatar(

                    child:Text((index+1).toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.w300))),

                title: Text(liste[index].dersisim,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:Colors.black)),

                subtitle:Text('${liste[index].kredi} Kredi, Not Değeri ${liste[index].dersbasariHarf}',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

                trailing: IconButton(onPressed:()
                {
                  onElemanCikart(index);
                }

                    , icon: Icon(Icons.restore_from_trash)),



              ),
            ),
          );
        }
        ,itemCount: liste.length,);
    }
    return Container(

      child:Center(
        child: Text("Lütfen Ders Giriniz",style:TextStyle(fontSize: 35,fontWeight: FontWeight.w600,color:Colors.indigo)),
      ),
    );
  }
}
