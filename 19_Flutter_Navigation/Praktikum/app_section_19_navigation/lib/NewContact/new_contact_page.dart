import 'package:app_section_17_assets/NewContact/contacts.dart';
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
  final _formKeyEdit = GlobalKey<FormState>();
  Contact contact = Contact();

  RegExp regex =
      RegExp(r"^[a-zA-Z ]*$"); // regular expression untuk huruf dan spasi
  RegExp regexAngka = RegExp(r"^[0-9]*$");

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
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
                      // decrease textfield height
                      decoration: const InputDecoration(
                        hintText: 'Insert Your Name',
                        label: Text('Name'),
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 228, 237),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan Nama Anda Terlebih Dahulu';
                        }

                        if (value.split(' ').length < 2) {
                          return 'Nama Harus Memiliki 2 Kata';
                        }

                        if (value[0] != value[0].toUpperCase()) {
                          return 'Nama Harus Dimulai Dengan Huruf Besar';
                        }

                        // Nama tidak boleh mengandung angka atau karakter khusus.
                        if (!regex.hasMatch(value)) {
                          return 'Input tidak boleh mengandung angka atau karakter khusus';
                        }

                        return null;
                      },
                      controller: _name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '+62 ......',
                        label: Text('Nomor'),
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 228, 237),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan Nomor Anda Terlebih Dahulu';
                        }

                        if (!regexAngka.hasMatch(value)) {
                          return 'Input hanya boleh mengandung angka';
                        }

                        if (value.length <= 8 || value.length >= 15) {
                          return 'Nomor Tidak Boleh Kurang Dari 8 Dan Lebih Dari 15';
                        }

                        if (value[0] != '0') {
                          return 'Nomor Harus Dimulai Dengan 0';
                        }

                        return null;
                      },
                      keyboardType: TextInputType.phone,
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
                              setState(() {
                                contact.addContacts(
                                    name: _name.text,
                                    nomor: _phone.text,
                                    context: context);
                              });
                              _name.clear();
                              _phone.clear();
                              print(contact.contacts);
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'List Contacts',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // height till the end of screen
                color: const Color(0xFFFFFBFE),
                height: MediaQuery.of(context).size.height * 0.34,
                child: ListView.builder(
                  itemCount: contact.contacts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(contact.contacts[index]['name'][0]),
                      ),
                      title: Text(
                        contact.contacts[index]['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contact.contacts[index]['nomor']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            // get id from list and send is as param
                            onPressed: () {
                              // show dialog
                              showDialog(
                                  context: context,
                                  useSafeArea: true,
                                  builder: (BuildContext context) {
                                    // ignore: no_leading_underscores_for_local_identifiers
                                    TextEditingController _nameEdit =
                                        TextEditingController(
                                            text: contact.contacts[index]
                                                ['name']);
                                    // ignore: no_leading_underscores_for_local_identifiers
                                    TextEditingController _phoneEdit =
                                        TextEditingController(
                                            text: contact.contacts[index]
                                                ['nomor']);
                                    return AlertDialog(
                                      content: Stack(
                                        children: [
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: Icon(Icons.close),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: Form(
                                              key: _formKeyEdit,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: const Text(
                                                      'Edit Kontak',
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text('Name'),
                                                      contentPadding:
                                                          EdgeInsets.all(15),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          255, 240, 228, 237),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Masukan Nama Anda Terlebih Dahulu';
                                                      }

                                                      if (value
                                                              .split(' ')
                                                              .length <
                                                          2) {
                                                        return 'Nama Harus Memiliki 2 Kata';
                                                      }

                                                      if (value[0] !=
                                                          value[0]
                                                              .toUpperCase()) {
                                                        return 'Nama Harus Dimulai Dengan Huruf Besar';
                                                      }

                                                      // Nama tidak boleh mengandung angka atau karakter khusus.
                                                      if (!regex
                                                          .hasMatch(value)) {
                                                        return 'Input tidak boleh mengandung angka atau karakter khusus';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _nameEdit,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(15),
                                                      label: Text('Nomor'),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          255, 240, 228, 237),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Masukan Nomor Anda Terlebih Dahulu';
                                                      }

                                                      if (!regexAngka
                                                          .hasMatch(value)) {
                                                        return 'Input hanya boleh mengandung angka';
                                                      }

                                                      if (value.length <= 8 ||
                                                          value.length >= 15) {
                                                        return 'Nomor Tidak Boleh Kurang Dari 8 Dan Lebih Dari 15';
                                                      }

                                                      if (value[0] != '0') {
                                                        return 'Nomor Harus Dimulai Dengan 0';
                                                      }

                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    controller: _phoneEdit,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty.all<
                                                                  Color>(const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  98,
                                                                  51,
                                                                  141)),
                                                        ),
                                                        onPressed: () {
                                                          if (_formKeyEdit
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() {
                                                              contact.editContacts(
                                                                  id: contact.contacts[
                                                                          index]
                                                                      ['id'],
                                                                  name:
                                                                      _nameEdit
                                                                          .text,
                                                                  nomor:
                                                                      _phoneEdit
                                                                          .text,
                                                                  context:
                                                                      context);
                                                            });
                                                            _nameEdit.clear();
                                                            _phoneEdit.clear();
                                                            print(contact
                                                                .contacts);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        },
                                                        child: const Text(
                                                          '  Submit  ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(Icons.edit, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                contact.removeContacts(
                                    id: contact.contacts[index]['id'],
                                    context: context);
                              });
                            },
                            icon: const Icon(Icons.delete, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
