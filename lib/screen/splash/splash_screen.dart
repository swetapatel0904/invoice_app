import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:3),()=>Navigator.pushReplacementNamed(context, 'sign'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo2.jpg",height: 100,width: 100),
              const SizedBox(height: 10,),
              const Text("Invoice Generator",
                style: TextStyle(
                    fontSize: 18,color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )
    );
  }
}
