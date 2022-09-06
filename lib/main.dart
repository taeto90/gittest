import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool emailField = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (ctx)=> GestureDetector(
          onTap: (){FocusScope.of(context).unfocus();},
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.red,
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(color: Colors.teal, fontSize: 25))),
                        child: Container(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            children: [
                              if(emailField)
                              TextField(
                                autofocus: true,
                                decoration: InputDecoration(labelText: 'Enter dice'),
                                keyboardType: TextInputType.emailAddress,
                                controller: controller1,
                                 key: ValueKey(1)
                              ),
                              TextField(
                                decoration: InputDecoration(labelText: 'Enter password'),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                key: ValueKey(2),
                                controller: controller2,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              ButtonTheme(
                                  minWidth: 100,
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.purple,
                                        minimumSize: Size(150,50)
                                      ),
                                      child: Icon(
                                        //Icons.arrow_forward,
                                        Icons.visibility_off,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        if(controller1.text == 'dice' && controller2.text == '1323'){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>Dice()));
                                        } if(controller1.text =='dice' && controller2.text !='1323'){
                                          showSnackBar2(ctx);
                                        } if(controller1.text !='dice' && controller2.text =='1323'){
                                          showSnackBar3(ctx);
                                        }else {showSnackBar1(ctx);}
                                        setState(() {
                                          //emailField = false;
                                        });
                                      })),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
        )
      ),
    );
  }
}
void showSnackBar1(BuildContext context){
  Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('로그인정보를 다시 확인하세요',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,));
}

void showSnackBar2(BuildContext context){
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('비밀번호가 일치하지않습니다',
      textAlign: TextAlign.center,),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,));
}

void showSnackBar3(BuildContext context){
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('dice의 철자를 확인하세요',
      textAlign: TextAlign.center,),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,));
}


