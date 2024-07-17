
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/post_list_constant.dart';
import '../../constants/user_list_constant.dart';
import '../../logics/login_logic.dart';
import '../../widgets/list_item_widget.dart';
import '../../widgets/story_item_widget.dart';
import '../chat_screen/chat_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fullName = "";


  @override
  Widget build(BuildContext context) {
    _fullName = context.select<LoginLogic, String>((logic) => logic.fullName);

    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "Instagram",
        style: TextStyle(fontFamily: "Vegas", color: Colors.black87, fontSize: 25),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.heart, color: Colors.black87, size: 25),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          },
          icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black87, size: 25),
        ),
      ],
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: _buildMainListview,
    );
  }

  Widget get _buildMainListview {
    return ListView(
      children: [
        _buildStory,
        Divider(color: Colors.grey),
        _buildListview,
      ],
    );
  }

  Widget get _buildListview {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: postList.length,
      itemBuilder: (context, index) {
        return ListItemWidget(item: postList[index]);
      },
    );
  }

  Widget get _buildStory {
    return Container(
      alignment: Alignment.center,
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return StoryItemWidget(
            item: userList[index],
          );
        },
      ),
    );
  }

}
