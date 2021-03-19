import 'package:findlaundry/main.dart';
import 'package:flutter/material.dart';
import 'EditProfile.dart';
import 'logAktivitas.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // String _email = "iniemailku@email.mail";
  // String _tlp = "+62 821-0862-9371";
  List _data = ["iniemailku@email.mail", "+62 821-0862-9371"];

  Future _openProfileEdit(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(
                  currentEmail: _data[0],
                  currentTlp: _data[1],
                )));

    setState(() {
      _data = result ?? _data;
      _data[0] = _data[0];
      _data[1] = _data[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 55, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileContainer(_data[0], _data[1]),
          Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Container(
                margin: EdgeInsets.only(top: 15, left: 15),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.account_circle_sharp,
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        child: Text("Edit Profile"),
                        onPressed: () {
                          _openProfileEdit(context);
                        },
                      ),
                    )
                  ],
                ),
              )),
          ProfileMenuItem("Tokoku", Icons.store),
          ProfileMenuItem("Alamat", Icons.house),
          ProfileMenuItem("Log Aktivitas", Icons.history, page: LogAktivitas()),
          ProfileMenuItem("Log Out", Icons.logout, page: MyApp())
        ],
      ),
    ));
  }
}

class ProfileContainer extends StatelessWidget {
  final String email;
  final String tlp;

  ProfileContainer(this.email, this.tlp);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Image.asset(
            'assets/images/af9.jpg',
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Katya Lischina",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            email,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          child: Text(
            tlp,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    ));
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String caption;
  final IconData menuIcon;
  final page;

  ProfileMenuItem(this.caption, this.menuIcon, {Key key, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Container(
          margin: EdgeInsets.only(top: 15, left: 10, bottom: 5),
          child: Row(
            children: [
              Container(
                child: Icon(
                  menuIcon,
                ),
              ),
              Container(
                child: FlatButton(
                    child: Text(caption),
                    onPressed: () {
                      page == null
                          ? ""
                          : Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => page),
                            );
                    }),
              )
            ],
          ),
        ));
  }
}
