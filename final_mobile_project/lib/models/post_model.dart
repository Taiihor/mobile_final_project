class PostModel {
  int postId;
  int userIdFK;
  String caption;
  String image;
  int likeCount;

  PostModel ({
    required this.postId,
    required this.userIdFK,
    this.caption = "no-tittle",
    this.image = "no-image",
    this.likeCount =0,
  });
}
