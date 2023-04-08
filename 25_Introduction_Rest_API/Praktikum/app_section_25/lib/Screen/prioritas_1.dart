import 'package:app_section_25/Model/contacts_model.dart';
import 'package:app_section_25/Model/put_data_model.dart';
import 'package:app_section_25/Services/services.dart';
import 'package:flutter/material.dart';

class Prioritas1 extends StatefulWidget {
  const Prioritas1({super.key});

  final routeName = '/prioritas1';

  @override
  State<Prioritas1> createState() => _Prioritas1State();
}

class _Prioritas1State extends State<Prioritas1> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyPut = GlobalKey<FormState>();
  final _namaLengkap = TextEditingController();
  final _noHandphone = TextEditingController();
  final List<ContactsModel> _contacts = [];
  final List<ContactsModel> _fetchContacts = [];
  final List<PutData> _putContacts = [];
  final Services services = Services();
  final _title = TextEditingController(text: 'foo');
  final _body = TextEditingController(text: 'bar');

  @override
  void dispose() {
    _namaLengkap.dispose();
    _noHandphone.dispose();
    _contacts.clear();
    _fetchContacts.clear();
    _putContacts.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Prioritas 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Post Request Data Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _namaLengkap,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _noHandphone,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'No Handphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Handphone tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          services
                              .postDataContact(
                                  name: _namaLengkap.text,
                                  phone: _noHandphone.text)
                              .then((contacts) {
                            setState(() {
                              _contacts.add(contacts);
                            });
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Silahkan Cek Console'),
                            ),
                          );
                          clearText();
                        }
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(15), child: Text('Simpan')),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Data Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_contacts[index].name ?? ''),
                    subtitle: Text(_contacts[index].phone ?? ''),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Tugas No 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  services.fetchContact().then((contacts) {
                    _fetchContacts.clear();
                    _fetchContacts.add(contacts);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Silahkan Cek Console'),
                      ),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Convert Json ke Class Object'),
                          content: SingleChildScrollView(
                              child: Column(children: [
                            Text('Nama Lengkap : ${_fetchContacts[0].name}'),
                            Text('No Handphone : ${_fetchContacts[0].phone}'),
                          ])),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'convert json menjadi object dari suatu class',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Tugas No 3 PUT Request',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKeyPut,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _title,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _body,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Body',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Body tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKeyPut.currentState!.validate()) {
                          services
                              .putDataContacts(
                            title: _title.text,
                            body: _body.text,
                          )
                              .then((contacts) {
                            _putContacts.clear();
                            _putContacts.add(contacts);
                            // send notification
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Silahkan Cek Console'),
                              ),
                            );
                            debugPrint(_putContacts[0].body.toString());
                            debugPrint(_putContacts[0].title.toString());
                          });
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('Simpan'),
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

  void clearText() {
    _namaLengkap.clear();
    _noHandphone.clear();
  }
}
