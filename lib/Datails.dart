import 'package:fashion_app/All.dart';
import 'package:fashion_app/cart.dart';
import 'package:fashion_app/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Detail extends StatefulWidget {
  final All item;
 
  const Detail({super.key, required this.item});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int _index=2;
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
      centerTitle: true,
      title: Text("Details", style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,color: Theme.of(context).colorScheme.secondary,)),
      ),
    
      actions: [
           Padding(
             padding:const  EdgeInsets.only(right:20 ),
             child: GestureDetector(child:const  Icon(Icons.bookmark_border)),
           )
      ],
    ),
    body: Padding(
      padding:const  EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: 430,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: AssetImage(widget.item.image),fit: BoxFit.cover)
              ),
            ),
            Container(
              height: 10,
            ),
            Row(
              children: [
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Premium\n',
                      style: GoogleFonts.imprima(fontSize:30,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)
                    ),
                     TextSpan(
                      text: 'Tagerine Shirt',
                      style: GoogleFonts.imprima(fontSize:30,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)
                    ),
                  ]
                )),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          decoration:const  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/color1.png'))
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                         Container(
                          height: 24,
                          width: 24,
                          decoration:const  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/color2.png'))
                          ),
                        ),
                                                const SizedBox(
                          width: 5,
                        ),
                         Container(
                          height: 24,
                          width: 24,
                          decoration:const  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/color3.png'))
                          ),
                        ),
                       
                       

                      ],
                    )
                  ],
                )
              ],
            ),
             const SizedBox(
                          height: 20,
                        ),
                        Text("Size", style: GoogleFonts.imprima(fontSize:30,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
                        const SizedBox(
                          height: 10,
                        ),
             Row(
                          children: [
                                buildSizeButton('S',0),
                                buildSizeButton('M',1),
                                buildSizeButton('L',2),
                                buildSizeButton('XL',3),
                                buildSizeButton('XXL',4),
                                
                          ],
                        ),
                      const Spacer(),
                        Row(
                          children: [
                            Text("\$${widget.item.price}", style: GoogleFonts.imprima(fontSize:36,fontWeight:FontWeight.w400,color:Theme.of(context).colorScheme.secondary)),
                          const Spacer(),
                    ElevatedButton(
                        style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 122, 0, 1)),
                        minimumSize: MaterialStatePropertyAll(Size(162, 62)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(90))))
                        ),

                        onPressed: (){
                         Provider.of<CartProvider>(context,listen: false).addtoCart(widget.item);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                             return const  Cart();
                            
                          }));
                        }, child: Text("Add To Cart", style: GoogleFonts.imprima(fontSize:18,fontWeight:FontWeight.w100,color:Theme.of(context).primaryColor))
                        )  
        ],
                          
                        ),
        ],
                       
      ),
    )
    );

  }
  Widget buildSizeButton(String size,int index){
      return GestureDetector(
        onTap: () {
          setState(() {
             _index = index;
          });
         
        },
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
          height: 45,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
           color: _index==index?Theme.of(context).colorScheme.secondary:Theme.of(context).primaryColor
          ),
          child: Text(size, style: GoogleFonts.imprima(fontSize:24,fontWeight:FontWeight.w400,color:Color.fromRGBO(121, 119, 128, 1))),
        ),
      );
  }
}