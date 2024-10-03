import "dart:math";

import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final List<String> names = [
    "Angel",
    "Pfizer",
    "Leo",
    "Ramon",
    "Maira",
    "Maigua",
    "Mariangel",
    "Richard",
    "Erika",
    "Genesis",
    "Gerardo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 14, 14),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color (0xFF0E193D),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome back", style: TextStyle(fontSize: 14, color: Color (0xFFAAAAAA)),),
            Text("Angel Maxwell", style: TextStyle(fontSize: 18),),
          ],
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: NetworkImage("https://i.pravatar.cc/300"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: Badge.count(
              count: 3,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.notifications_active_outlined, size: 35,)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          //Card container START

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Container(
              padding: const EdgeInsets.all(24),
              height: 240,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(25)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(children: [
                    Text("Your Balance"),
                    Text("7.096")
                  ],
                  ),
                  Text("Artho")
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(children: [
                    Text("Your Balance"),
                    Text("0102 0015 1513 8889 3000")
                  ],
                  ),
                  Icon(Icons.home)
                ],
                ),
              ],
              ),
            ),
          ),

          //Card Container END

          //Meddium Buttons START

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelfMediumButton(label: "Inventario", icon: Icon(Icons.inventory_outlined,  size: 60, color: Colors.white,)),
              SelfVerticalDivider(),
              SelfMediumButton(label: "Paleta", icon: Icon(Icons.pallet, size: 60, color: Colors.white,)),
              SelfVerticalDivider(),
              SelfMediumButton(label: "Recibidos", icon: Icon(Icons.inbox, size: 60, color: Colors.white,)),
            ],
          ),

          //Medium Buttons END

          const SizedBox(height: 24,),

          //White Bottom Container START

          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: QuickSendRowFormat(subtitle: "Quick Send", textButtonTitle: "See all"),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const QuickSendAddButton(),
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: names.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  launchUrl(Uri.parse("tel://+584125525080"));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        foregroundImage: NetworkImage("https://i.pravatar.cc/${Random().nextInt(1000).toString()}"),
                                        radius: 42,
                                        backgroundColor: Colors.blue,
                                      ),
                                      Text(names[index])
                                    ],
                                  ),
                                ),
                              );
                            } ,
                            scrollDirection: Axis.horizontal,
                          ),
                        ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const QuickSendRowFormat(
                        subtitle: "Recent Transactions",
                        textButtonTitle: "See all"
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.archive),
                              title: Text((index+1).toString()+")  "+names[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //White Bottom Container END
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}


//Funciones utilizadas mas arriba en este archivo

class QuickSendRowFormat extends StatelessWidget {

  final String subtitle;
  final String textButtonTitle;
  
  const QuickSendRowFormat({
    super.key, 
    required this.subtitle, 
    required this.textButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
    
          ),
        ),
        Text(
          textButtonTitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.blue
          ),
        ),
      ],
    );
  }
}

class QuickSendAddButton extends StatelessWidget {
  const QuickSendAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          child: DottedBorder(
            dashPattern: [5,7],
            borderType: BorderType.Circle,
            color: Colors.black45,
            child: Container(
              height: 79,
              width: 79,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40)
              ),
              child: IconButton(
                iconSize: 40,
                onPressed: (){}, 
                icon: const Icon(Icons.add)
              ),
            ),
          ),
        ),
        const Text("Add")
      ],
    );
  }
}

class SelfVerticalDivider extends StatelessWidget {
  const SelfVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: 2,
      height: 80,
    );
  }
}

class SelfMediumButton extends StatelessWidget {

  final String label;
  final Icon icon;

  const SelfMediumButton({
    super.key, 
    required this.label, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(color: const Color(0xFF00FF00), onPressed: (){}, icon: icon),
        Text(label, style: const TextStyle(color: Colors.white),)
      ],
    );
  }
}

//another function
