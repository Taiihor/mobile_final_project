

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';


class ViewStory extends StatefulWidget {
  final String imageUrl;
  final UserModel user;

   ViewStory({required this.imageUrl, required this.user});

  @override
  State<ViewStory> createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  late bool clickedHeart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildMessageBar(),
          ),
        ],
      ),

    );
  }

  AppBar  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: CachedNetworkImage(
        imageUrl: widget.user.image,
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: EdgeInsets.all(10),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) => Container(
          color: Colors.green[50],
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.yellow,
        ),
      ),
      title: Text(widget.user.name,style: TextStyle(fontSize: 12,color: Colors.white),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.clear, size: 24,))
      ],
    );
  }

  Widget _buildMessageBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.black.withOpacity(0.7),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Send message...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.black.withOpacity(0.2),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey, // Border color when enabled
                    width: 1, // Border width when enabled
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey, // Border color when focused
                    width: 1, // Border width when focused
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(onPressed: (){
            setState(() {
              clickedHeart =! clickedHeart;
            });
          }, icon: Icon(clickedHeart ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
              color: clickedHeart ? Colors.red : Colors.white,),
          SizedBox(width: 10),
          Icon(CupertinoIcons.paperplane, color: Colors.white),
        ],
      ),
    );
  }
}
