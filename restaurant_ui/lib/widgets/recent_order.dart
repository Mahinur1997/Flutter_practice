import 'package:day23/data/data.dart';
import 'package:day23/models/order.dart';
import 'package:flutter/material.dart';

class RecentOrder extends StatefulWidget {
  const RecentOrder({Key? key}) : super(key: key);

  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
  buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 320,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage('${order.food!.imageUrl}'),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${order.food!.name}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${order.restaurant!.name}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${order.date}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Order',
          style: TextStyle(fontSize: 20.0),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];

                return buildRecentOrder(context, order);
              }),
        ),
      ],
    );
  }
}
