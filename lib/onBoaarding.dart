import 'package:fashion_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 465,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/onboarding.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Find The\n',
                      style: GoogleFonts.imprima(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary)),
                  TextSpan(
                      text: 'Best Collections',
                      style: GoogleFonts.imprima(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary)),
                ])),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Get your dream item easily with FashionHub\n',
                      style: GoogleFonts.imprima(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.tertiary)),
                  TextSpan(
                      text: 'and get other intersting offer',
                      style: GoogleFonts.imprima(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.tertiary)),
                ])),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                   ElevatedButton(
                    style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 1))),
                    onPressed: (){}, child: Text(
                        "Sign Up",
                        style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color:const Color.fromRGBO(13, 13, 14, 1)
                           ),
                      ),),


                    const SizedBox(width: 80,),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:const  MaterialStatePropertyAll( Color.fromRGBO(255, 122, 0, 1),),
                       shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                       return  const Login();
                        }));
                      },
                     
                     
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
