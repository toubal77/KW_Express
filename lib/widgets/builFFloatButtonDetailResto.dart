import 'package:flutter/material.dart';
import 'package:kw_express/helper/icons_app.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BuildFloatButtonDetailResto extends StatelessWidget {
  Restaurant? resDet;
  BuildFloatButtonDetailResto(this.resDet);
  @override
  Widget build(BuildContext context) {
    return SpeedDialFabWidget(
      secondaryIconsList: [
        IconsApp.trouve,
        IconsApp.reserver,
        IconsApp.commande,
      ],
      secondaryIconsText: [
        "Trouver",
        "Reserver",
        "Commander",
      ],
      secondaryIconsOnPress: [
        () async {
          if (await canLaunch(resDet!.map.toString())) {
            await launch(
              resDet!.map.toString(),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Can\'t open google map'),
              ),
            );
          }
        },
        () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Reserver une table:"),
                    content: GestureDetector(
                      onTap: () {
                        launch('tel:+213${resDet!.num_tel.toString()}');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.call,
                          color: Colors.blue,
                        ),
                        title: Text(
                          resDet!.num_tel.toString(),
                        ),
                      ),
                    ),
                  );
                },
              )
            },
        () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Passer votre commande:"),
                    content: Container(
                      height: 120,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch('tel:+213${0542149642}');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              title: Text(
                                '0659185831',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch('tel:+213${0792140427}');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              title: Text(
                                '0792140427',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            },
      ],
      primaryIconExpand: IconsApp.floatButton,
      secondaryBackgroundColor: Colors.red,
      secondaryForegroundColor: Colors.white,
      primaryBackgroundColor: Colors.red,
      primaryForegroundColor: Colors.white,
    );
  }
}
