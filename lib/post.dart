import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prj_1/databse.dart';

class Post {
  String body;
  String author;
  Set userLiked = {};
  DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    if (this.userLiked.contains(user.uid)) {
      this.userLiked.remove(user.uid);
    } else {
      this.userLiked.add(user.uid);
    }
    this.update();
  }

  void update() {
    updatePost(this, this._id);
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'usersLiked': this.userLiked.toList(),
      'body': this.body
    };
  }
}

Post createPost(record) {
  Map<String, dynamic> attributes = {
    'author': '',
    'usersLiked': [],
    'body': '',
  };

  record.forEach((key, value) => {attributes[key] = value});
  print(attributes);
  Post post = new Post(attributes['body'], attributes['author']);
  post.userLiked = new Set.from(attributes['usersLiked']);
  return post;
}
