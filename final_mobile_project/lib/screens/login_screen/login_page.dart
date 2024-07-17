import 'package:clone_ig/constants/user_list_constant.dart';
import 'package:clone_ig/logics/login_logic.dart';
import 'package:clone_ig/models/user_model.dart';
import 'package:clone_ig/pages/main_screen/main_screen.dart';
import 'package:clone_ig/pages/screen_of_main_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  Widget get _buildBody{
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical:10 ),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purpleAccent,
            Colors.redAccent,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(child: _buildLoginPanel),
          _buildSignUp,
        ],
      ),
    );
  }
  Widget get _buildLoginPanel{
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context as BuildContext).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTittle,
            _buildUserNameTextField,
            _buildPasswordTextField,
            _buildLoginButton,
            _buildForgotLoginTextLink,
            _buildDividerOr,
            _buildLoginWithFacebook,
          ],
        ),
      ),
    );
  }
  Widget get _buildTittle{
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      child: Text(
        "Instagram",
        style: TextStyle(
          fontSize: 35,
          fontFamily: "Vegas",
          color: Colors.white70,
        ),
      ),
    );
  }
  // TextEditingController _usernameCtrl = TextEditingController(text: "ronaldo@gmail.com");  //controller use for match data in username and data in user_list
  // TextEditingController _passwordCtrl = TextEditingController(text: "ronaldo7");
  TextEditingController _usernameCtrl = TextEditingController();  //controller use for match data in username and data in user_list
  TextEditingController _passwordCtrl = TextEditingController();
  Widget get _buildUserNameTextField{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white24,
      ),
      child: TextField(
        controller: _usernameCtrl,
        style: TextStyle(fontSize: 20, color: Colors.white),
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(fontSize: 20,color: Colors.white60),
          border: InputBorder.none,
        ),
      ),
    );
  }
  bool _hide = true;
  Widget get _buildPasswordTextField{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white24,
      ),
      child: TextField(
        controller: _passwordCtrl,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 20, color: Colors.white60),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _hide =! _hide;
              });
            },
            icon: Icon(_hide ? Icons.visibility : Icons.visibility_off , color: Colors.white70,),
          ),
        ),
        obscureText: _hide,
      ),
    );
  }
  Widget get _buildLoginButton{
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 50,
      width: 500,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ), 
        onPressed: () {
          if (_usernameCtrl.text.isEmpty || _passwordCtrl.text.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username and Password are required")));
          }else{
            List<UserModel> foundList = userList
                .where((element) =>
            element.email == _usernameCtrl.text.toLowerCase().trim() &&
                element.password == _passwordCtrl.text)
                .toList();
            if(foundList.isEmpty){
              ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text("Username or password is incorrect")));
            }else{
              context.read<LoginLogic>().setLoggedInUser(foundList[0]); //add element to LoginLogic

              Navigator.of(context as BuildContext).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MainScreenPage(),
                  )  //Navigator use for change to next page or file
              );
            }
          }
        },
        child: Text(
            "Log In",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
  Widget get _buildForgotLoginTextLink{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical:10 ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Forgot your login details?",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              Text(" Get help signing in.",
                style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
    );
  }
  Widget get _buildDividerOr{
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Divider(
            color: Colors.white70,
          ),
          Text("OR", style: TextStyle(fontSize: 18, color: Colors.white70),),
        ],
      ),
    );
  }
  Widget get _buildLoginWithFacebook{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical:10 ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.facebookSquare, color: Colors.white, size: 30,),
            SizedBox(width: 10,),
            Text("Log in with Facebook",
              style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
  Widget get _buildSignUp{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.white70,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16,color: Colors.white70),
                ),
                Text(
                  " Sign Up.",
                  style: TextStyle(fontSize: 16,color: Colors.white70,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
