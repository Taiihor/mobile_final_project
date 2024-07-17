
import 'package:clone_ig/models/post_model.dart';
import 'package:flutter/foundation.dart';

class PostLogic extends ChangeNotifier{
  List<PostModel> _favoriteList =[];
  List<PostModel> get favorite => _favoriteList;

  void addPostToFavorite(PostModel post){
    _favoriteList.add(post);
    notifyListeners();
  }
  void removePostFromFavorite(PostModel post){
    _favoriteList.remove(post);
    notifyListeners();
  }
  bool isFavorite(PostModel post){
    return _favoriteList.contains(post);
  }
  bool isFavoriteListEmpty(){
    return _favoriteList.isEmpty;
  }
}