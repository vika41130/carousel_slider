import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  final double width;
  CarouselSliderWidget({
    this.width = 0,
  });

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  CarouselController carouselCtrler = CarouselController();
  int currentPosition;
  int initialIndex = 0;
  bool preActived = true;
  bool nextActived = true;
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
      width: widget.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Text('${currentPosition + 1}/${items.length}'),
                ),
              )
            ],
          ),
          Row(
            children: [
              FlatButton(
                height: 50,
                minWidth: 30,
                onPressed: currentPosition < items.length - 1 ? () => carouselCtrler.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                ) : null,
                child: Icon(Icons.arrow_forward),
              ),
              Expanded(
                child: Container(
                  // width: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        // aspectRatio: 3,
                        viewportFraction: 1,
                        initialPage: initialIndex,
                        enableInfiniteScroll: false,
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
                        }),
                    carouselController: carouselCtrler,
                    items: items.map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                ),
                            child: Center(
                                child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 100),
                            )),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              FlatButton(
                height: 50,
                minWidth: 30,
                onPressed: currentPosition > 0 ? () => carouselCtrler.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                ) : null,
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onPageChange(int index, CarouselPageChangedReason reason) {
    // print('---------------onPageChange index: $index');
    // print('---------------onPageChange reason: $reason');
    setState(() {
      currentPosition = index;
    });
  }

  void onScrolled(double dle) {
    print('---------------onScrolled: $dle');
  }
}
