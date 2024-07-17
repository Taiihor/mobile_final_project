import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key,});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _globalKey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    // IconButton(onPressed: (){
                    //   _globalKey.currentState!.openDrawer();
                    // }, icon: Icon(Icons.menu),color: Colors.white,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.white,),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 50,
              //   child: ListView(
              //     padding: EdgeInsets.only(left: 10),
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       TextButton(onPressed: (){},
              //         child: Text("Messages",style: TextStyle(color: Colors.white, fontSize: 23)),),
              //       SizedBox(width: 25,),
              //       TextButton(onPressed: (){},
              //         child: Text("Online",style: TextStyle(color: Colors.grey, fontSize: 23)),),
              //       SizedBox(width: 25,),
              //       TextButton(onPressed: (){},
              //         child: Text("Group",style: TextStyle(color: Colors.grey, fontSize: 23)),),
              //       SizedBox(width: 25,),
              //       TextButton(onPressed: (){},
              //         child: Text("More",style: TextStyle(color: Colors.grey, fontSize: 23)),),
              //     ],
              //   ),
              // ),
            ],
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 20,right: 20),
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purpleAccent,
                    Colors.redAccent,
                  ],
                ),
                borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Favorite Contacts",style: TextStyle(color: Colors.white),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz, color: Colors.white,)),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BuildContactAvatar("Ronaldo", "ronaldo.jpeg"),
                        BuildContactAvatar("Messi", "messi.jpeg"),
                        BuildContactAvatar("Neymar", "neymar.webp"),
                        BuildContactAvatar("Haaland", "haaland.jpg"),
                        BuildContactAvatar("De Bruyne", "debruyne.jpg"),
                        BuildContactAvatar("Ramos", "ramos.jpg"),
                        BuildContactAvatar("Son", "son.jpg"),
                        BuildContactAvatar("Mbappe", "mbappe.jpg"),
                        BuildContactAvatar("Salah", "salah.jpg"),
                        BuildContactAvatar("Silva", "silva.jpg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              ),
              child: ListView(
                padding: EdgeInsets.only(left: 25,right: 25),
                children: [
                  BuildConversation("Ronaldo","Hello! How are you?","ronaldo.jpeg",0),
                  BuildConversation("Salah","Will you visit me?","salah.jpg",1),
                  BuildConversation("Mbappe","I am sleeping","mbappe.jpg",3),
                  BuildConversation("Son","I am in Seoul","son.jpg",2),
                  BuildConversation("Silva","Barrow money please.","silva.jpg",2),
                  BuildConversation("Messi","Love family!","messi.jpeg",0),
                  BuildConversation("Neymar","Hi!","neymar.webp",4),
                  BuildConversation("De Brunye","Can you play football?","debruyne.jpg",4),
                  BuildConversation("Haaland","Hello","haaland.jpg",0),
                  BuildConversation("Ramos","Bye bye!","ramos.jpg",2),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: 65,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {},
          child: Icon(Icons.edit_outlined,size: 25,),
        ),
      ),
      drawer: Drawer(
        width: 280,
        backgroundColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30,left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,),
                        SizedBox(width: 60,),
                        Text("Setting", style: TextStyle(color: Colors.white,fontSize: 15),)
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        UserAvatar(fileName: "son.jpg"),
                        SizedBox(width: 25,),
                        Text("Son Huang Min",style: TextStyle(color: Colors.white,fontSize: 15),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    DrawerItem(icon: Icons.key, tittle: "Account"),
                    DrawerItem(icon: Icons.chat, tittle: "Chats"),
                    DrawerItem(icon: Icons.notifications_active, tittle: "Notifications"),
                    DrawerItem(icon: Icons.storage, tittle: "Data and Storage"),
                    DrawerItem(icon: Icons.help, tittle: "Help"),
                    Divider(
                      height: 40,
                      color: Colors.green,
                      indent: 10,
                      endIndent: 30,
                    ),
                    DrawerItem(icon: Icons.people, tittle: "Invite a friends"),
                  ],
                ),
                DrawerItem(icon: Icons.logout, tittle: "Log out"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  BuildContactAvatar(String name, String filename){
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          UserAvatar(fileName: filename),
          SizedBox(height: 5,),
          Text(name, style: (TextStyle(color: Colors.white,fontSize: 15)),)
        ],
      ),
    );
  }
  BuildConversation(String name, String message, String filename, int msCount){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(fileName: filename),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text(message, style: TextStyle(color: Colors.black),),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text("16:35",style: TextStyle(color: Colors.grey,fontSize: 10),),
                SizedBox(height: 8,),
                if(msCount>0)
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                    child: Text(msCount.toString(),style: TextStyle(fontSize: 8,color: Colors.white),),
                  ),
              ],
            ),
          ],
        ),
        Divider(
          indent: 70,
          height: 20,
        ),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String fileName;
  const UserAvatar({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: Image.asset("assets/$fileName").image,
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String tittle;
  final IconData icon;
  const DrawerItem({super.key, required this.icon, required this.tittle,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(icon,color: Colors.white,size: 20,),
            SizedBox(width: 40,),
            Text(tittle,style: TextStyle(color: Colors.white,fontSize: 15),),
          ],
        ),
      ),
    );
  }
}



