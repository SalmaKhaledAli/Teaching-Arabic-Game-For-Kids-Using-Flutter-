import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsgame/Choices.dart';
import 'package:kidsgame/levelOne.dart';
import 'package:kidsgame/map.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(
           image: DecorationImage(
               image: AssetImage("assets/44780.jpg"), fit: BoxFit.cover)),

       child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
             color: Colors.lightGreen,
             width: 850,
             child: Center(
               child: Text(
                 'رحلة المعرفة',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize:60.0,
                 ),
               ),
             ),
           ),
           Container(

             child:  MaterialButton(
               textColor: Colors.white,
               splashColor: Colors.greenAccent,
               child: Container(
                 width: 300,
                 height: 80,
                 margin: new EdgeInsets.all(10.0),
                 padding: EdgeInsets.all(15.0),


                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage('assets/wood1.jpg'),
                       fit: BoxFit.cover),
                 ),
                   child: Text("لعبة الخيارات",
                     textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black ,),

                   ),

               ),
               // ),
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Level1()),
                 );
               },
             ),
           ),
           Container(

             child:  MaterialButton(
               textColor: Colors.white,
               splashColor: Colors.greenAccent,
               child: Container(
                 width: 300,
                 height: 80,
                 margin: new EdgeInsets.all(10.0),
                 padding: EdgeInsets.all(15.0),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage('assets/wood1.jpg'),
                       fit: BoxFit.cover),
                 ),

                 child: Text("لعبة التوصيل",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black ,),
                 ),
               ),
               // ),
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Map()),
                 );
               },
             ),
           ),
         ],
       ),
     ),




    );

  }
}
