import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
//Add shoe to cart
  void AddShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);


    //alert the user, shoe successfully
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Successfully added"),
      content: Text("Check your cart "),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>Column(
      children: [
        //Search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Search",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        //Message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "Everyone flies.. some fly longer than others",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        // hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Hot Picks  🔥",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "See All",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        // List of shoes for sale
        Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // create a shoe
                  //get a shoe from shop list
                  Shoe shoe = value.getShoeList()[index];
                  //Return the shoe
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => AddShoeToCart(shoe),
                  );
                })),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    ),);
  }
}
