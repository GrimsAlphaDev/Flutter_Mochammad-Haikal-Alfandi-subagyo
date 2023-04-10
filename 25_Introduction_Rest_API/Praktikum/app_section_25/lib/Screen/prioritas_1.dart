import 'package:app_section_25/contact_bloc/bloc/contact_bloc.dart';
import 'package:app_section_25/model/contacts_model.dart';
import 'package:app_section_25/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final Services services = Services();
  final _title = TextEditingController(text: 'foo');
  final _body = TextEditingController(text: 'bar');

  @override
  void dispose() {
    _namaLengkap.dispose();
    _noHandphone.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
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
                          context.read<ContactBloc>().add(
                                ContactEventPost(
                                    name: _namaLengkap.text,
                                    phone: _noHandphone.text),
                              );
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
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
                if (state is ContactInitial) {
                  return const Center(child: Text('Belum ada Contacts'));
                }
                if (state is ContactStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ContactStateSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.contacts[index].name ?? ''),
                        subtitle: Text(state.contacts[index].phone ?? ''),
                      );
                    },
                  );
                }
                if (state is ContactStateError) {
                  return Center(
                    child: Text(state.message.toString()),
                  );
                }
                return const SizedBox();
              }),
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
                  context.read<ContactBloc>().add(ContactEventConvertJson());

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocBuilder<ContactBloc, ContactState>(
                          builder: (context, state) {
                        if (state is ContactStateLoading) {
                          return const AlertDialog(
                            title: Text('Loading'),
                            content: CircularProgressIndicator(),
                          );
                        }
                        if (state is ContactStateSuccess) {
                          return AlertDialog(
                            title: const Text('Convert Json ke Class Object'),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      'Nama Lengkap : ${state.contacts[0].name}'),
                                  Text(
                                      'No Handphone : ${state.contacts[0].phone}'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        }
                        if (state is ContactStateError) {
                          return Center(
                            child: Text(state.message.toString()),
                          );
                        }
                        return const SizedBox();
                      });
                    },
                  );
                  // });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Silahkan Cek Console'),
                    ),
                  );
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
                          context.read<ContactBloc>().add(
                                ContactEventPut(
                                    title: _title.text, body: _body.text),
                              );
                          // send notification
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Silahkan Cek Console'),
                            ),
                          );
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
