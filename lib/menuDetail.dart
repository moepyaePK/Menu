import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:badges/badges.dart' as b1;
import 'package:provider/provider.dart';

import 'food.dart';
import 'shop.dart';
import 'foodDescription.dart';
import 'package:flutter_application_1/Mybutton.dart';
import 'package:flutter_application_1/AddtoCart.dart';
import 'menupage.dart';

class menuDetail extends StatefulWidget {
  final Food food;
  const menuDetail({super.key, required this.food});

  @override
  _menuDetailState createState() => _menuDetailState();
}

class _menuDetailState extends State<menuDetail> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void Addtocart() {
    if (_counter > 0) {
      final shop = context.read<Shop>();
      shop.addtocart(context, widget.food, _counter);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => addtocart()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
          ),
          backgroundColor: Color.fromRGBO(242, 231, 231, 1),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: b1.Badge(
                badgeContent: Text(
                  _counter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                position: b1.BadgePosition.topEnd(),
                showBadge: _counter == 0 ? false : true,
                child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => addtocart()));
                    }),
              ),
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.asset(
                      widget.food.imagePath,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: 'decrementicon',
                            onPressed: _decrementCounter,
                            tooltip: 'Decrement',
                            child: Icon(Icons.remove),
                            backgroundColor: Color.fromRGBO(248, 119, 74, 0.68),
                          ),
                          Text(
                            '$_counter',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          FloatingActionButton(
                            heroTag: 'incrementicon',
                            onPressed: _incrementCounter,
                            tooltip: 'Increment',
                            child: Icon(Icons.add),
                            backgroundColor: Color.fromRGBO(248, 119, 74, 0.68),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 330,
                        height: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(255, 255, 255, 0.60),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255,
                                0.60), // Specify your desired border color here
                            width: 2,
                          ),
                        ),
                        child: Text(
                          widget.food.ingredients,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                width: 150,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromRGBO(255, 255, 255, 0.60),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color.fromRGBO(255, 255, 255,
                                        0.60), // Specify your desired border color here
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.food.price + " baht",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Mybutton(text: "Add to cart", onTap: Addtocart),
                          ],
                        )))
                  ],
                ),
              )
            ])));
  }
}
