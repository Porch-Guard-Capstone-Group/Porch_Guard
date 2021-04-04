import 'package:flutter/material.dart';
import 'package:porchguard/controller/statemachine.dart';
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:50),
                  child: ButtonTheme(
                    height: 50,
                    child:RaisedButton(
                      color: Colors.blue,
                      child: Text('TURN OFF ALARM', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      onPressed: () async { StateMachine().updateZero();
                      },
                    ) ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:50),
                  child: ButtonTheme(
                    height: 50,
                    child:RaisedButton(
                      color: Colors.blue,
                      child: Text('CONTINUE MONITORING', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      onPressed: () async { StateMachine().updateOne();
                      },
                    ) ,
                  ),
                )
              ],
            )
        ),
    );
  }
}
