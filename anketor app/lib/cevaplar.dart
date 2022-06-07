import 'package:flutter/material.dart';

class Cevap extends StatelessWidget {
  final String cevapYazisi;
  final Color cevapRengi;
  final Function cevapIsaretleme;

  Cevap({this.cevapYazisi, this.cevapRengi, this.cevapIsaretleme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cevapIsaretleme,
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: cevapRengi,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          cevapYazisi,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
