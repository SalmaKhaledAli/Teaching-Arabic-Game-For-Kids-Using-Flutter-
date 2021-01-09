import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:animated_background/animated_background.dart';
import 'home.dart';
import 'package:pimp_my_button/pimp_my_button.dart';

class Level1 extends StatefulWidget {
  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1>with TickerProviderStateMixin {
  int index = 0;
  int score = 0;
  var player = AudioCache();
  var correct = ['فيل', 'طائرة', 'برتقال', 'قلم' , 'هدية', 'كوكب', 'نحلة'];
  var questions = [
    {
      'image': 'assets/elephant.png',
      'answers': ['فيل', 'زرافه', 'فراشة', 'أسد']
    },
    {
      'image': 'assets/plane.png',
      'answers': ['سيارة', 'طائرة', 'دراجة', 'قارب']
    },
    {
      'image': 'assets/orange.png',
      'answers': ['تفاح', 'برتقال', 'رمان', 'موز']
    },
    {
      'image': 'assets/pen.png',
      'answers': ['فرشة', 'قلم', 'مسطرة', 'كتاب']
    },
    {
      'image': 'assets/present.png',
      'answers': ['هدية', 'ساعة', 'كتاب', 'طاولة']
    },
    {
      'image': 'assets/planet.png',
      'answers': ['قمر', 'كوكب', 'سفينة', 'شمس']
    },
    {
      'image': 'assets/bee.png',
      'answers': ['عصفور', 'فراشة', 'نملة', 'نحلة']
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
        vsync: this,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Score:$score' ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
                    Text(
                      'اختر الاجابة الصحيحة',
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      child: Container(
                          height: 60,
                          child: Image(image: AssetImage('assets/x.png'))),
                      onTap: (){
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => Home()),);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Image(image: AssetImage(questions[index]['image'])),radius: 110,backgroundColor: Colors.white,),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...(questions[index]['answers'] as List<String>).map((answer) {
                      return RaisedButton(
                        onPressed: () {
                          if (answer == correct[index] ) {

                            player.play('win.mp3');
                            Alert(
                                context: context,
                                title: "أحسنت",
                                desc: "لقد انتقلت للمرحلة التالية"
                            ).show();
                            print('correct');
                            setState(() {
                              if(index < 6 )
                                index++;
                              score+=10;
                            });
                          }
                          else{
                            player.play('fail.mp3');
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            answer,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),

                        splashColor: Colors.black26,
                        focusColor: Colors.green,
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

