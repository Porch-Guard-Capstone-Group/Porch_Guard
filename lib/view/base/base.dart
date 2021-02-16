import 'package:flutter/material.dart';
import 'package:porchguard/view/accounts/accounts.dart';
import 'package:porchguard/view/delivery/delivery.dart';
import 'package:porchguard/view/home/home.dart';
import 'package:porchguard/view/settings/settings.dart';
class Base extends StatefulWidget{
  @override
  _BaseState createState() => _BaseState();

}

class _BaseState extends State<Base>{
  int _currentIndex = 0;
  String title = 'Home';
  Widget tabBody = Home();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: tabBody,
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
              tabBody = Home();
            }else if(_currentIndex == 1){
              title = 'Delivery';
              tabBody = Delivery();
            }else if(_currentIndex == 2){
              title = 'Accounts';
              tabBody = Accounts();
            }else {
              title = 'Settings';
              tabBody = Settings();
            }
          });
        },

      ),
    );
  }


}

