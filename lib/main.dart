import 'app.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Laundry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginRoute(),
    );
  }
}

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  bool termVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/laundryMachine.png',
                  width: 200,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'BERSIH BERSIH',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 45),
                  child: Text(
                    'Cuci baju praktis ga pake ribet di FIND LAUNDRY aja',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ButtonFunct(
                  'assets/icon/google.jpg',
                  'Lanjut dengan Google',
                  Color(0xFF42A5F5),
                ),
                ButtonFunct(
                  'assets/icon/mail.png',
                  'Lanjut dengan Email',
                  Color(0xFF00BFA5),
                ),
                ButtonFunct(
                  'assets/icon/fbicon.png',
                  'Lanjut dengan Facebook',
                  Color(0xFF01579B),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 14),
                  child: Row(children: [
                    Checkbox(
                      value: termVal,
                      onChanged: (bool value) {
                        setState(() {
                          termVal = value;
                        });
                      },
                    ),
                    Text(
                      'Terima promosi & pemasaran dari FIND LAUNDRY',
                      style: TextStyle(fontSize: 11),
                    ),
                  ]),
                ),
              ]),
        ],
      ),
    );
  }
}

// BUTTON FUNCTION
class ButtonFunct extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final Color primColor;

  ButtonFunct(this.imageUrl, this.caption, this.primColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        width: 310,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primColor, // background
            onPrimary: Colors.white, // foreground
          ),
          child: Row(children: [
            Container(
              margin: EdgeInsets.only(
                top: 3,
                right: 60,
                bottom: 3,
                left: 1,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  imageUrl,
                  width: 32,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Center(
                child: Text(caption,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ))),
          ]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => App()),
            );
          },
        ));
  }
}
