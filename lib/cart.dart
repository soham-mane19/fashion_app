
import 'package:fashion_app/cartProvider.dart';
import 'package:fashion_app/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Cart extends StatelessWidget {
 
const  Cart({super.key, });
 
  @override
  Widget build(BuildContext context) {
      var  cartProvider = Provider.of<CartProvider>(context);
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
       appBar: AppBar(
      centerTitle: true,
      title: Text("Cart", style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,color: Theme.of(context).colorScheme.secondary,)),
      ),
       ),
       body:  SingleChildScrollView(
        
         child: Padding(padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
         child: Column(
          children: [
             Text("My Orders", style: GoogleFonts.imprima(fontSize:40,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
            const SizedBox(
              height: 10,
            ),
            
             ListView.builder(
              
              shrinkWrap: true,
                 itemCount: cartProvider.cartList.length,
                 itemBuilder: (context, index) {

                final currentitem = Provider.of<CartProvider>(context).cartList[index];
                  return 
                Slidable(
               
                  endActionPane: ActionPane(motion:const  ScrollMotion(),
                  extentRatio: 0.3,
                   children: [
                   
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 55,
                          width: 92,
                          decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                            color: Color.fromRGBO(255, 122, 0, 1)
                          ),
                          child: Center(
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite_border_outlined,color: Theme.of(context).primaryColor,),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<CartProvider>(context,listen: false).removeCart(currentitem);
                                  },
                                  child: Icon(Icons.delete_outlined,color:Theme.of(context).primaryColor,)),
                            
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                  child: Container(
                  
                  padding: EdgeInsets.all(8),
                  height: 155,
                  width: double.infinity,
                   child: Row(
                   
                    children: [
                      Container(
                        height: 142,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(image: AssetImage(Provider.of<CartProvider>(context).cartList[index].image),fit: BoxFit.cover)
                   
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ), 
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text: cartProvider.cartList[index].clothName,
                                  style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)
                                ),
                                //  TextSpan(
                                //   text: 'Tagerine Shirt',
                                //   style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)
                                // ),
                              ]
                            )),
                            const SizedBox(
                              height: 15,
                            ),
                             RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Yellow\n',
                              style: GoogleFonts.imprima(fontSize:14,fontWeight:FontWeight.w400,color:const Color.fromRGBO(121, 119, 128, 1))
                            ),
                             TextSpan(
                              text: 'Size 8',
                              style: GoogleFonts.imprima(fontSize:14,fontWeight:FontWeight.w400,color:const Color.fromRGBO(121, 119, 128, 1))
                            ),
                          ]
                        )),
                         const SizedBox(
                          height: 10,
                         ),
                         Row(
                          children: [
                            Text("${cartProvider.cartList[index].price}", style: GoogleFonts.imprima(fontSize:26,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
                        const SizedBox(
                          width: 80,
                        ),
                        Text("1x", style: GoogleFonts.imprima(fontSize:20,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
                          ],
                         )
                         ],
                       ),
                    ],
                   ),
                                 ),
                 
                );
                 }
             ),
             const SizedBox(
              height: 25,
             ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color:const  Color.fromRGBO(227, 227, 227, 1),width: 1)
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
Text("Total Items (3)",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :const Color.fromRGBO(121, 119, 128, 1)),),
const Spacer(),
Text("\$116.00",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :Theme.of(context).colorScheme.secondary),),
 
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             Row(
              children: [
Text("Standard Delivery",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :const Color.fromRGBO(121, 119, 128, 1)),),
const Spacer(),
Text("\$12.00",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :Theme.of(context).colorScheme.secondary),),

              ],
            ),
            const SizedBox(
              height: 15,
            ),
             Row(
              children: [
Text("Total Payment",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :const Color.fromRGBO(121, 119, 128, 1)),),
const Spacer(),
Text("\$126.00",style:GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color :Theme.of(context).colorScheme.secondary),),

              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                        style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 122, 0, 1)),
                        minimumSize: MaterialStatePropertyAll(Size(190, 62)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90))))
                        ),

                        onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                           return  const CheckOut();
                         },));
                        }, child: Text("Checkout Now", style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w100,color:Theme.of(context).primaryColor))
                        ) 
          ],
         ),
         ),
       ),
    );
  }
}