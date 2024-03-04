
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class RecentOrder extends StatefulWidget {
  const RecentOrder({super.key});

  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
  @override
  Widget build(BuildContext context) {
    return  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            const Padding(padding: EdgeInsets.symmetric(horizontal:20 ,vertical: 15),
             child: Text(
                "Recent Order",
               style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.black45,
               ),
             ),
            ),
             SizedBox(
                height: 130,
               // color: Colors.blue,
                child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: currentUser.orders.length,
                    itemBuilder: (BuildContext context, int index){
                    Order order=currentUser.orders[index];
                     return _buildRecentOrder(order);

                    }),
             ),
         ],
    );
  }
     Widget _buildRecentOrder(Order order){
       return Container(
          width:300,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(
                   child:Row(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(12),
                          child: Image(
                             height: 100,
                             width: 100,
                            image: AssetImage(
                               order.food.imageUrl
                            ),
                             fit: BoxFit.cover,
                          ),
                       ),
                         Expanded(
                             child: Container(
                           margin: EdgeInsets.all(12),
                           child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Text(
                                  order.food.name,
                                 style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                                  // SizedBox(
                                  //    height: 4,
                                  // ),
                                Text(order.restaurant.name, style: TextStyle(
                                   fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                ),),
                               Text(order.date, style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                                 overflow: TextOverflow.ellipsis,
                               ),),
                             ],
                           ),
                         ),
                         ),
                     ],
                   ),
               ),
                  Container(
                     margin: EdgeInsets.only(right: 20),
                     decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(30)
                     ),
                      child: IconButton(
                         onPressed: (){},
                         icon: Icon(Icons.add),
                         iconSize: 30,
                         color: Colors.white,
                      ),
                  )
             ],
          ),
       );
     }
}
