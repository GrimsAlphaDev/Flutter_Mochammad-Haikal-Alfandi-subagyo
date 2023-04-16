import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Decider/decider_app.dart';

// section 13 platform widget
class EksplorasiHome extends StatelessWidget {
  final dynamic primaryColor = const Color(0xff6200ee);
  final dynamic secondaryColor = const Color(0xff03DAC5);

  const EksplorasiHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const App()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: ListView(
            children: [
              const ListTile(
                title: Text('Learn Flutter'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn ReactJS'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn VueJS'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn Tailwind CSS'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn UI/UX'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn Figma'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text('Learn Digital Marketing'),
              ),
              const SizedBox(
                height: 10,
              ),
              // create a black horizontal line
              Container(
                height: 1,
                color: const Color.fromARGB(255, 209, 206, 206),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: primaryColor,
        // fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () => {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
