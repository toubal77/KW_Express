import 'package:flutter/material.dart';
import 'package:kw_express/models/cart.dart';
import 'package:kw_express/models/detailRestoMenu.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BuildDetailRestoMenu extends StatefulWidget {
  DetailRestoMenu? res;
  BuildDetailRestoMenu(this.res);

  @override
  _BuildDetailRestoMenuState createState() => _BuildDetailRestoMenuState();
}

class _BuildDetailRestoMenuState extends State<BuildDetailRestoMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Cart>(context, listen: false)
            .addItem(widget.res!.nom, 1, double.parse(widget.res!.prix));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ajoute dans le panier'),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.res!.nom,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.res!.info,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${widget.res!.prix.toString()} DA',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
