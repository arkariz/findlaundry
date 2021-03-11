import 'package:findlaundry/pembayaran/scanner.dart';
import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.fill)),
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 38),
                child: Text(
                  "PEMBAYARAN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black87),
                ),
              )),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 23),
                  child: Text(
                    "Cash",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 113),
                  child: Text("Rp"),
                ),
                Container(
                  child: Text(
                    "200.000,00",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 8))
                ]),
            margin: EdgeInsets.only(top: 35),
            child: ActionButton(),
            height: 100,
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  String _result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Image.asset("assets/icon/scan.jpg"),
                  onPressed: () => _openScanner(context)),
              Text("Scan")
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.credit_card,
                    color: Colors.black,
                  ),
                  onPressed: null),
              Text("Top-Up")
            ],
          ),
        ),
      ],
    );
  }

  Future _openScanner(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (c) => Scanner()));
    _result = result;
  }
}
