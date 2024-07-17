import 'package:clone_ig/logics/login_logic.dart';
import 'package:clone_ig/logics/post_logic.dart';
import 'package:clone_ig/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginLogic()), //use for change 1 file to new another file
        ChangeNotifierProvider(create: (context) => PostLogic()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
