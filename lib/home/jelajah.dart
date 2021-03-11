import 'package:flutter/material.dart';
import 'detailToko.dart';

class Jelajah extends StatelessWidget {
  final String screenTitle;

  Jelajah(this.screenTitle);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: EdgeInsets.only(top: 42, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text(screenTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(7),
                      child: Icon(Icons.sort),
                    ),
                    Container(
                      margin: EdgeInsets.all(7),
                      child: Text("Filter",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
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
                child: Column(
                  children: [
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'WANGI25 25%'),
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'BERSIH10 10%'),
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'BERSIH10 10%'),
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'BERSIH10 10%'),
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'BERSIH10 10%'),
                    AddItemContainer(
                        'assets/images/toko1.jpg',
                        'Toko wah pinggir jalan',
                        '5.0',
                        '1,5 Km',
                        'BERSIH10 10%'),
                  ],
                ))
          ],
        ),
      )
    ]);
  }
}

class AddItemContainer extends StatelessWidget {
  final String imageLoc;
  final String namaToko;
  final String rating;
  final String jarak;
  final String promo;

  AddItemContainer(
      this.imageLoc, this.namaToko, this.rating, this.jarak, this.promo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 8, left: 8, bottom: 10),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailToko(),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Image.asset(
                  imageLoc,
                  width: 100,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      namaToko,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Icon(Icons.star_rate,
                                color: Colors.yellow, size: 14),
                            Text(
                              rating,
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        )),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.pin_drop_outlined, size: 14),
                              Text(
                                jarak,
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Icon(Icons.point_of_sale_outlined,
                              color: Colors.yellow, size: 14),
                          Text(
                            promo,
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Jam Operasioanl: 08:00 - 20:00",
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
