import 'package:flutter/material.dart';
import 'package:flutter_mentor_quiz_app_tut/cevaplar.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  List<Icon> soruSayaci = [];
  bool anketSonu = false;
  int soruSayisi = 0;
  bool seciliMi = false;
  int soruIndex = 0;

  void cevaplananSoru(bool cevapSkoru) {
    setState(() {

      seciliMi = true;
      soruSayisi++;
      if (soruIndex + 1 == sorular.length) {
        anketSonu = true;
      }
    });
  }

  void sonrakiSoru() {
    setState(() {
      soruIndex++;
      seciliMi = false;
    });
    if (soruIndex >= sorular.length) {
      anketiSifirla();
    }
  }

  void anketiSifirla() {
    setState(() {
      soruIndex = 0;
      anketSonu = false;
      soruSayisi = 0;
      soruSayaci = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Müşteri Memnuniyet Anketi',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (soruSayaci.length == 0)
                  Expanded(
                    child: SizedBox(
                      height: 0.0,
                    ),
                  ),
                if (soruSayaci.length > 0) ...soruSayaci
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(bottom: 20.0, left: 0.0, right: 0.0),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    sorular[soruIndex]['soru'],

                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            ...(sorular[soruIndex]['cevaplar']
                    as List<Map<String, Object>>)
                .map(
              (cevap) => Cevap(
                cevapYazisi: cevap['yazi'],

                cevapIsaretleme: () {
                  if (seciliMi) {
                    return;
                  }
                  cevaplananSoru(cevap['isaret']);
                },
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(


              style:
              ElevatedButton.styleFrom(

                minimumSize: Size(double.infinity, 60.0),
                shadowColor: Colors.red,

              ),

              onPressed: () {
                if (!seciliMi) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Sorular boş bırakılamaz'),
                  ));
                  return;
                }
                sonrakiSoru();

              },
              child: Text(anketSonu ? 'Tekrar ankete katılmak ister misiniz?' : 'Sonraki soru'),



            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '${soruSayisi.toString()}/${sorular.length}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

              ),
            ),

            if (anketSonu)
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                         'Anketimize katıldığınız için teşekkür ederiz.',

                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final sorular = const [
  {
    'soru': 'Yediğiniz yemek nasıldı?',
    'cevaplar': [
      {'yazi': 'İyi', 'isaret': true},
      {'yazi': 'Ortalama', 'isaret': true},
      {'yazi': 'Kötü', 'isaret': true},
    ],
  },
  {
    'soru':
        'Dükkanın temizliğini nasıl buldunuz?',
    'cevaplar': [
      {'yazi': 'İyi', 'isaret': true},
      {'yazi': 'Ortalama', 'isaret': true},
      {'yazi': 'Kötü', 'isaret': true},
    ],
  },
  {
    'soru': 'Dükkan çalışanları hakkında ne düşünüyorsunuz?',
    'cevaplar': [
      {'yazi': 'Çalışanları ilgili ve samimi buldum.', 'isaret': true},
      {'yazi': 'Ortalama bir hizmetti, ne çok iyi ne çok kötü.', 'isaret': true},
      {'yazi': 'Yetersiz buldum.', 'isaret': true},
    ],
  },
  {
    'soru': 'Dükkan dekorasyonu konusunda ne düşünüyorsunuz?',
    'cevaplar': [
      {'yazi': 'Yemek yemek için iyi bir ortam vardı.', 'isaret': true},
      {'yazi': 'Kötü değildi.', 'isaret': true},
      {'yazi': 'Yemek yemek için uygun bir ortam değildi.', 'isaret': true},
    ],
  },
  {
    'soru':
        'Fiyatlar konusunda ne düşünüyorsunuz?',
    'cevaplar': [
      {'yazi': 'Fiyatlar gayet uygundu.', 'isaret': true},
      {'yazi': 'Fiyatlar biraz pahalıydı.', 'isaret': true},
      {'yazi': 'Fiyatlar pahalıydı.', 'isaret': true},
    ],
  },
  {
    'soru': 'Menü çeşitliliği nasıldı?',
    'cevaplar': [
      {'yazi': 'Menü çeşitliliği yeterliydi.', 'isaret': true},
      {'yazi': 'Menüde birkaç eksik vardı.', 'isaret': true},
      {'yazi': 'Menüyü eksik buldum.', 'isaret': true},
    ],
  },
  {
    'soru': 'Bu mekanı arkadaşlarınıza önerir misiniz?',
    'cevaplar': [
      {'yazi': 'Öneririm.', 'isaret': true},
      {'yazi': 'Kararsızım.', 'isaret': true},
      {'yazi': 'Önermem.', 'isaret': true},
    ],
  },
  {
    'soru': 'Paket servis hizmeti olsaydı tercih eder miydiniz?',
    'cevaplar': [
      {'yazi': 'Evet ederdim.', 'isaret': true},
      {'yazi': 'Kararsızım.', 'isaret': true},
      {'yazi': 'Etmezdim.', 'isaret': true},
    ],
  },
  {
    'soru': 'Dükkanın konumunu nasıl buldunuz?',
    'cevaplar': [
      {'yazi': 'Konumu iyiydi.', 'isaret': true},
      {'yazi': 'Kararsızım.', 'isaret': true},
      {'yazi': 'Konum kötüydü.', 'isaret': true},
    ],
  },
];
