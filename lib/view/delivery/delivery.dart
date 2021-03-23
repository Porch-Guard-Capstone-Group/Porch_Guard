import 'package:flutter/material.dart';
import 'package:porchguard/controller/delivery_retrieve.dart';
class Delivery extends StatefulWidget{
  @override
  _DeliveryState createState() => _DeliveryState();

}
class _DeliveryState extends State<Delivery>{
  @override
  Widget build(BuildContext context){
    final packages = ['assets/packages/package1.png', 'assets/packages/package2.png', 'assets/packages/package3.png', 'assets/packages/package4.png',
      'assets/packages/package5.png', 'assets/packages/package6.png', 'assets/packages/package1.png', 'assets/packages/package2.png', 'assets/packages/package3.png'];
    final provider = ['Package'];
    final deliveryDate = ['Thurs, 20 Nov 2020', 'Wed, 19 Nov 2020', 'Mon, 20 Sept 2020', 'Thurs, 30 Feb 2020',
      'Wed, 20 Nov 2019', 'Wed, 18 Nov 2018', 'Sat, 19 Dec 2018', 'Fri, 18 Dec 2018', 'Thurs, 17 Dec 2018'];
    final icons = [Icons.check_rounded, Icons.delivery_dining,
      Icons.cancel_outlined, Icons.check_rounded, Icons.check_rounded,
      Icons.check_rounded, Icons.check_rounded, Icons.check_rounded,
      Icons.check_rounded];
    final colors = [Colors.green, Colors.yellow,
      Colors.red, Colors.green, Colors.green,
      Colors.green, Colors.green, Colors.green,
      Colors.green];
    return ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
      return Card(
        child:ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: AssetImage('assets/sun.jpg'),
          // ),
          leading: Image.asset(packages[index],width: 80,height: 80,),
          title: Text(provider[0]),
          subtitle: Text(deliveryDate[index]),
          trailing: Icon(icons[index], color: colors[index],),
        ) ,
      );
      },
    );
  }
}