import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddtoCart.dart';
import 'package:flutter_application_1/CartModel.dart';
import 'package:flutter_application_1/menuDetail.dart';
import 'package:provider/provider.dart';
import 'FoodTile.dart';
import 'food.dart';
import 'main.dart';
import 'package:badges/badges.dart' as b1;
import 'shop.dart';
import 'package:flutter_application_1/AddtoCart.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void nav(BuildContext context, int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => menuDetail(
          // food: foodMenu[index],
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(242, 231, 231, 1),
          title: Text('Order Delicious Sushi!'),
          actions: <Widget>[
            Row(
              children: [
                Builder(
                  builder: (context) {
                    int _cartItemCount =
                        Provider.of<CartModel>(context).itemCount;
                    print('Cart count: $_cartItemCount');
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: b1.Badge(
                        badgeContent: Text(
                          _cartItemCount.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        position: b1.BadgePosition.topEnd(),
                        showBadge: _cartItemCount == 0
                            ? false
                            : true, // Show badge only if there are items in the cart
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addtocart()),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(children: [
                    Container(
                      child: Center(
                        child: Text("Today's menu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                    //have to insert arrow icon
                  ]),
                ),
              ),

              // SizedBox(
              //     height: 170,
              //     child: ListView.builder(
              //       scrollDirection: Axis.vertical,
              //       itemCount: foodMenu.length,
              //       itemBuilder: (context, index) => FoodTile(
              //         food: foodMenu[index],
              //         onTap: () => nav(context, index),
              //       ),
              //     )),
              SizedBox(
                height: 690,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: (foodMenu.length / 2).ceil(), // Adjusted itemCount
                  itemBuilder: (context, index) {
                    // Calculate the indexes for the pair of items
                    final firstIndex = index * 2;
                    final secondIndex = firstIndex + 1;

                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: FoodTile(
                              food: foodMenu[firstIndex],
                              onTap: () => nav(context, firstIndex),
                            ),
                          ),
                        ),
                        if (secondIndex <
                            foodMenu
                                .length) // Render the second item only if it exists
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: FoodTile(
                                food: foodMenu[secondIndex],
                                onTap: () => nav(context, secondIndex),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     child: Row(children: [
              //       Container(
              //         child: Text("Heroi Proud Special",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 18)),
              //       )
              //       //have to insert arrow icon
              //     ]),
              //   ),
              // ),
              //
              // SizedBox(
              //     height: 170,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: foodMenu2.length,
              //       itemBuilder: (context, index) => FoodTile(
              //         food: foodMenu2[index],
              //         onTap: () => nav(context, index),
              //       ),
              //     )),

              // SizedBox(
              //     height: 170,
              //     child: ListView(scrollDirection: Axis.horizontal, children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 150,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 150,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 150,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 150,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 150,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ])),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     child: Row(children: [
              //       Container(
              //         child: Text("Other Dishes",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 18)),
              //       )
              //       //have to insert arrow icon
              //     ]),
              //   ),
              // ),
              //
              // SizedBox(
              //     height: 100,
              //     child: ListView(scrollDirection: Axis.horizontal, children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 70,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 70,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 70,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 70,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           child: Column(
              //             children: [
              //               Container(
              //                 height: 70,
              //                 width: 150,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(
              //                     color: Color.fromRGBO(248, 119, 74,
              //                         0.68), // Specify your desired border color here
              //                     width: 2, // Specify the width of the border
              //                   ),
              //                 ),
              //                 child: Container(),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //  ])),
            ],
          ),
        ),
      ),
    );
  }
}
