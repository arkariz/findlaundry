import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String currentEmail;
  final String currentTlp;

  EditProfile({Key key, @required this.currentEmail, @required this.currentTlp})
      : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _controllerEmail;
  TextEditingController _controllerTlp;

  @override
  void initState() {
    super.initState();
    _controllerEmail = new TextEditingController(text: widget.currentEmail);
    _controllerTlp = new TextEditingController(text: widget.currentTlp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profil")),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Email", style: TextStyle(fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: 230,
                  child: TextField(
                    controller: _controllerEmail,
                    style: TextStyle(
                      height: 1,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Nomor Telepon", style: TextStyle(fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 230,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controllerTlp,
                    style: TextStyle(
                      height: 1,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text(
                'Simpan',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                _sendDataBack(context);
              },
            )
          ],
        ),
      ),
    );
  }

  // get the text in the TextField and send it back to the FirstScreen
  void _sendDataBack(BuildContext context) {
    List textToSendBack = [_controllerEmail.text, _controllerTlp.text];
    Navigator.pop(context, textToSendBack);
  }
}
