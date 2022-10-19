import 'package:flutter/material.dart';
import 'package:day23/data/data.dart';
import 'package:day23/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170,
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      '${order.food!.imageUrl}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${order.food!.name}'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('${order.restaurant!.name}'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                              Border.all(width: 1.20, color: Colors.black54)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTap: () {}, child: Text('-')),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Text(order.quantity.toString())),
                            SizedBox(
                              width: 20,
                            ),
                            Text('+')
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
          Text('\$ ${order.quantity! * order.food!.price!.toDouble()}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${currentUser.cart!.length}'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.cart![index];
              return buildCartItem(order);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: currentUser.cart!.length));
  }
}
