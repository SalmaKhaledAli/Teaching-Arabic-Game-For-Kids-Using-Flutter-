import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:kidsgame/levelThree.dart';
import 'package:lottie/lottie.dart';

class LevelTwo extends StatefulWidget {
  @override
  _LevelTwoState createState() => _LevelTwoState();
}

class _LevelTwoState extends State<LevelTwo> {
  List<ItemModel> items;
  List<ItemModel>items2;

  int score;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame(){
    gameOver = false;
    score=0;
    items=[
      ItemModel(icon:'🐋' ,name:"حوت", value:"حوت"),
      ItemModel(icon: '🐟' ,name:"سمكة", value:"سمكة"),
      ItemModel(icon: '🐬',name:"دولفين", value:"دولفين"),
      ItemModel(icon:'🐙',name:"اخطبوط", value: "اخطبوط"),
      ItemModel(icon: '🐚',name:"محار", value:"محار"),
      ItemModel(icon: '🐢',name:"سلحفاه", value:"سلحفاه"),
      ItemModel(icon: '🦈',name:"قرش", value:"قرش"),
      ItemModel(icon: '🐌',name:"حلزون", value:"حلزون"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }


  @override
  Widget build(BuildContext context) {
    var player = AudioCache();
    if(items.length == 0)
      gameOver = true;
    return Scaffold(
      backgroundColor: Colors.blue,
      /**
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('المغامرة الاولى ', style: TextStyle(color: Colors.amber, fontSize: 33.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
            onPressed: () {}),
      ),
          **/
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/39814.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Score: "),
                    TextSpan(text: "$score", style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ))
                  ]
              )
              ),
              if(!gameOver)
                Row(
                  children: <Widget>[
                    Column(
                        children: items.map((item) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging:Movable(' '),
                              feedback: Movable(item.icon),
                              child: Movable(item.icon),
                            ),
                          );


                        }).toList()
                    ),
                    Spacer(

                    ),
                    Column(
                        children: items2.map((item){
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem){
                              if(item.value== receivedItem.value){
                                setState(() {
                                  player.play('win.mp3');

                                  items.remove(receivedItem);
                                  items2.remove(item);
                                  score+=10;
                                  item.accepting =false;
                                });

                              }else{
                                setState(() {
                                  player.play('fail.mp3');

                                  score-=5;
                                  item.accepting =false;

                                });
                              }
                            },
                            onLeave: (receivedItem){
                              setState(() {
                                item.accepting=false;
                              });
                            },
                            onWillAccept: (receivedItem){
                              setState(() {
                                item.accepting=true;
                              });
                              return true;
                            },
                            builder: (context, acceptedItems,rejectedItem) => Container(
                              color: item.accepting? Colors.blueAccent:Colors.blue,
                              height: 50,
                              width: 100,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8.0),
                              child: Text(item.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 18.0),),
                            ),


                          );

                        }).toList()

                    ),
                  ],
                ),
              if(gameOver)
            //  Lottie.asset('assets/35683-trophy.json'),

              Text("احسنت لقد اتممت المرحلة بنجاح", style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),),
              if(gameOver)
                Center(
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("انتقل للمرحلة التاليه"),
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelThree()),
                      );
                      /**

                      initGame();
                      setState(() {

                      });
                      **/
                    },
                  ),
                )

            ],
          ),

        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final String icon;
  bool accepting;

  ItemModel({this.name, this.value, this.icon, this.accepting= false});}

class Movable extends StatelessWidget{
  final String emoji ;
  Movable(this.emoji);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        //padding: EdgeInsets.all(15),
        child: Text(emoji, style: TextStyle(color: Colors.black, fontSize: 40.0),),
      ),
    );
  }
}