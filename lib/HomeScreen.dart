import 'package:c3_course_social_app/add_new_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AddNewPost()));
      },child: Icon(Icons.add),),
      body: Column(

      ),
    );
  }
}
