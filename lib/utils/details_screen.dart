// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:furniture_app/home_page.dart';
import 'package:furniture_app/utils/cart.dart';
import 'package:furniture_app/utils/product.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final String itemId;
  final String itemPrice;
  final String itemName;
  final String imagepath;
  final String description;
  void Function()? onPressed;

  DetailsScreen({
    super.key,
    required this.itemId,
    required this.itemPrice,
    required this.itemName,
    required this.imagepath,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
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
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Builder(builder: (context) {
          return Consumer<Product>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 500,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 27,
                                          color: Colors.black12,
                                        ),
                                      ]),
                                  child: Stack(
                                    children: [
                                      Hero(
                                        tag: itemId,
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.asset(
                                              imagepath,
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                itemName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                description,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Center(
                                child: Text(
                                  itemPrice,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const HomePage();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Back To Home",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }));
  }
}
