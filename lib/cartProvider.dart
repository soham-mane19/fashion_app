


import 'package:fashion_app/All.dart';
import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier{
     
     List<All> cartList=[];

     void addtoCart(All item){
      
      cartList.add(item);
      notifyListeners();
      
      }
      void removeCart(All item){
          cartList.remove(item);
          notifyListeners();

      }

    

  
  }