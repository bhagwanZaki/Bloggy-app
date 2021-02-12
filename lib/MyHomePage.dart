import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prj_1/databse.dart';
import 'post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';
//////////////////////////////////////////////////////////
///////////.//////// HOME PAGE ///////////////////////////
//////////////////////////////////////////////////////////

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    // savePost(post);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  void updatePost() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePost();
  }

  @override
  Widget build(BuildContext context) {
    // scaffold is a widget that holds other widget in it
    return Scaffold(
        appBar: AppBar(title: Text('Bloggy',style: TextStyle(color: Colors.white),)),
        body: Column(children: <Widget>[
          Expanded(
              child: PostList(this.posts,
                  widget.user)), //expanded fill the widget as large as possible
          TextInputWidget(this.newPost),
        ]));
  }
}
