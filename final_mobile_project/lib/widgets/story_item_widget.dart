import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../screens/screens_of_main_pages/view_story.dart';


class StoryItemWidget extends StatelessWidget {
  final UserModel item;

  const StoryItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewStory(
                  imageUrl: item.image,
                  user: item,
                ),
              ),
            );
          },
          child: CachedNetworkImage(
            imageUrl: item.image,
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
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
                      width: 80,
                      height: 80,
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
            placeholder: (context, url) => Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[50],
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: Icon(Icons.error, color: Colors.red),
            ),
          ),
        ),
        Container(
          width: 90,
          height: 20,
          child: Text(
            item.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
