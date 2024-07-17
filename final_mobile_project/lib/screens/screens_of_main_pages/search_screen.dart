
import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = []; // Example: List of search results

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            height: 40,
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30),
                //   borderSide: BorderSide(
                //     color: Colors.transparent, // Border color
                //     width: 1, // Border width
                //   ),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.transparent, // Border color when enabled
                    width: 1, // Border width when enabled
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.transparent, // Border color when focused
                    width: 1, // Border width when focused
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchResults = _performSearch(value);
                });
              },
            ),
          ),
          actions: [
            TextButton(onPressed: (){FocusScope.of(context).unfocus();},
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10,top: 10),
                  child: Text('Cancel',style: TextStyle(fontSize: 16,color: Colors.black54),))),
          ],
        ),
        body: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_searchResults[index]),
              onTap: () {
                // Handle tapping on search result
                // Example: Navigate to a profile screen or detailed view
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Selected'),
                    content: Text('You tapped on: ${_searchResults[index]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<String> _performSearch(String query) {
    List<String> results = [];
    if (query.isNotEmpty) {
      for (int i = 0; i < 10; i++) {
        results.add('Result ${query.toUpperCase()} $i');
      }
    }
    return results;
  }
}
