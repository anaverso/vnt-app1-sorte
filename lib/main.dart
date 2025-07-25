import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _randomNumber = 0;
  var _text = '???';
  var _alert = '';
  final _numbers = [];

  void _generateRandom() {
    setState(() {
      _randomNumber = Random().nextInt(10) + 1;
      _text = _randomNumber.toString();

      if (_numbers.contains(_randomNumber)) {
        _alert = 'Número $_randomNumber já sorteado!';
      } else {
        _alert = '';
        _numbers.add(_randomNumber);
      }
    });
  }

  void _refresh() {
    setState(() {
      _text = '???';
      _alert = '';
      _numbers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          title: const Text(
            'Número da sorte 🎲',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hoje é seu dia de sorte! Clique no botão e confira!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        //blurRadius: 20,
                        //offset: Offset(10, 10),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.white54],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    _text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  _alert,
                  style: TextStyle(
                    color: Color(0xff8716d5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _generateRandom,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8716d5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 20,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('SORTE!'),
                  ),
                ),
                Text(
                  _numbers.isEmpty
                      ? ''
                      : 'Números já sorteados: \n${_numbers.toString()}',
                  style: TextStyle(
                    color: Color(0xff8716d5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _refresh,
          backgroundColor: Colors.black,
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}
