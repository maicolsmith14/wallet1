import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final List<String> names = [
    "Maicol",
    "Matos",
    "Smith",
    "Medina",
    "Maira",
    "Maigua",
    "Mariangel"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E193D),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color (0xFF0E193D),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Welcome back", style: TextStyle(fontSize: 14, color: Color (0xFFAAAAAA)),),
            Text("Angel Maxwell", style: TextStyle(fontSize: 18),),
          ],),
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
                  icon: Icon(Icons.notifications_active_outlined, size: 35,)),
              ),
            )
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Container(
              padding: EdgeInsets.all(24),
              height: 240,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                IconButton(color: Color(0xFF00FF00), onPressed: (){}, icon: Icon(Icons.inventory_rounded, size: 60, color: Colors.white,)),
                Text("Inventario", style: TextStyle(color: Colors.white),)
              ],),
              Container(
                color: Colors.white54,
                width: 2,
                height: 80,
              ),
              Column(children: [
                IconButton(color: Color(0xFF00FF00), onPressed: (){}, icon: Icon(Icons.pallet, size: 60, color: Colors.white,)),
                Text("Paleta", style: TextStyle(color: Colors.white),)
              ]),
              Container(
                color: Colors.white54,
                width: 2,
                height: 80,
              ),
              Column(children: [
                IconButton(color: Color(0xFF00FF00), onPressed: (){}, icon: Icon(Icons.inbox, size: 60, color: Colors.white,)),
                Text("Recibidos", style: TextStyle(color: Colors.white),)
              ]),
          ],),
          SizedBox(height: 24,),
          Expanded(child: Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Quick Send"),
                  Text("See all")
                ],),
                SizedBox(height: 20,),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(index.toString()),);
                    } ,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Recent transaction"),
                  Text("See all"),
                ],),
                SizedBox(height: 15,),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.archive),
                        title: Text((index+1).toString()+" "+names[index]),
                      ),
                    );
                    },
                  ),
                )
              ],),
            ),
            ))
        ],),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],),
    );
  }
}