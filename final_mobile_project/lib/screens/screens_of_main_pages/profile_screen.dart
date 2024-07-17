import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Cute Cute', style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined,color: Colors.black54,),
            onPressed: () {
              // Add onPressed action
            },
          ),
          IconButton(
            icon: Icon(Icons.menu,color: Colors.black54,),
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4, // Number of tabs
        child: Column(
          children: [
            _buildProfileHeader(),
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.grid_on), text: 'Posts',),
                Tab(icon: Icon(Icons.live_tv), text: 'IGTV'),
                Tab(icon: Icon(Icons.bookmark), text: 'Saved'),
                Tab(icon: Icon(Icons.tag), text: 'Tagged'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPosts(),
                  _buildIGTV(),
                  _buildSavedPosts(),
                  _buildTaggedPosts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*'), // Replace with user's profile image
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Cute Cute', // Replace with actual username
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bio description...', // Replace with user's bio
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,right: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('7',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                      Text('posts')
                    ],
                  ),
                  SizedBox(width: 30,),
                  Column(
                    children: [
                      Text('10.5k',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                      Text('followers')
                    ],
                  ),
                  SizedBox(width: 30,),
                  Column(
                    children: [
                      Text('132',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                      Text('following')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts() {
    List<String> imageUrls = [
      'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
      'https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg',
      'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2023/07/top-20-small-dog-breeds.jpeg.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgDFp3dmPTGj1xOEuSlAt-ilTfBOmYfth5hQ&s',
      'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2020-06/angry_chihuahua.png?itok=TWxYDbOT',
      'https://www.princeton.edu/sites/default/files/styles/1x_full_2x_half_crop/public/images/2022/02/KOA_Nassau_2697x1517.jpg?itok=Bg2K7j7J',
      'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/09151144/Alaskan-Malamute-standing-in-the-grass1-400x267.jpg',
    ];

    return GridView.builder(
      itemCount: imageUrls.length, // Use the length of the image URL list
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 2, // Spacing between columns
        mainAxisSpacing: 2, // Spacing between rows
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: GridTile(
            child: Image.network(
              imageUrls[index], // Use the image URL at the current index
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }


  Widget _buildIGTV() {
    // Replace with IGTV content
    return Center(child: Text('IGTV Content',));
  }

  Widget _buildSavedPosts() {
    // Replace with saved posts content
    return Center(child: Text('Saved Posts Content'));
  }

  Widget _buildTaggedPosts() {
    // Replace with tagged posts content
    return Center(child: Text('Tagged Posts Content'));
  }
}

