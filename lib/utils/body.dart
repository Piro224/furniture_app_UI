// ignore_for_file: non_constant_identifier_names, prefer_equal_for_default_values

import 'package:flutter/material.dart';
import 'package:furniture_app/utils/product.dart';
import 'package:furniture_app/utils/product_card.dart';
import 'package:furniture_app/utils/search_field.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SearchField(
            onChanged: (value) {},
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40),
                    ),
                  ),
                ),
                Consumer<Product>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.products.length,
                      itemBuilder: ((context, index) => ProductCard(
                            itemIndex: index,
                            itemId: value.products[index][0],
                            itemPrice: value.products[index][1],
                            itemName: value.products[index][2],
                            imagepath: value.products[index][3],
                            description: value.products[index][4],
                            onPressed: () {
                              Provider.of<Product>(context, listen: false)
                                  .addCartItems(index);
                            },
                          )),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
