import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porchguard/controller/authenticate.dart';
import 'package:porchguard/view/Sign_In/signin.dart';
import 'package:porchguard/view/base/base.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

final app = Firebase.initializeApp(
  options: FirebaseOptions(
    appId: '1:10901268294:android:c8061bc437e6ca549a2747',
    apiKey: 'AIzaSyAW26H4MBObUxWNlR4-eBRKEBEAgglfgdc',
    databaseURL: 'https://porchguard-default-rtdb.firebaseio.com/',
  )
);
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Porch Guard',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ) ,
        home:AuthenticationWrapper(),
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null){
      return Base();
    }
    return SignInScreen();
  }
}
