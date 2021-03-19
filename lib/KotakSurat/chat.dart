import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  String namaToko;

  Chat(this.namaToko);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // TextEditingController _controller = new TextEditingController();
  List<String> listMessage = [];

  void onPressedKirim(value) {
    setState(() {
      listMessage.add(value);
    });
  }

  Widget getTextWidgets(List<String> strings) {
    return new Column(
        children: strings.map((item) => new ChatContent(item)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.namaToko)),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
        child: ListView(
          children: [
            Container(
                alignment: Alignment.bottomRight,
                width: 310,
                height: 560,
                child: ListView(
                  reverse: true,
                  children: <Widget>[
                    for (var item in listMessage) ChatContent(item)
                  ],
                )),
            ChatTextfield(onPressedKirim, listMessage)
          ],
        ),
      ),
    );
  }
}

class ChatTextfield extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();
  List<String> listMessage;
  final kirim;

  ChatTextfield(this.kirim, this.listMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 230,
            height: 40,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                labelText: 'Tulis Pesanmu Disini',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: ElevatedButton(
                child: Text("Kirim"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, onPrimary: Colors.white),
                onPressed: () => {kirim(_controller.text)}),
          ),
        ],
      ),
    );
  }
}

class ChatContent extends StatelessWidget {
  String message;

  ChatContent(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,

      width: 200,
      // alignment: Alignment.topRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.blue, onPrimary: Colors.white),
        child: Text(
          message,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}

// class StoreProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20),
//       height: 80,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10)),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 3,
//                 offset: Offset(0, 8))
//           ]),
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 11),
//             child: ClipRRect(
//               child: Image.asset(
//                 "assets/images/toko1.jpg",
//                 width: 70,
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 13),
//             width: 200,
//             child: Text(
//               'Laundry refers to the washing of clothing and other textiles.'
//               'Laundry processes are often done in a room reserved for that'
//               'purpose; in an individual home this is referred to as a laundry',
//               overflow: TextOverflow.ellipsis,
//               maxLines: 3,
//               textAlign: TextAlign.justify,
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
