import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello Aymen,', style: AppWidget.boldTextFeildStyle()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Delicious Food',
              style: AppWidget.HeadlinTextFeildStyle(),
            ),
            Text('Discover and Get Great Food',
                style: AppWidget.LightTextFeildStyle()),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: showItem(),
            ),
            const SizedBox(height: 30.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFoodCard(
                    imagePath: "images/salad2.png",
                    title: "Veggie Taco Hash",
                    description: "Fresh and Healthy",
                    price: "\$25",
                  ),
                  const SizedBox(width: 15.0),
                  buildFoodCard(
                    imagePath: "images/salad2.png",
                    title: "Mix Veg Salad",
                    description: "Spicy with Onion",
                    price: "\$28",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/salad.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Mediterranean Chickpea Salad",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Honey Goat Cheese",
                              style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$28",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFoodItem(
          "images/ice-cream.png",
          isSelected: icecream,
          onTap: () {
            setState(() {
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
            });
          },
        ),
        buildFoodItem(
          "images/pizza.png",
          isSelected: pizza,
          onTap: () {
            setState(() {
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
            });
          },
        ),
        buildFoodItem(
          "images/salad.png",
          isSelected: salad,
          onTap: () {
            setState(() {
              icecream = false;
              pizza = false;
              salad = true;
              burger = false;
            });
          },
        ),
        buildFoodItem(
          "images/burger.png",
          isSelected: burger,
          onTap: () {
            setState(() {
              icecream = false;
              pizza = false;
              salad = false;
              burger = true;
            });
          },
        ),
      ],
    );
  }

  Widget buildFoodItem(String imagePath,
      {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildFoodCard({
    required String imagePath,
    required String title,
    required String description,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              const SizedBox(height: 5.0),
              Text(
                description,
                style: AppWidget.LightTextFeildStyle(),
              ),
              const SizedBox(height: 5.0),
              Text(
                price,
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
