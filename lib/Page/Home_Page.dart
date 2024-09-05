import 'package:book_store/Data/bookstore_data.dart';
import 'package:book_store/Page/Cart_page.dart';
import 'package:book_store/Page/Favorite_page.dart';
import 'package:book_store/Page/book_details.dart';
import 'package:book_store/Page/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _) {
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                        },
                        leading: Icon(
                          Icons.settings_outlined,
                          size: 35,color: Colors.purple,
                        ),
                        title: Text(
                          "Settings & support",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          size: 35,color: Colors.purple,
                        ),
                        title: Text(
                          "Privacy and Security",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.question_mark_rounded,
                          size: 35,color: Colors.purple,
                        ),
                        title: Text(
                          "Help and Feedback",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlertDialog(
                                title: Text("Do you want to Log Out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(fontSize: 19),
                                      )),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(fontSize: 19),
                                      ))
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 35,color: Colors.purple,
                    ),
                    title: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xff240046),
            iconTheme: IconThemeData(
                color: Colors.white,size: 30
            ),
            actions: [
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Favorite()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 30, color: Colors.white,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.bookmarkCounter}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => CartPage()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 30, color: Colors.white,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${ms.counter}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Rated Novels",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: allBooks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookDetailsPage(bookList: allBooks[index],)));
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height: 171,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("${allBooks[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Text("${allBooks[index].bookName}",style: TextStyle(fontSize: 20),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ ${allBooks[index].price}",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  bool added = ms.addToBookmark(allBooks[index]);
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
                                                  bool added = ms.addToCard(allBooks[index]);
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}