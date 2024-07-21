
import 'package:fashion_app/All.dart';
import 'package:fashion_app/cart.dart';
import 'package:fashion_app/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 int bottomindex=0;
  int _index = 0;
 double conheight= 0;
  List<All> itemList = [
    All(clothName: 'Tagerine Shirt', image: 'assets/item1.png', price: 240.32),
    All(clothName: 'Leather Coart', image: 'assets/item2.png', price: 325.36),
    All(clothName: 'Tagerine Shirt', image: 'assets/item3.png', price: 126.47),
    All(clothName: 'Leather Coart', image: 'assets/item4.png', price: 257.85),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.grid_view),
        ),
        leadingWidth: 22,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Explore\n',
                  style: GoogleFonts.imprima(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary)),
              TextSpan(
                  text: 'Best trendy collection!',
                  style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.tertiary)),
            ])),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  categoryButton('All', 0),
                  categoryButton('Men', 1),
                  categoryButton('Women', 2),
                  categoryButton('Kids', 3),
                  categoryButton('Others', 4),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
           
                itemCount: itemList.length,
                gridDelegate:
                   const   SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    childAspectRatio: 0.7
                    
                      ),
                itemBuilder: (context, index) {
                 
                  if(index==0|| index==3){
                  conheight = 194;
                  }else{
                   conheight = 160;
                  }
                 
                return 
                   ItemCard(item: itemList[index],conheight:conheight,index: index,);
                
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: bottomindex,
        onTap: (index) {
          setState(() {
            bottomindex=index;
            
          });
         if( bottomindex==2){Navigator.push(context, MaterialPageRoute(builder: (context) {
             return Cart();
          },));
          }
          setState(() {
            bottomindex=0;
          });

           
        },
        
        selectedItemColor:const  Color.fromRGBO(255, 122, 0, 1),
        unselectedItemColor: const Color.fromRGBO(13, 13, 14, 1),
        type: BottomNavigationBarType.fixed,
        backgroundColor:const  Color.fromRGBO(255, 255, 255, 1),
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),


      ]),
    );
  }
  

  Widget categoryButton(String name, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _index = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: _index == index
                  ? const Color.fromRGBO(255, 122, 0, 1)
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(32)),
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: _index == index
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
        ));
  }
}
