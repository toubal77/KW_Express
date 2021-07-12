import 'package:flutter/material.dart';
import 'package:kw_express/helper/icons_app.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Panier',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconsApp.goBack,
            color: Colors.white,
          ),
        ),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1 x Pizzas - Marqherita',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '400 DA',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                'SUPPRIMER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sous-Total:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '400 DA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Frais de livraison',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'A partir de 400 DA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total :',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '800 DA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'COMMANDER',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Divider(
//               height: 3,
//               color: Colors.grey,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Sous-Total:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   '400 DA',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Frais de livraison',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 13,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   'A partir de 400 DA',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 13,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total :',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   '800 DA',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Divider(
//               height: 3,
//               color: Colors.grey,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: Container(
//                 width: 130,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'COMMANDER',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),



      //  Container(
      //             padding: const EdgeInsets.all(10),
      //             margin: const EdgeInsets.all(8),
      //             width: MediaQuery.of(context).size.width,
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   blurRadius: 1,
      //                   offset: Offset(0, 1),
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       '1 x Pizzas - Marqherita',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.w900,
      //                         fontSize: 15,
      //                       ),
      //                     ),
      //                     Text(
      //                       '400 DA',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.w900,
      //                         fontSize: 15,
      //                         color: Colors.red,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Container(
      //                   width: 100,
      //                   height: 50,
      //                   decoration: BoxDecoration(
      //                     color: Colors.red,
      //                     borderRadius: BorderRadius.circular(40),
      //                   ),
      //                   child: Center(
      //                     child: Text(
      //                       'SUPPRIMER',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 13,
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),