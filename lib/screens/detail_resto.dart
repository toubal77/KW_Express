import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/home_widget.dart';
import 'package:kw_express/models/restaurant.dart';

class DetailResto extends StatefulWidget {
  Restaurant? resDet;
  DetailResto(this.resDet);

  @override
  _DetailRestoState createState() => _DetailRestoState();
}

class _DetailRestoState extends State<DetailResto> {
  late Color color;
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeWidget()),
            );
          },
          icon: Icon(
            Icons.backpack,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                child: widget.resDet!.img_cover
                            .contains('scontent.forn2-1.fna.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-pmo1-1.xx.fbcdn.net')
                    ? SvgPicture.asset('assets/drawable/resto_profile.svg')
                    : Image.network(
                        widget.resDet!.img_cover.toString(),
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
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
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      widget.resDet!.service.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    DefaultTabController(
                      length: 3,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        indicatorWeight: 2.0,
                        onTap: (index) {
                          setState(() {
                            switch (index) {
                              case 0:
                                color = Color(0xffff5722);
                                break;
                              case 1:
                                color = Color(0xff3f51b5);
                                break;
                              case 2:
                                color = Color(0xffe91e63);
                                break;
                              case 3:
                                color = Color(0xff9c27b0);
                                break;
                              case 4:
                                color = Color(0xff2196f3);
                                break;
                              default:
                            }
                          });
                        },
                        tabs: <Widget>[
                          Tab(
                            child: Container(
                              child: Text(
                                'GAMES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'GAMES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text(
                                'GAMES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
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
                            'Pizza',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'sauce tomate mozzarella',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '400 DA',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            'Pizza',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'sauce tomate mozzarella',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '400 DA',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            'Pizza',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'sauce tomate mozzarella',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '400 DA',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 110,
            left: 25,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.white, width: 5.0),
                borderRadius: BorderRadius.circular(50),
              ),
              child: widget.resDet!.img_profile
                          .contains('scontent.forn2-1.fna.fbcdn.net') ||
                      widget.resDet!.img_profile
                          .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                      widget.resDet!.img_profile
                          .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                      widget.resDet!.img_profile
                          .contains('scontent-pmo1-1.xx.fbcdn.net')
                  ? SvgPicture.asset('assets/drawable/resto_profile.svg')
                  : Image.network(widget.resDet!.img_profile.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
