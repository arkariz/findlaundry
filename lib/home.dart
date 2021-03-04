import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static final List<String> _imagesUrl = [
    'laundryMachine.png',
    'tes1.png',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: _imagesUrl.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset('assets/images/${fileImage}', fit: BoxFit.cover),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 170,
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 40),
        child: autoPlayImage,
      ),
      JelajahSection(),
    ]));
  }
}

//Jelajah Section
class JelajahSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jelajahi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JelajahIcon('Terdekat', 'assets/icon/fbicon.png'),
              JelajahIcon('Langganan', 'assets/icon/fbicon.png'),
              JelajahIcon('Sesuaikan Kebutuhan', 'assets/icon/fbicon.png'),
            ],
          ),
        ],
      ),
    );
  }
}

//IconButton
class JelajahIcon extends StatelessWidget {
  final String caption;
  final String iconLoc;

  JelajahIcon(this.caption, this.iconLoc);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(iconLoc),
            iconSize: 20,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 30,
            child: Text(caption),
          ),
        ],
      ),
    );
  }
}
