import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/helper/icons_app.dart';

class ServiceClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Espace Client',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 6.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.5,
                    offset: Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconsApp.contact,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Contact Direct'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconsApp.resto,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Nouveau Restaurant'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconsApp.bug,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Bug'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconsApp.recla,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Reclamation'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            IconsApp.sugg,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Nouveau Restaurant'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'powerdBy',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'CedarvilleCursive-Regular',
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: SvgPicture.asset('assets/drawable/kw.svg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
