import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'iconButton.dart';
import 'mainMenu.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: ListView(
        children: [PromoBanner(), JelajahSection(), PromoSection()],
      ),
    );
    return scaffold;
  }
}

//BannerSection
class PromoBanner extends StatefulWidget {
  @override
  _PromoBannerState createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  static final List<String> imagesUrl = [
    'promobanner1.png',
    'promobanner2.png',
    'promobanner3.png',
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imagesUrl.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // ignore: unnecessary_brace_in_string_interps
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
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: autoPlayImage,
    );
  }
}

//Promo Section
class PromoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text('Promo untuk kamu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png'),
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png'),
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png')
                ],
              ),
              Column(
                children: [
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png'),
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png'),
                  PromoItem('Promo beli dua gratis sepuluh',
                      'assets/images/promothumb.png')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//PromoItem
class PromoItem extends StatelessWidget {
  final String promoThumbail;
  final String thumbnailTitle;

  PromoItem(this.thumbnailTitle, this.promoThumbail);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(promoThumbail),
                ),
              ),
              Container(
                width: 153,
                child: Text(thumbnailTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//Jelajah Section
class JelajahSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 17, bottom: 50),
        child: Container(
          margin: EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jelajahi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: JelajahIcon(
                          'Terdekat', 'assets/icon/pinLoc.png', 50.0)),
                  Expanded(
                      child: JelajahIcon(
                          'Langganan', 'assets/icon/favIcon.png', 50.0)),
                  Expanded(
                      child: JelajahIcon('Sesuaikan Kebutuhan',
                          'assets/icon/userPref.png', 50.0))
                ],
              ),
            ],
          ),
        ));
  }
}
