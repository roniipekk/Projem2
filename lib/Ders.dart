
class Ders{


  late String dersisim;

  late int kredi;

  late double dersbasariHarf;

  Ders(this.dersisim,this.kredi,this.dersbasariHarf);

  static List<Ders > dersler=[];

  static void  DersEkle(Ders d)
  {
    dersler.add(d);
  }

  static double ortalamaHesapla()
  {
    double toplamNot=0;
    double toplamKredi=0;
    for(int i=0;i<dersler.length;i++)
      {
        toplamNot=toplamNot+(dersler[i].dersbasariHarf*dersler[i].kredi);
        toplamKredi=toplamKredi+(dersler[i].kredi);
      }
    return toplamNot/toplamKredi;

  }
  static void DersCikart(int index)
  {
    dersler.removeAt(index);
  }



  @override
  String toString() {
    // TODO: implement toString
    return 'Ders ismi: $dersisim Dersin kredisi: $kredi Dersin basari Harfi: $dersbasariHarf';
  }



}



