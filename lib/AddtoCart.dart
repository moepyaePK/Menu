import 'package:flutter/material.dart';
import 'package:flutter_application_1/menupage.dart';
import 'package:provider/provider.dart';
import 'food.dart';
import 'main.dart';
import 'menuDetail.dart';
import 'shop.dart';

class addtocart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        final cart = shop.cart;

        if (cart.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPage()));
                },
              ),
              title: const Text("Order List"),
              backgroundColor: Color.fromRGBO(242, 231, 231, 1),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      "No item in the cart.",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          Map<String, Map<String, dynamic>> itemCountMap = {};
          cart.forEach((food) {
            if (itemCountMap.containsKey(food.name)) {
              itemCountMap[food.name]!['count'] =
                  (itemCountMap[food.name]?['count'] ?? 0) + 1;
            } else {
              itemCountMap[food.name] = {
                'count': 1,
                'imagePath': food.imagePath,
              };
            }
          });
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPage()));
                },
              ),
              title: const Text("Order List"),
              backgroundColor: Color.fromRGBO(242, 231, 231, 1),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemCount: itemCountMap.length,
                itemBuilder: (context, index) {
                  final String itemName = itemCountMap.keys.toList()[index];
                  final int itemCount = itemCountMap[itemName]?['count'] ?? 0;
                  final String imagePath =
                      itemCountMap[itemName]?['imagePath'] ?? '';

                  // Now you have access to itemName, itemCount, and imagePath
                  // Use them to build your ListTile
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(imagePath),
                          Text(
                            itemName,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "count : " + itemCount.toString(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 13),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Get the first food item from the _foodMenu list
                              Food food = shop.foodMenu[index];

                              // Call the addToCart method with the selected Food instance
                              shop.addtocart(
                                  context, food, 1); // Increase count by 1
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Call a function to decrease the item count
                              // You can define this function in your Shop class
                              shop.decreaseItemCount(context, itemName,
                                  1); // Assuming quantity is always 1
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
