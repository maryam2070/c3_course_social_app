import 'package:c3_course_social_app/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset("assets/login.jpg"),
              ),
              Text("Welcome to our company", style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: (){
                  //todo navigation
                },
                child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5),),child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Login")),
                  ),),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(5),),child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Register")),
                  ),),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
