import 'package:day23/data/data.dart';
import 'package:day23/models/restaurant.dart';
import 'package:day23/screens/cart_screen.dart';
import 'package:day23/widgets/recent_order.dart';
import 'package:day23/widgets/restaurant_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestauarantDetails(
                        restaurant: restaurant,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage('${restaurant.imageUrl}'),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${restaurant.name}'),
                  Text('${restaurant.address}'),
                  Text('0.2 miles'),
                ],
              )
            ],
          ),
        ),
      ));
    });

    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Delivery',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Text(
                '(${currentUser.cart!.length})',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search Food',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.close),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
          ),
          RecentOrder(),
          Column(
            children: [
              Text(
                'Near by Restaurant',
                style: TextStyle(fontSize: 20.0),
              ),
              buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}

class RestaurantDetails {}
