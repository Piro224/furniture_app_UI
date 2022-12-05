// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:furniture_app/utils/details_screen.dart';

class ProductCard extends StatelessWidget {
  final String itemId;
  final String itemPrice;
  final String itemName;
  final String imagepath;
  final String description;
  void Function()? onPressed;

  ProductCard({
    Key? key,
    required this.itemIndex,
    required this.itemId,
    required this.itemPrice,
    required this.itemName,
    required this.imagepath,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 160,
      // color: Colors.blueAccent,
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailsScreen(
                  itemId: itemId,
                  itemName: itemName,
                  itemPrice: "\$$itemPrice",
                  imagepath: imagepath,
                  description: description,
                  onPressed: onPressed,
                );
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: itemIndex.isEven ? Colors.lightBlue : Colors.amber,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 27,
                    color: Colors.black12,
                  )
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                height: 136,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 160,
                width: 200,
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        itemName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: Text(
                            "\$$itemPrice",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20 / 7),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: onPressed,
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
