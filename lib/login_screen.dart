import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _key=GlobalKey<FormState>();
    final emailController=TextEditingController();
    final passwordController=TextEditingController();
    return Scaffold(
      body:Form(
        key: _key,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Login",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.green,fontWeight: FontWeight.bold),),

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
                InkWell(
                  onTap: (){
                    if (_key.currentState!.validate()) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                          .then((value) => {
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
                      child: Center(child: Text("Login")),
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
