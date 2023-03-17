import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Contact contact = Contact();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Row(
          children: const [
            Icon(Icons.phone),
            SizedBox(
              width: 10,
            ),
            Text('Contacts'),
            // icon
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height:
                    // 40 % of screen height
                    MediaQuery.of(context).size.height * 0.4,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Icon(Icons.phone_android_outlined),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Create New Contacts',
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const Text(
                          'A dialog is a type of  modal window that appears in fornt of app content to provide critical information, or prompt for a decision to be made.',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 88, 88, 88)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        // create line separator
                        child: const Divider(
                          color: Color.fromARGB(255, 230, 227, 227),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Insert Your Name',
                          label: Text('Name'),
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 228, 237),
                        ),
                        controller: _name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(15),
                          hintText: '+62 ......',
                          label: Text('Nomor'),
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 228, 237),
                        ),
                        controller: _phone,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 98, 51, 141)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                contact.name = _name.text;
                                contact.nomor = _phone.text;
                                contact.addContacts();
                                print(contact._contacts);
                                _name.clear();
                                _phone.clear();
                                // update screen
                              }
                            },
                            child: const Text(
                              '  Submit  ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height:
                    // 40 % of screen height
                    MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    const Text(
                      'List Contacts',
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: contact._contacts.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Text(contact._contacts[index]['name']);
                          // return ListTile(
                          //   leading: CircleAvatar(
                          //     child: Text(_contacts[index]['name']),
                          //   ),
                          //   title: Text(_contacts[index]['name']),
                          //   subtitle: Text(_contacts[index]['nomor']),
                          //   trailing: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: const Icon(Icons.edit,
                          //             color: Colors.black),
                          //       ),
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: const Icon(Icons.delete,
                          //             color: Colors.black),
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  // ignore: prefer_final_fields
  List _contacts = [];

  late String? name;
  late String? nomor;

  Contact({this.name, this.nomor});

  void addContacts() {
    _contacts.add({'name': name, 'nomor': nomor});
  }
}
