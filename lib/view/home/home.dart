import 'package:flutter/material.dart';
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
                      onPressed: () async{
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
                      child: Text('TURN ON ALARM', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      onPressed: () async{
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
                      child: Text('TURN ON ACCELEROMETER', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      onPressed: () async{
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
                      child: Text('TURN ON MOTION SENSOR', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      onPressed: () async{
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
