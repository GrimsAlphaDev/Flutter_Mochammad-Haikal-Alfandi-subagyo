import 'dart:io';

import 'package:app_section_27/utils/state/finit_state.dart';
import 'package:app_section_27/view/screen/prioritas_2/prioritas_2_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Prioritas2Screen extends StatefulWidget {
  static const String routeName = '/prioritas2';

  const Prioritas2Screen({super.key});

  @override
  State<Prioritas2Screen> createState() => _Prioritas2ScreenState();
}

class _Prioritas2ScreenState extends State<Prioritas2Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<Prioritas2ViewModel>(context, listen: false);

      provider.initDatabase();
    });
  }

  final currentDate = DateTime.now();
  Color _currentColor = const Color.fromARGB(255, 224, 188, 215);
  final _formKey = GlobalKey<FormState>();
  final _formKeyEdit = GlobalKey<FormState>();
  late Color _currentColorEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Prioritas 2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Consumer<Prioritas2ViewModel>(builder: (context, provider, _) {
                switch (provider.myState) {
                  case MyState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case MyState.loaded:
                    context.read<Prioritas2ViewModel>().getContacts();
                    return Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                'Create New Contacts',
                                style: TextStyle(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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

                                  return null;
                                },
                                controller: provider.nameController,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukan Nomor Anda Terlebih Dahulu';
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
                                controller: provider.phoneController,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  controller: provider
                                      .dateController, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText:
                                          "Masukan Tanggal" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: currentDate,
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(currentDate.year + 5),
                                    );

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);

                                      provider.dateController.text =
                                          formattedDate; //set output date to TextField value.
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukan Tanggal Anda Terlebih Dahulu';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: provider.colorController,
                                //editing controller of this TextField
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _currentColor,
                                  label: const Text(
                                    "Pilih Warna",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  //label text of field
                                ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                            // ColorPicker(
                                            // SlidePicker(
                                            pickerColor: _currentColor,
                                            onColorChanged: (color) {
                                              _currentColor = color;
                                              final hexColor =
                                                  color.value.toRadixString(16);
                                              provider.colorController.text =
                                                  hexColor.toString();
                                            }),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Simpan'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukan Warna Anda Terlebih Dahulu';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  controller: provider.fileController,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.file_upload),
                                      labelText:
                                          "Upload File" //label text of field
                                      ),
                                  readOnly: true,
                                  onTap: () async {
                                    final pickedFile =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                    );

                                    if (pickedFile != null) {
                                      // store the file path to different path
                                      provider.fileController.text =
                                          pickedFile.files.single.path!;
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukan File Anda Terlebih Dahulu';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 98, 51, 141)),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await provider.addContact(
                                            name: provider.nameController.text,
                                            nomor:
                                                provider.phoneController.text,
                                            date: provider.dateController.text,
                                            color:
                                                provider.colorController.text,
                                            file: provider.fileController.text,
                                            context: context);
                                        provider.nameController.clear();
                                        provider.phoneController.clear();
                                        provider.colorController.clear();
                                        provider.dateController.clear();
                                        provider.fileController.clear();
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
                          height: 10,
                        ),
                        const Text(
                          'Data Contacts',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (provider.contacts.isEmpty)
                          const Center(
                            child: Text('Belum ada Contact'),
                          ),
                        ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.purple,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.contacts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  File(provider.contacts[index].file),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    provider.contacts[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      // color: Color(
                                      color: Color(
                                        int.parse(
                                            '0x${provider.contacts[index].color}'),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    // contact.contacts[index]['nomor']
                                    provider.contacts[index].nomor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('|'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // format date
                                  Text(
                                    // contact.contacts[index]['date']
                                    provider.contacts[index].date,
                                  ),
                                ],
                              ),
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
                                            TextEditingController nameEdit =
                                                TextEditingController(
                                                    text: provider
                                                        .contacts[index].name);
                                            TextEditingController phoneEdit =
                                                TextEditingController(
                                                    text: provider
                                                        .contacts[index].nomor);
                                            TextEditingController colorEdit =
                                                TextEditingController(
                                                    text: provider
                                                        .contacts[index].color);
                                            TextEditingController dateEdit =
                                                TextEditingController(
                                                    text: provider
                                                        .contacts[index].date);
                                            TextEditingController fileEdit =
                                                TextEditingController(
                                                    text: provider
                                                        .contacts[index].file);
                                            _currentColorEdit = Color(int.parse(
                                                '0x${provider.contacts[index].color}'));

                                            return AlertDialog(
                                              content: Stack(
                                                children: [
                                                  Positioned(
                                                    right: -40.0,
                                                    top: -40.0,
                                                    child: InkResponse(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        child:
                                                            Icon(Icons.close),
                                                      ),
                                                    ),
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Form(
                                                      key: _formKeyEdit,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child: const Text(
                                                              'Edit Contacts',
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
                                                              label:
                                                                  Text('Name'),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(15),
                                                              filled: true,
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Masukan Nama Anda Terlebih Dahulu';
                                                              }

                                                              if (value
                                                                      .split(
                                                                          ' ')
                                                                      .length <
                                                                  2) {
                                                                return 'Nama Harus Memiliki 2 Kata';
                                                              }

                                                              if (value[0] !=
                                                                  value[0]
                                                                      .toUpperCase()) {
                                                                return 'Nama Harus Dimulai Dengan Huruf Besar';
                                                              }

                                                              return null;
                                                            },
                                                            controller:
                                                                nameEdit,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(15),
                                                              label:
                                                                  Text('Nomor'),
                                                              filled: true,
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Masukan Nomor Anda Terlebih Dahulu';
                                                              }

                                                              if (value.length <=
                                                                      8 ||
                                                                  value.length >=
                                                                      15) {
                                                                return 'Nomor Tidak Boleh Kurang Dari 8 Dan Lebih Dari 15';
                                                              }

                                                              if (value[0] !=
                                                                  '0') {
                                                                return 'Nomor Harus Dimulai Dengan 0';
                                                              }

                                                              return null;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                            controller:
                                                                phoneEdit,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                dateEdit, //editing controller of this TextField
                                                            decoration:
                                                                const InputDecoration(
                                                                    icon: Icon(Icons
                                                                        .calendar_today), //icon of text field
                                                                    labelText:
                                                                        "Masukan Tanggal" //label text of field
                                                                    ),
                                                            readOnly:
                                                                true, //set it true, so that user will not able to edit text
                                                            onTap: () async {
                                                              final pickedDate =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    currentDate,
                                                                firstDate:
                                                                    DateTime(
                                                                        1990),
                                                                lastDate: DateTime(
                                                                    currentDate
                                                                            .year +
                                                                        5),
                                                              );

                                                              if (pickedDate !=
                                                                  null) {
                                                                String
                                                                    formattedDate =
                                                                    DateFormat(
                                                                            'dd-MM-yyyy')
                                                                        .format(
                                                                            pickedDate);

                                                                dateEdit.text =
                                                                    formattedDate; //set output date to TextField value.
                                                              }
                                                            },
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Masukan Tanggal Anda Terlebih Dahulu';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                colorEdit,
                                                            //editing controller of this TextField
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  _currentColorEdit,
                                                              label: const Text(
                                                                "Pilih Warna",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              //label text of field
                                                            ),
                                                            readOnly:
                                                                true, //set it true, so that user will not able to edit text
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                  title: const Text(
                                                                      'Pick a color!'),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child: BlockPicker(
                                                                        // ColorPicker(
                                                                        // SlidePicker(
                                                                        pickerColor: _currentColorEdit,
                                                                        onColorChanged: (color) {
                                                                          _currentColorEdit =
                                                                              color;
                                                                          final hexColor = color
                                                                              .value
                                                                              .toRadixString(16);
                                                                          colorEdit.text =
                                                                              hexColor.toString();
                                                                        }),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                      child: const Text(
                                                                          'Simpan'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Masukan Warna Anda Terlebih Dahulu';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                fileEdit,
                                                            decoration: const InputDecoration(
                                                                icon: Icon(Icons
                                                                    .file_upload),
                                                                labelText:
                                                                    "Upload File" //label text of field
                                                                ),
                                                            readOnly: true,
                                                            onTap: () async {
                                                              final pickedFile =
                                                                  await FilePicker
                                                                      .platform
                                                                      .pickFiles(
                                                                type: FileType
                                                                    .image,
                                                              );

                                                              if (pickedFile !=
                                                                  null) {
                                                                // store the file path to different path
                                                                fileEdit.text =
                                                                    pickedFile
                                                                        .files
                                                                        .single
                                                                        .path!;
                                                              }
                                                            },
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Masukan File Anda Terlebih Dahulu';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                          Color>(const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          98,
                                                                          51,
                                                                          141)),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (_formKeyEdit
                                                                      .currentState!
                                                                      .validate()) {
                                                                    await provider
                                                                        .updateContact(
                                                                      name: nameEdit
                                                                          .text,
                                                                      nomor: phoneEdit
                                                                          .text,
                                                                      date: dateEdit
                                                                          .text,
                                                                      file: fileEdit
                                                                          .text,
                                                                      color: colorEdit
                                                                          .text,
                                                                      id: provider
                                                                          .contacts[
                                                                              index]
                                                                          .id,
                                                                      context:
                                                                          context,
                                                                    );
                                                                  }
                                                                  nameEdit
                                                                      .clear();
                                                                  phoneEdit
                                                                      .clear();
                                                                  dateEdit
                                                                      .clear();
                                                                  fileEdit
                                                                      .clear();
                                                                  colorEdit
                                                                      .clear();

                                                                  // ignore: use_build_context_synchronously
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  '  Submit  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      provider.removeContact(
                                          id: provider.contacts[index].id);
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  case MyState.failed:
                    return const Center(
                      child: Text('Error'),
                    );
                  default:
                    return const Center(
                      child: Text('Database is not ready'),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
