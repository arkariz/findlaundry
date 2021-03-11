import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pemesanan/Pemesanan.dart';

class DetailToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [GambarToko(), ProfileToko(), DescriptionToko()],
    );
  }
}

//GambarTokoSection
class GambarToko extends StatefulWidget {
  @override
  _GambarTokoState createState() => _GambarTokoState();
}

class _GambarTokoState extends State<GambarToko> {
  static final List<String> imagesUrl = [
    'toko1.jpg',
    'gambartoko1.1.jpg',
    'gambartoko1.2.jpg',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imagesUrl.map((fileImage) {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          // ignore: unnecessary_brace_in_string_interps
          child: Image.asset(
            'assets/images/$fileImage',
            width: 900,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: autoPlayImage,
    );
  }
}

//Profile Toko
class ProfileToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Text(
              "Toko wah pinggir jalan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            'assets/images/toko1.jpg',
                            width: 40,
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Zoey Isabllea",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_rate,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_rate,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_rate,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_rate,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('5'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: 35,
                      height: 19,
                      buttonColor: Colors.cyan,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Pemesanan(),
                            ),
                          );
                        },
                        child: Text(
                          "Pesan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 35,
                      height: 19,
                      buttonColor: Colors.cyan,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Chat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Deskripsi Toko",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              'Laundry refers to the washing of clothing and other textiles.'
              'Laundry processes are often done in a room reserved for that'
              'purpose; in an individual home this is referred to as a laundry'
              'room, Laundry in Australian English or utility room. An apartment'
              'building or student hall of residence may have a shared laundry '
              'facility such as a tvättstuga. A stand-alone business is referred'
              'to as a self-service laundry (launderette in British English or '
              'laundromat in North American and Australasia). The material that '
              'is being washed, or has been laundered, is also generally referred '
              'to as laundry. Laundry has been part of history since humans began '
              'to wear clothes, so the methods by which different cultures have '
              'dealt with this universal human need are of interest to several '
              'branches of scholarship. Laundry work has traditionally been '
              'highly gendered, with the responsibility in most cultures falling '
              'to women (known as laundresses or washerwomen). The Industrial '
              'Revolution gradually led to mechanized solutions to laundry work, '
              'notably the washing machine and later the tumble dryer. Laundry, '
              'like cooking and child care, is done both at home and by '
              'commercial establishments ',
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
