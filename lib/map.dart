import 'package:flutter/material.dart';
import 'package:kidsgame/home.dart';
import 'package:kidsgame/levelOne.dart';
import 'package:kidsgame/levelThree.dart';
import 'package:kidsgame/levelTwo.dart';

class Map extends StatefulWidget{
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/2693.jpg"), fit: BoxFit.cover)),

        child:Row(
      children: <Widget>[
             Container(
                 alignment: Alignment.bottomCenter,
                 padding: EdgeInsets.fromLTRB(40,0,0,60),
                 child: ClipOval(
                   child: Material(
                     color: Colors.blue,

                     child: InkWell(

                       splashColor: Colors.green, // inkwell color
                       child: Container(
                           child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_one, size: 24, color: Colors.white))),
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => LevelOne()),
                         );
                       },
                     ),
                   ),
                 )

             ),
        Container(
          padding: EdgeInsets.fromLTRB(0,5,60,20),
          alignment: Alignment.center,
          child: ClipOval(

            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: Container(

                    child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_two, size: 24, color: Colors.white))),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelTwo()),
                  );
                },
              ),
            ),
          ),
        ),
      Container(
        padding: EdgeInsets.fromLTRB(0,50,20,0),
        alignment: Alignment.topCenter,
        child: ClipOval(
          child: Material(
            color: Colors.blue, // button color
            child: InkWell(
              splashColor: Colors.green, // inkwell color
              child: Container(
                  child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_3, size: 24, color: Colors.white))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelThree()),
                );
              },
            ),
          ),
        ),
      ),

        Container(
          padding: EdgeInsets.fromLTRB(25,15,0,0),
          alignment: Alignment.topCenter,

          child: ClipOval(
            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: Container(

                    child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_4, size: 24, color: Colors.white))),
                onTap: () {},
              ),
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.fromLTRB(35,40,0,0),
          alignment: Alignment.topCenter,
          child: ClipOval(
            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: Container(

                    child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_5, size: 24, color: Colors.white))),
                onTap: () {},
              ),
            ),
          ),
        ),

        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(45,90,25,0),
              alignment: Alignment.topRight,
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.green, // inkwell color
                    child: Container(

                        child: SizedBox(width: 56, height: 56, child: Icon(Icons.looks_6, size: 24, color: Colors.white))),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0,140,0,0),
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 50),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
          ],
        ),
        /**
        Container(
          padding: EdgeInsets.fromLTRB(0,0,0,0),
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
            },
          ),
        ),
        **/

        ],),
        ),

    );






  }
}
