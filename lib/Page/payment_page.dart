import 'package:book_store/Data/delivery_list.dart';
import 'package:book_store/Data/payment_list.dart';
import 'package:book_store/Model/payment_class.dart';
import 'package:book_store/Page/class.dart';
import 'package:book_store/Page/purchase.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff240046),
        title: Text(
          "Payment Information",
          style: TextStyle(fontSize: 29,color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,size: 27
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${customer[0].name}',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                Text(
                  'Email: ${customer[0].email}',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                Text(
                  'Contact: ${customer[0].phoneNo}',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                Text(
                  'Address: ${customer[0].address}',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Number of Books:  ${ms.cardProducts[index].quantity}",
                                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total Price:  \$ ${ms.calculate()}",
                                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Text(
                                  "Choose your payment method",
                                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Card(
                                  elevation: 4,
                                  child: DropdownButton<PaymentModel>(
                                    value: _selectedMethod,
                                    onChanged: (PaymentModel? newValue) {
                                      setState(() {
                                        _selectedMethod = newValue!;
                                        _showCardDetails = _selectedMethod != allMethods[0];
                                      });
                                    },
                                    items: allMethods.map<DropdownMenuItem<PaymentModel>>(
                                          (PaymentModel method) {
                                        return DropdownMenuItem<PaymentModel>(
                                          value: method,
                                          child: Row(
                                            children: [
                                              Gap(10),
                                              Text("${method.paymentMethod}"),
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _cardNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Card number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _amount,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(20),
                                MaterialButton(
                                  height: 45,
                                  color: Color(0xff240046),
                                  minWidth: double.infinity,
                                  onPressed: () {

                                     Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> BuyPage()));
                                  },
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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