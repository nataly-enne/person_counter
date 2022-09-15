import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(title: "Counter", 
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _person = 0;
  String _message = 'Can enter';

  void _changePerson(int delta){
    setState(() {
      _person += delta;
      if(_person >= 20){
        _message = 'Full, you cannot enter';
        _person = 20;
      } 
      else if (_person  < 0 ){
        _message = 'You may come in';
        _person = 0;
      }
      else {
        _message = 'Can enter';
      }
    });
  }
 
  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.webp",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Persons: $_person",
              style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: const Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changePerson(1);
                    },
                  ), 
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: const Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      ),
                      onPressed: () {
                        _changePerson(-1);
                      },
                    ), 
                  ),
              ],
            ),
            Text(
              _message,
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                decoration: TextDecoration.none
              ),
            ),
          ],
        )
      ],
    );
  }
}