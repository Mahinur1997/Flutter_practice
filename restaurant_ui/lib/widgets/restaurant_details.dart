import 'package:day23/data/data.dart';
import 'package:day23/models/food.dart';
import 'package:day23/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestauarantDetails extends StatefulWidget {
  Restaurant? restaurant;

  RestauarantDetails({this.restaurant});

  @override
  State<RestauarantDetails> createState() => _RestauarantDetailsState();
}

class _RestauarantDetailsState extends State<RestauarantDetails> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage(
                    '${menuItem.imageUrl}',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${menuItem.name}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text('\$ ${menuItem.price}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 210,
                width: MediaQuery.of(context).size.width,
                image: AssetImage('${widget.restaurant!.imageUrl}'),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      color: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.restaurant!.name}'),
                  Text('${widget.restaurant!.address}'),
                ],
              ),
              Text('0.2 Miles'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(child: Text('Contact')),
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(child: Text('Review')),
              ),
            ],
          ),
          Text(
            'Menu',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant!.menu!.length, (index) {
                Food food = widget.restaurant!.menu![index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
