import 'package:findlaundry/Akun/detailPesanan.dart';
import 'package:findlaundry/Akun/profile.dart';
import 'package:flutter/material.dart';

import 'detailHistory.dart';

class LogAktivitas extends StatefulWidget {
  @override
  _LogAktivitasState createState() => _LogAktivitasState();
}

class _LogAktivitasState extends State<LogAktivitas> {
  bool isPesananSelected = true;
  Color colorPesanan = Colors.blue;
  Color colorHistory = Colors.grey;

  void onPressedPesanan() {
    setState(() {
      isPesananSelected = true;
      if (isPesananSelected == true) {
        colorPesanan = Colors.blue;
        colorHistory = Colors.grey;
      }
    });
  }

  void onPressedHistory() {
    setState(() {
      isPesananSelected = false;
      if (isPesananSelected == false) {
        colorPesanan = Colors.grey;
        colorHistory = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 25, right: 25, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Log Aktivitas",
                style: TextStyle(fontSize: 24),
              ),
            ),
            MenuBar(
                colorHistory: colorHistory,
                colorPesanan: colorPesanan,
                isPesananSelected: isPesananSelected,
                onPressedPesanan: onPressedPesanan,
                onPressedHistory: onPressedHistory),
            Visibility(
                visible: isPesananSelected,
                child: ContentBox(
                  namaToko: "Toko wah pinggir jalan",
                  imgToko: "assets/images/toko1.jpg",
                  page: DetailPesanan(),
                )),
            Visibility(
                visible: !isPesananSelected,
                child: ContentBox(
                  namaToko: "Toko wangi banget",
                  imgToko: "assets/images/gambartoko1.2.jpg",
                  page: DetailHistory(),
                ))
          ],
        ),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  bool isPesananSelected;
  Color colorPesanan;
  Color colorHistory;

  final onPressedPesanan;
  final onPressedHistory;

  MenuBar(
      {Key key,
      this.colorHistory,
      this.colorPesanan,
      this.isPesananSelected,
      this.onPressedPesanan,
      this.onPressedHistory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(color: colorPesanan, width: 2.3)),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              child: FlatButton(
                child: Text(
                  "Pesananmu",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  onPressedPesanan();
                  // isPesananSelected = true;
                },
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(color: colorHistory, width: 2.3)),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              child: FlatButton(
                child: Text(
                  "History",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  onPressedHistory();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ContentBox extends StatelessWidget {
  final String namaToko;
  final String imgToko;
  final Widget page;

  ContentBox({Key key, this.namaToko, this.imgToko, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(),
      // ),
      width: 400,
      height: 570,
      margin: EdgeInsets.only(right: 10),
      child: ListView(
        children: [
          Container(
            child: Column(
              children: [
                FlatButton(
                  child: Content(namaToko, imgToko),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => page),
                    );
                  },
                ),
                FlatButton(
                  child: Content(namaToko, imgToko),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => page),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  String namaToko;
  String imgToko;

  Content(this.namaToko, this.imgToko);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Text(
              "02-03-2021  20:24",
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  imgToko,
                  width: 38,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        namaToko,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 220,
                      child: Text(
                        "Hi, Terimakasih sudah disini dalam rangka......",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
