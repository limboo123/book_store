
import 'package:book_store/Model/bookstore_model.dart';
import 'package:book_store/Model/delivery_class.dart';
import 'package:flutter/cupertino.dart';

class ManageState with ChangeNotifier{
  /// for book buying
  int _counter = 0;

  set counter(int value){
    _counter=value;
    notifyListeners();
  }
  int get counter=>_counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<BookList> _cardProducts=[];

  bool addToCard(BookList product){
    if(!_cardProducts.contains(product)){
      _cardProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }

  List<BookList> get cardProducts=> _cardProducts;

  /// for bookmark
  int _bookmarkCounter = 0;
  set bookmarkCounter(int value){
    _bookmarkCounter=value;
    notifyListeners();
  }

  int get bookmarkCounter => _bookmarkCounter;
  void incrementBookmarkCounter() {
    _bookmarkCounter++;
    notifyListeners();
  }

  List<BookList> _cardProduct=[];

  bool addToBookmark(BookList product) {
    if(!_cardProduct.contains(product)){
      _cardProduct.add(product);
      _bookmarkCounter++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }
  List<BookList> get cardProduct=> _cardProduct;

  void increaseQuantity(BookList product){
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BookList product){
    if(product.quantity>0){
      product.quantity--;
      notifyListeners();
    }
    // else{
    //   _cardProducts.remove(product);
    //   _counter--;
    //   notifyListeners();
    // }
  }

  double calculate(){
    double total=0;
    for(var product in _cardProducts){
      total+=product.price*product.quantity;
    }
    return total;
  }

  void deleteProducts(BookList product){
    _cardProducts.remove(product);
    _counter--;
    notifyListeners();
  }
  List<AddressClass> _deliveryInfo = [];

  List<AddressClass> get deliveryInfo => _deliveryInfo;

  void addDeliveryInfo(String name, String address, String email,String phoneNo) {
    _deliveryInfo.add(
      AddressClass(
        name: name,
        email:email,
        address: address,
        phoneNo: phoneNo,
      ),
    );
  }
}