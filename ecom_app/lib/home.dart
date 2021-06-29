import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

var productList = {
  'image': [
    'assets/images/note_20_ultra.jpg',
    'assets/images/macbook_air.jpg',
    'assets/images/iphone_12.jpg',
    'assets/images/mercedes.jpg',
    'assets/images/honda_cb_shine.jpg'
  ],
  'name': [
    'Note 20 Ultra',
    'MacBook Air',
    'Iphone 12',
    'Mercedes',
    'Honda CB Shine'
  ],
  'rating': ['4', '5', '5', '5', '4'],
  'reviews': ['23', '15', '30', '46', '25']
};

var categoryList = {
  'name': ['Clothes', 'Electronic', 'HouseHold', 'Appliances', 'Others'],
  'icons': [
    'Icons.school',
    'Icons.trending_up',
    'Icons.chair_rounded',
    'Icons.electrical_services',
    'Icons.arrow_forward_iosf'
  ],
  'products': ['5', '20', '9', '5', '15']
};

class Ecomm extends StatefulWidget {
  @override
  _EcommState createState() => _EcommState();
}

class _EcommState extends State<Ecomm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Items",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View More",
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ))
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 7))
                ]),
            height: MediaQuery.of(context).size.height / 3,
            child: Expanded(child: ImageSlider()),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(children: [
              Text(
                "More Categories",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Expanded(child: CategorySlider()),
          ),
          Container(
            child: Expanded(child: Products()),
          )
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Swiper(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Column(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: new Image.asset(
                productList["image"][index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                productList["name"][index],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              RatingBar(
                itemSize: 15,
                initialRating: double.parse(productList["rating"][index]),
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: Icon(Icons.star_half),
                    empty: Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    )),
                onRatingUpdate: (rating) {},
              ),
              Text(productList["rating"][index]),
              Container(
                  child:
                      Text(" (" + productList["reviews"][index] + " Reviews)"))
            ],
          )
        ]);
      },
      autoplay: true,
    ));
  }
}

class CategorySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
              height: 80,
              width: 200,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: Offset(0, 7))
                  ]),
              child: Column(
                children: [
                  Expanded(
                      child: Text(
                    categoryList["name"][index],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                  Text(categoryList["products"][index] + " items")
                ],
              ),
            ),
          );
        },
        viewportFraction: 0.5,
        scale: 1,
      ),
    );
  }
}

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(4, (index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 7))
                ]),
            child: Column(children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: new Image.asset(
                    productList["image"][index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    productList["name"][index],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  RatingBar(
                    itemSize: 15,
                    initialRating: double.parse(productList["rating"][index]),
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: Icon(Icons.star_half),
                        empty: Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        )),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(productList["rating"][index]),
                  Container(
                      child: Text(
                          " (" + productList["reviews"][index] + " Reviews)"))
                ],
              )
            ]),
          );
        }));
  }
}
