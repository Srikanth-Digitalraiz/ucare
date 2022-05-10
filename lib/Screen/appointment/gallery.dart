// import 'package:Myclinic/utilites/appbar.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/color.dart';
// import 'package:Myclinic/utilites/color.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ScrollController _scrollController = ScrollController();

  List<String> _images = [
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg'
  ];
  List<String> _images2 = [
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AppBars().commonAppBar(context, "Gallery"),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                          right: 5.0,
                          left: 5,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 80.0),
                            child: ListView.builder(
                                controller: _scrollController,
                                itemCount: 4,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return table(_images[index], _images2[index]);
                                }),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget table(String img1, String img2) {
    return Table(
      children: [
        TableRow(children: [
          cardImg(img1),
          cardImg(img2),
        ]),
      ],
    );
  }

  Widget cardImg(String img) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          // width:  MediaQuery.of(context).size.width*.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              // child: Container(
              //     color: Colors.grey, child: Center(child: Text("Your asset"))),
              //delete the just above code [ child container ] and uncomment the below code and set your assets
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
