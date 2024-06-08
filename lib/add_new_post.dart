import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewPost extends StatelessWidget {
  const AddNewPost({super.key});

  @override
  Widget build(BuildContext context) {
    final postController=TextEditingController();
    final _key=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Add New Post"),centerTitle: true,),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 10),
              child: TextFormField(
                maxLines: 10,
                controller: postController,
                validator: (vaule){
                  if(vaule==null || vaule.isEmpty){
                    return 'Please enter post content';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                    focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                    hintText: "enter post content"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  if (_key.currentState!.validate()) {

                    //todo upload post

                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection("posts")
                        .add({"content":postController.text})
                    .then((value){
                      Navigator.of(context).pop();
                    })
                    .catchError((error){
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content: Text(error.message),
                      ));
                    });//todo add user name user image date

                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5),),child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Add Post")),
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
