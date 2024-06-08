

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _key=GlobalKey<FormState>();
    final emailController=TextEditingController();
    final nameController=TextEditingController();
    final passwordController=TextEditingController();
    final confirmPasswordController=TextEditingController();
    return Scaffold(
      body:Form(
        key: _key,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Register",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.green,fontWeight: FontWeight.bold),),
                TextFormField(
                  validator: (value){
                    ///////
                    if(value==null ||value!.isEmpty){
                      return 'Enter your Name';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "name"
                  ),
                ),
                TextFormField(
                  validator: (value){
                    ///////
                    if(value==null ||value!.isEmpty){
                      return 'Enter your Email';
                    }
                    return null;
                  },
                  controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                        focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "email"
                    ),
                ),

                TextFormField(
                  validator: (value){
                    ///////
                    if(value==null || value!.isEmpty){
                      return 'Enter your Password';
                    }
                    if(value!.length<6){
                      return 'your password is too short';
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "password"
                  ),
                ),

                TextFormField(
                  controller: confirmPasswordController,
                  validator: (vaule){
                    if(vaule==null || vaule.isEmpty){
                      return 'Please enter confirmed password';
                    }
                    if(vaule != passwordController.text){
                      return 'Not matched';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "confirm password"
                  ),
                ),
                InkWell(
                  onTap: (){
                    if (_key.currentState!.validate()) {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((value) => {
                        FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set({"email":emailController.text,"name":nameController.text}),
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen())),
                       }).catchError((error) => {

                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                          content: Text(error.message),
                          ))

                      });
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5),),child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text("Register")),
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
