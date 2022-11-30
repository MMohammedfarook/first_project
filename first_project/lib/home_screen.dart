import 'package:first_project/models/home_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  String? userName;
  String? email;
  String? password;
  String? genderSelected;
  HomeScreen(
      {this.userName,
      required this.email,
      required this.password,
      required this.genderSelected});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  List<Homemodel> clock = [
    Homemodel(
        name: "clock",
        image: AssetImage("assets/2.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/1.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/3.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/4.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/5.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/6.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product"),
    Homemodel(
        name: "clock",
        image: AssetImage("assets/7.jpeg"),
        icon: Icon(Icons.alarm),
        subtitle: "foreign product")
  ];

  //const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: 1,
        backgroundColor: Colors.tealAccent,
        onTap: (value) {
          setState(() {
            i = value;
            print(value);
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Icon(Icons.home),
            label: 'home',
            tooltip: "home",
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Icon(Icons.person),
            label: 'profile',
            tooltip: 'profile',
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              label: 'setting',
              tooltip: "home"),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.tealAccent,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/2.jpeg"),
              radius: 60,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            Text(widget.userName! + "\n" + widget.email!),
            SizedBox(
              height: 40,
            ),
            Divider(
              color: Colors.white,
              thickness: 10,
            ),
            ListTile(
              leading: Icon(Icons.abc_rounded),
              title: Text("Learning"),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.baby_changing_station),
              title: Text("Learning"),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Learning"),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.cabin_outlined),
              title: Text("Learning"),
            ),
            Divider(
              color: Colors.white,
              thickness: 10,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text('sign up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                shadowColor: Colors.black,
                elevation: 9,
              ),
              onPressed: (() {}),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('demo app'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        actions: [Icon(Icons.search), Icon(Icons.e_mobiledata_outlined)],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //     child: GridView(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //   children: [
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/1.jpeg'),
            //     )),
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/2.jpeg'),
            //     )),
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/3.jpeg'),
            //     )),
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/4.jpeg'),
            //     )),
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/5.jpeg'),
            //     )),
            //     GridTile(
            //         child: Image(
            //       image: AssetImage('assets/6.jpeg'),
            //     )),
            //   ],
            // )),
            Expanded(
                child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: clock.length,
              itemBuilder: ((context, i) {
                return Container(
                  child: GridTile(
                    child: CircleAvatar(
                      backgroundImage: clock[i].image,
                      radius: 20,
                    ),
                  ),
                );
              }),
            )),
            Expanded(
                child: ListView.builder(
                    itemCount: clock.length,
                    itemBuilder: ((context, i) {
                      return ListTile(
                        leading: CircleAvatar(backgroundImage: clock[i].image),
                        title: Text(clock[i].name),
                        subtitle: Text(clock[i].subtitle),
                        trailing: clock[i].icon,
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
