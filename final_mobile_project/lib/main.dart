import 'package:final_mobile_project/screens/login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logics/login_logic.dart';
import 'logics/post_logic.dart';

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
