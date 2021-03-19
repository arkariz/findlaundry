import 'package:flutter/material.dart';

class DetailPesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesananmu")),
      body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 35),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentBox("assets/icon/electric_iron.png", "Setrika Express",
                      "10.000"),
                  ContentBox("assets/icon/washer.png", "Cuci Biasa", "6.000"),
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Pengambilan",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text("Antar-Jemput"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Opsi Pembayaran",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text("Bayar Langsung"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Rp 16.000",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Estimasi Selesai 3 hari",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
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
                    alignment: Alignment.center,
                    width: 240,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 13),
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Sedang dicuci",
                            style: TextStyle(color: Colors.white, fontSize: 27),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class ContentBox extends StatelessWidget {
  final String imgContent;
  final String captionContent;
  final String hargaContent;

  ContentBox(this.imgContent, this.captionContent, this.hargaContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Image.asset(
                  imgContent,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 15),
                width: 170,
                child: Text(
                  captionContent,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[500]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 14, left: 20),
                child: Text(
                  hargaContent,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
