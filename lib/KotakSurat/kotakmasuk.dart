import 'package:findlaundry/KotakSurat/chat.dart';
import 'package:findlaundry/pembayaran/pembayaran.dart';
import 'package:flutter/material.dart';

class KotakMasuk extends StatefulWidget {
  @override
  _KotakMasukState createState() => _KotakMasukState();
}

class _KotakMasukState extends State<KotakMasuk> {
  bool isChatSelected = true;
  Color colorChat = Colors.blue;
  Color colorNotifikasi = Colors.grey;

  void onPressedChat() {
    setState(() {
      isChatSelected = true;
      if (isChatSelected == true) {
        colorChat = Colors.blue;
        colorNotifikasi = Colors.grey;
      }
    });
  }

  void onPressedNotifikasi() {
    setState(() {
      isChatSelected = false;
      if (isChatSelected == false) {
        colorChat = Colors.grey;
        colorNotifikasi = Colors.blue;
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
                "Kotak Masuk",
                style: TextStyle(fontSize: 24),
              ),
            ),
            MenuBar(
                colorNotifikasi: colorNotifikasi,
                colorChat: colorChat,
                isChatSelected: isChatSelected,
                onPressedChat: onPressedChat,
                onPressedNotifikasi: onPressedNotifikasi),
            Visibility(
              visible: isChatSelected,
              child: Container(
                width: 400,
                height: 570,
                margin: EdgeInsets.only(right: 10),
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          FlatButton(
                            child: Content(
                                "Toko wah pinggir jalan",
                                "assets/images/toko1.jpg",
                                "Hai, terimakasih sudah melakukan pemesanan disini, ditunggu kedatangan selanjutnya ya"),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Chat("Toko wah pinggir jalan")),
                              );
                            },
                          ),
                          FlatButton(
                            child: Content(
                                "Toko wangi banget",
                                "assets/images/gambartoko1.2.jpg",
                                "Hai, terimakasih sudah melakukan pemesanan disini, ditunggu kedatangan selanjutnya ya"),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Chat("Toko wangi banget")),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isChatSelected,
              child: Container(
                width: 400,
                height: 570,
                margin: EdgeInsets.only(right: 10),
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          FlatButton(
                            child: Content(
                                "Klaim Kode Promo",
                                "assets/icon/mail.png",
                                "Horee!! kamu dapat kode promo. Gunakan kode ini untuk mendapatkan diskon 10% untuk tiap orderan Cuci Ekspress"),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Pembayaran()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      child: Content(
                          "Dapatkan Diskon 20%",
                          "assets/icon/mail.png",
                          "Dengan melakukan order sebanyak 3 kali pada toko yang terdaftar kamu dapat menikmati diskon 20 %"),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Pembayaran()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  String namaToko;
  String imgToko;
  String pesan;

  Content(this.namaToko, this.imgToko, this.pesan);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 60,
                      child: Text(
                        pesan,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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

class MenuBar extends StatelessWidget {
  bool isChatSelected;
  Color colorChat;
  Color colorNotifikasi;

  final onPressedChat;
  final onPressedNotifikasi;

  MenuBar(
      {Key key,
      this.colorNotifikasi,
      this.colorChat,
      this.isChatSelected,
      this.onPressedChat,
      this.onPressedNotifikasi})
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
              border: Border(bottom: BorderSide(color: colorChat, width: 2.3)),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              child: FlatButton(
                child: Text(
                  "Chatmu",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  onPressedChat();
                  // isChatSelected = true;
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
              border: Border(
                  bottom: BorderSide(color: colorNotifikasi, width: 2.3)),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              child: FlatButton(
                child: Text(
                  "Notifikasi",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  onPressedNotifikasi();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

// class ContentBox extends StatelessWidget {
//   final String namaToko;
//   final String imgToko;
//   final Widget page;

//   ContentBox({Key key, this.namaToko, this.imgToko, this.page})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 570,
//       margin: EdgeInsets.only(right: 10),
//       child: ListView(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 FlatButton(
//                   child: Content(namaToko, imgToko),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => page),
//                     );
//                   },
//                 ),
//                 FlatButton(
//                   child: Content(
//                       "Toko wangi banget", "assets/images/gambartoko1.2.jpg"),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => page),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
