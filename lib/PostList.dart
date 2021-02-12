import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'post.dart';
//////////////////////////////////////////////////////
///////// POST WIDGET ////////////////////////////////
//////////////////////////////////////////////////////

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;

  PostList(this.listItems, this.user);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Center(
            child: Card(
                  child: Column(children: <Widget>[
                    ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(post.userLiked.length.toString(),
                          style: TextStyle(fontSize: 20)),
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                    IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () => this.like(() => post.likePost(widget.user)),
                        color: post.userLiked.contains(widget.user.uid)
                            ? Colors.green
                            : Colors.black)
                  ],
                )
              ]
            )
          )
        );
      },
    );
  }

}

