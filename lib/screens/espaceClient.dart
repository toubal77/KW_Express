import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/helper/icons_app.dart';

class EspaceClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 2,
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      IconsApp.share,
                      color: Colors.red,
                    ),
                    label: Text('inviter vos amis'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      IconsApp.serviceClient,
                      color: Colors.red,
                    ),
                    label: Text('Service Client'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      IconsApp.questions,
                      color: Colors.red,
                    ),
                    label: Text('Questions Frequentes'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      IconsApp.questions,
                      color: Colors.red,
                    ),
                    label: Text('Noter L\'application'),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'powerdBy',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'CedarvilleCursive-Regular',
                    ),
                  ),
                  SvgPicture.asset('assets/drawable/kw.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
