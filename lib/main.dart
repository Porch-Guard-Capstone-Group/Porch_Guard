import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porchguard/controller/authenticate.dart';
import 'package:porchguard/view/Sign_In/signin.dart';
import 'package:porchguard/view/base/base.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  String textValue = 'Hello World';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
  void initState(){
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg){
        print(" onLaunch called");
      },
      onResume: (Map<String, dynamic> msg){
        print("onResume called");
      },
      onMessage: (Map<String, dynamic> msg){
        print(" onMessage called $msg");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true,
      )
    );
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("IOS Settings Registered");
    });
    firebaseMessaging.getToken().then((token){
      update(token);
    });
  }

  update(String token){
    print("Token" + token);
    textValue = token;
    setState((){});
  }
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
