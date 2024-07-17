import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants/user_list_constant.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

class ListItemWidget extends StatefulWidget {
  
  final PostModel item;
  const ListItemWidget ({required this.item});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
   late bool clikedHeart = true;
   late bool save = true;
   late int countLike = 0;
   @override
  void initState() {
    super.initState();
    countLike = widget.item.likeCount;
  }

  @override
  Widget build(BuildContext context) {

    UserModel user = userList.where((element) => element.id == widget.item.userIdFK).single;
    print(user);
    print(widget.item.image);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.item.image,
              imageBuilder: (context, imageProvider){
                return Container(
                  margin: EdgeInsets.all(5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.yellow,
                              Colors.red,
                              Colors.purpleAccent,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              placeholder: (context, url) => Container(color: Colors.green[50],),
              errorWidget: (context, url, error) {
                print("Error loading image: $error");
                return Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Failed to load image"),
                  ),
                );
              },

            ),
            Container(
              width: 300,
                child: Text("${user.name}",overflow: TextOverflow.ellipsis,),
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),),
          ],
        ),
      ),
          Container(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: widget.item.image,
            ),
          ),

      Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon( clikedHeart ? CupertinoIcons.heart : CupertinoIcons.heart_fill,),
                  onPressed: (){
                    setState(() {
                      clikedHeart =! clikedHeart;
                      if(!clikedHeart){
                        countLike++;
                      }else{
                        countLike--;
                      }
                    });
                  },
                ),

                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.chat_bubble,),),
                IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.telegramPlane),),
                Spacer(),
                IconButton(onPressed: (){
                  setState(() {
                    save =! save;
                    save == false;
                  });
                }, icon: Icon(save ?  CupertinoIcons.bookmark : CupertinoIcons.bookmark_fill,),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text("$countLike likes"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text("${widget.item.caption}"),
          ),
          Divider(color: Colors.grey[60]),
        ],
      ),
    );
  }
}
