import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LevelThree extends StatefulWidget {
  @override
  _LevelThreeState createState() => _LevelThreeState();
}

class _LevelThreeState extends State<LevelThree> {
  List<ItemModel> items;
  List<ItemModel>items2;
  var player = AudioCache();
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
      ItemModel(icon:'🚪' ,name:"باب", value:"باب"),
      ItemModel(icon: '⌛' ,name:"ساعة", value:"ساعة"),
      ItemModel(icon: '🖼️',name:"برواز", value:"برواز"),
      ItemModel(icon:'🕯️',name:"شمعة", value: "شمعة"),
      ItemModel(icon: '💡',name:"مصباح", value:"مصباح"),
      ItemModel(icon: '📚',name:"كتاب", value:"كتاب"),
      ItemModel(icon: '🔑',name:"مفتاح", value:"مفتاح"),
      ItemModel(icon: '🗺️',name:"خريطة", value:"خريطة"),
      ItemModel(icon: '☎️',name:"هاتف", value:"هاتف"),

    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    if(items.length == 0)
      gameOver = true;
    return Scaffold(
      backgroundColor: Colors.black26,
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
                image: AssetImage("assets/749.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Score: "),
                    TextSpan(text: "$score", style: TextStyle(
                      color: Colors.brown,
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
                                  score-=5;
                                  player.play('fail.mp3');
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
                              color: item.accepting? Colors.blueGrey:Colors.brown,
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
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),),
              if(gameOver)
                Center(
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.amber,
                    child: Text("انتقل للمرحلة التاليه"),
                    onPressed: ()
                    {
                      initGame();
                      setState(() {

                      });
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

class Movable extends StatelessWidget {
  final String emoji;

  Movable(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        //padding: EdgeInsets.all(15),
        child: Text(
          emoji, style: TextStyle(color: Colors.black, fontSize: 40.0),),
      ),
    );
  }
}