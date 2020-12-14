import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lutoi/app_config/assets_config.dart';

class CarouselSliderWidget extends StatefulWidget {
  CarouselSliderWidget();

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  CarouselController carouselCtrler = CarouselController();
  int currentPosition;
  int initialIndex = 0;
  List<dynamic> items = List.generate(15, (index) => index);
  @override
  void initState() {
    super.initState();
    currentPosition = initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              // aspectRatio: 3,
              viewportFraction: 0.8,
              initialPage: initialIndex,
              // enableInfiniteScroll: false,
              // reverse: true,
              // autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 500),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInCubic,
              enlargeCenterPage: false,
              // scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                onPageChange(index, reason);
              },
              onScrolled: (dle) {
                onScrolled(dle);
              }
            ),
            carouselController: carouselCtrler,
            items: items.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(
                        color: Colors.black87,
                        width: 2,
                        style: BorderStyle.solid
                      )
                    ),
                    // child: new Image.asset(
                    //     Id.bmw_path + 'driver' + index.toString() + '.jpg',
                    // ),
                    child: Center(child: Text('$index', style: TextStyle(fontSize: 100),)),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => carouselCtrler.jumpToPage(0),
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      color: currentPosition == 0 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              InkWell(
                  onTap: () => carouselCtrler.jumpToPage(1),
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      color: currentPosition == 1 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              InkWell(
                  onTap: () => carouselCtrler.jumpToPage(2),
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      color: currentPosition == 2 ? Colors.black : Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () => carouselCtrler.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                ),
                child: Icon(Icons.arrow_forward),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for(var i = 0; i < items.length; i++)
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: RaisedButton(
                            textColor: currentPosition == i ? Colors.black : Colors.black,
                            color: currentPosition == i ? Colors.yellow : Colors.white,
                            onPressed: () {
                              setState(() {
                                currentPosition = i;
                              });
                              carouselCtrler.jumpToPage(i);
                            },
                            child: Text('$i'),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => carouselCtrler.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                ),
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onPageChange(int index, CarouselPageChangedReason reason) {
    print('---------------onPageChange index: $index');
    print('---------------onPageChange reason: $reason');
    setState(() {
      currentPosition = index;
    });
  }

  void onScrolled(double dle) {
    print('---------------onScrolled: $dle');
  }
}
