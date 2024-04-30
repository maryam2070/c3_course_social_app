import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _key=GlobalKey<FormState>();
    final emailController=TextEditingController();
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
                  controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                        focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "email"
                    ),
                ),

                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "password"
                  ),
                ),

                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                      hintText: "confirm password"
                  ),
                ),
                InkWell(
                  onTap: (){
                    //todo register
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
