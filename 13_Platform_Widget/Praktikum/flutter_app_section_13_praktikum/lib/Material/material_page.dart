import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Decider/decider_app.dart';

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
            children: [
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'L',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Leanne Graham',
                            style: TextStyle(color: Colors.black)),
                        Text('1-770-736-8031 x56442',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'E',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Ervin Howell',
                            style: TextStyle(color: Colors.black)),
                        Text('010-692-6593 x09125',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'C',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Clementine Bauch',
                            style: TextStyle(color: Colors.black)),
                        Text('1-463-123-4447',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'P',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Patricia Lebsack',
                            style: TextStyle(color: Colors.black)),
                        Text('493-170-9623 x156',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'C',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Chelsey Dietrich',
                            style: TextStyle(color: Colors.black)),
                        Text('(254)954-1289',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'D',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Mrs. Dennis Schulist',
                            style: TextStyle(color: Colors.black)),
                        Text('1-477-935-8478 x6430',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        'K',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Kurtis Weissnat',
                            style: TextStyle(color: Colors.black)),
                        Text('210.067.6132',
                            style: TextStyle(
                                color: Color.fromARGB(255, 170, 166, 166))),
                      ],
                    ),
                  ],
                ),
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
