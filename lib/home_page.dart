// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:furniture_app/utils/body.dart';
import 'package:furniture_app/utils/cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar:  AppBar(
        centerTitle: false,
      title: const Text("Dashboard"),
      elevation: 0,
      backgroundColor: Colors.blue[900],
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CartPage();
                    },
                  ),
                );
          },
          icon: const Icon(
            Icons.shopping_bag,
          ),
        ),
      ],
    ),
      body: Body(),
    );
  }

 
    
  
}
