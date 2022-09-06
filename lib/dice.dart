import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  int left_dice = 1;
  int right_dice = 2;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('DiceGame'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image(image: AssetImage('image/dice1.png'),
                  //       width: 300,)
                  Expanded(
                      //flex: 2,
                      child: Image.asset('image/dice$left_dice.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      //flex: 1,
                      child: Image.asset('image/dice$right_dice.png')),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: RaisedButton(
                child: Icon(Icons.play_arrow,color: Colors.white,size: 50,),
                onPressed: () {
                  setState(() {
                    left_dice=Random().nextInt(6)+1;
                    right_dice=Random().nextInt(6)+1;
                  });
                  showToast("Left dice : ($left_dice), Right dice : ($right_dice)");
                },
                color: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.redAccent,
      toastLength: Toast.LENGTH_SHORT,  //지속시간
      gravity: ToastGravity.BOTTOM);    //출력위치
}

void flutterToast(){
  Fluttertoast.showToast(msg: 'Flluutteerr',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
  );
}