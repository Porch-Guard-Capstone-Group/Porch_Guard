import 'package:flutter/material.dart';
class Base extends StatefulWidget{
  //Base({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _BaseState createState() => _BaseState();

}

class _BaseState extends State<Base>{
  int _currentIndex = 0;
  String title = 'Home';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded),
              title: Text('Delivery'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Accounts'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              backgroundColor: Colors.blue
          ),
          
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
            if(_currentIndex == 0){
              title = 'Home';
            }else if(_currentIndex == 1){
              title = 'Delivery';
            }else if(_currentIndex == 2){
              title = 'Accounts';
            }else {
              title = 'Settings';
            }
          });
        },

      ),
    );
  }


}

