



import 'package:fashion_app/All.dart';
import 'package:fashion_app/Datails.dart';
import 'package:fashion_app/cartProvider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ItemCard extends StatelessWidget{
   final All item;
   final double conheight;
  final int index;
   const ItemCard({required this.item,super.key,required this.conheight,required this.index});
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return Detail(item: item);
         }));
      },
      
      child: 
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  children:[
                    
                     Container(
                          
                         height: conheight,
                         
                           width: 150,
                           decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(item.image),fit: BoxFit.cover),
                  
                    ),
                          
                          
                        ),
                        Positioned(
                
                         bottom: -18,
                          right: 10,
                          
                          child: GestureDetector(
                            onTap: () {
                            Provider.of<CartProvider>(context,listen: false).addtoCart(item);
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color.fromRGBO( 255, 255, 255, 1),width: 5),
                                color:const  Color.fromRGBO(13, 13, 14, 1)
                              ),
                            child:const  Icon(Icons.shopping_bag,color: Color.fromRGBO(255, 255, 255, 1),size: 14,weight: 10,),
                            ),
                          )
                          ),
                  ],
                ),
              
              const SizedBox(
                height: 5,
              ),

              Text("\$${item.price}",style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color:const Color.fromRGBO(13, 13, 14, 1))),
             
             Text(item.clothName,style: GoogleFonts.imprima(fontSize:16,fontWeight:FontWeight.w400,color:const Color.fromRGBO(121, 119, 128, 1))),

            ],
          )
    );


  }



}