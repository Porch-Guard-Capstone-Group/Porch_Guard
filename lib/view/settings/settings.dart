import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:porchguard/controller/authenticate.dart';
class Settings extends StatefulWidget{
  @override
  _SettingsState createState() => _SettingsState();

}
class _SettingsState extends State<Settings>{
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
                    child: Text('Sign Out', style: TextStyle(color: Colors.white, fontSize: 20,)),
                    onPressed: () async{
                      context.read<AuthenticationService>().signOut();
                    },
                  ) ,
                ),
              ),
            ],
          )
      ),
    );
  }
}