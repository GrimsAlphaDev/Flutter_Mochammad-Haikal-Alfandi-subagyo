import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/Decider/decider_app.dart';

// section 13 platform widget
class MaterialHomePage extends StatelessWidget {
  const MaterialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Setting'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: ListView(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'L',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Leanne Graham'),
                subtitle: Text('1-770-736-8031 x56442',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'E',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Ervin Howell'),
                subtitle: Text('010-692-6593 x09125',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'C',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Clementine Bauch'),
                subtitle: Text('1-463-123-4447',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'P',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Patricia Lebsack'),
                subtitle: Text('493-170-9623 x156',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'C',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Chelsey Dietrich'),
                subtitle: Text('(254)954-1289',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'D',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Mrs. Dennis Schulist'),
                subtitle: Text('1-477-935-8478 x6430',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    'K',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text('Kurtis Weissnat'),
                subtitle: Text('210.067.6132',
                    style:
                        TextStyle(color: Color.fromARGB(255, 170, 166, 166))),
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // back
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const App()))
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
