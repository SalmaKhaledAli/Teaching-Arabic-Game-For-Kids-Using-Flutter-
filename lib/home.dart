import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsgame/levelOne.dart';
import 'package:kidsgame/map.dart';


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

       child: SingleChildScrollView(
         padding: const EdgeInsets.all(16.0),
         child: Column(
         // crossAxisAlignment: CrossAxisAlignment.stretch,
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text(
               'رحلة المعرفة',
               style: TextStyle(
                 color: Colors.white ,
                 fontWeight: FontWeight.bold,
                 fontSize: 50.0,
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
                     child: Text("ابدأ الرحلة",
                       textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

                     ),

                 ),
                 // ),
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LevelOne()),
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

                   child: Text("خريطة الرحلة ",
                     textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
     ),




    );

  }
}
