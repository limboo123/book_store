
import 'package:book_store/Model/bookstore_model.dart';
import 'package:book_store/Page/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class BookDetailsPage extends StatefulWidget {
  BookList  bookList;
  BookDetailsPage({super.key,required this.bookList});

  @override
  State<BookDetailsPage> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff240046),
        title: Text("About Novels",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,size: 30
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context,ms,_){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("${widget.bookList.image}"),
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: 25,
                            initialRating:  widget.bookList.rating, // Initialize with the book's rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (rating) {
                              // Update the rating for the specific book
                              setState(() {
                                widget. bookList.rating = rating;
                              });
                            },
                          ),
                          Text(
                            widget.bookList.rating.toStringAsFixed(1),
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${widget.bookList.price}",
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToBookmark(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book is already added";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.bookmark_outline,
                                  size: 30, color: Colors.purple,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToCard(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book is already added";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 30, color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Gap(20),
                                Text("Name: ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                Text("Author: ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                Text("Published Date: ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Gap(20),
                                Text("${widget.bookList.bookName}",style: TextStyle(fontSize: 20),),
                                Text("${widget.bookList.author}",style: TextStyle(fontSize: 20),),
                                Text("${widget.bookList.publishDate}",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}