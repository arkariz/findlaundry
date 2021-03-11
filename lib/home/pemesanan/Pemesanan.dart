import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pemesanan extends StatefulWidget {
  @override
  _PemesananState createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  bool _isTotalVisible = false;
  int _harga = 0;
  int _tarifCuci = 0;
  int _tarifCuciPerKg = 0;
  int _tarifSetrika = 0;
  int _tarifSetrikaPerKg = 0;
  int _jumlahCuciKilo = 1;
  int _jumlahSetrikaKilo = 1;
  String _valCuciKilo = "Pilih Paket";
  String _valSetrikaKilo = "Pilih Paket";
  List _listCuciKilo = ["Pilih Paket", "Biasa", "Express"];
  List _listSetrikaKilo = ["Pilih Paket", "Biasa", "Express"];

  void _onChanged() {
    setState(() {
      if (_tarifCuciPerKg | _tarifSetrikaPerKg == 0) {
        _isTotalVisible = false;
      } else {
        _isTotalVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              width: 500,
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Image.asset(
                          "assets/icon/electric_iron.png",
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, top: 15),
                        child: Text(
                          "Setrika Kiloan",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[500]),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DropdownButton(
                          hint: Text("Pilih Paket"),
                          value: _valSetrikaKilo,
                          items: _listSetrikaKilo.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valSetrikaKilo = value;

                              if (value == "Pilih Paket") {
                                _tarifSetrika = 0;
                              } else if (value == "Biasa") {
                                _tarifSetrika = 6000;
                              } else {
                                _tarifSetrika = 10000;
                              }
                              _tarifSetrikaPerKg =
                                  _tarifSetrika * _jumlahSetrikaKilo;
                              _harga = _tarifCuciPerKg + _tarifSetrikaPerKg;
                              _onChanged();
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 6, left: 20),
                          width: 48,
                          child: Image.asset(
                            "assets/icon/weigher.png",
                            width: 13,
                            fit: BoxFit.cover,
                          ),
                        ),
                        DropdownButton(
                          hint: Text("Pilih Jumlah"),
                          value: _jumlahSetrikaKilo,
                          items: Iterable<int>.generate(25, (i) => i + 1)
                              .toList()
                              .map((value) {
                            return DropdownMenuItem(
                              child: Text("$value Kg"),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _jumlahSetrikaKilo = value;
                              _tarifSetrikaPerKg =
                                  _tarifSetrika * _jumlahSetrikaKilo;

                              _harga = _tarifCuciPerKg + _tarifSetrikaPerKg;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
              width: 500,
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Image.asset(
                          "assets/icon/washer.png",
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, top: 15),
                        child: Text(
                          "Cuci Kiloan",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[500]),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DropdownButton(
                          hint: Text("Pilih Paket"),
                          value: _valCuciKilo,
                          items: _listCuciKilo.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valCuciKilo = value;

                              if (value == "Pilih Paket") {
                                _tarifCuci = 0;
                              } else if (value == "Biasa") {
                                _tarifCuci = 6000;
                              } else {
                                _tarifCuci = 10000;
                              }
                              _tarifCuciPerKg = _tarifCuci * _jumlahCuciKilo;
                              _harga = _tarifCuciPerKg + _tarifSetrikaPerKg;
                              _onChanged();
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 6, left: 20),
                          width: 48,
                          child: Image.asset(
                            "assets/icon/weigher.png",
                            width: 13,
                            fit: BoxFit.cover,
                          ),
                        ),
                        DropdownButton(
                          hint: Text("Pilih Jumlah"),
                          value: _jumlahCuciKilo,
                          items: Iterable<int>.generate(25, (i) => i + 1)
                              .toList()
                              .map((value) {
                            return DropdownMenuItem(
                              child: Text("$value Kg"),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _jumlahCuciKilo = value;
                              _tarifCuciPerKg = _tarifCuci * _jumlahCuciKilo;
                              _harga = _tarifCuciPerKg + _tarifSetrikaPerKg;
                              // ignore: unrelated_type_equality_checks
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              child: Container(
                margin: EdgeInsets.only(left: 6, top: 30),
                width: 320,
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
                child: Container(
                  margin: EdgeInsets.all(13),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(_valCuciKilo == "Pilih Paket"
                                ? ""
                                : ("Cuci " + _valCuciKilo)),
                          ),
                          Container(
                              child: Text(
                                  "${_tarifCuciPerKg == 0 ? "" : ("Rp " + _tarifCuciPerKg.toString())}")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(_valSetrikaKilo == "Pilih Paket"
                                ? ""
                                : ("Setrika " + _valSetrikaKilo)),
                          ),
                          Container(
                              child: Text(
                                  "${_tarifSetrikaPerKg == 0 ? "" : ("Rp " + _tarifSetrikaPerKg.toString())}")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            child: Text(
                              _harga == 0 ? "" : "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${_harga == 0 ? "" : ("Rp " + _harga.toString())}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 220),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: Text("test"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _isTotalVisible,
            ),
          ],
        ),
      ),
    );
  }
}
