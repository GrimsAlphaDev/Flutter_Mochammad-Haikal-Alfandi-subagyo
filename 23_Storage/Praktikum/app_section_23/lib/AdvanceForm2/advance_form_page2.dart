import 'dart:io';

import 'package:app_section_23/AdvanceForm2/ContactsBloc/bloc/contact_bloc.dart';
import 'package:app_section_23/AdvanceForm2/Database/bloc/database_bloc.dart';
import 'package:app_section_23/AdvanceForm2/advance_contact.dart';
import 'package:app_section_23/Login/login_app.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvanceFormPage2 extends StatefulWidget {
  const AdvanceFormPage2({super.key});

  @override
  State<AdvanceFormPage2> createState() => _AdvanceFormPage2State();
}

class _AdvanceFormPage2State extends State<AdvanceFormPage2> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKeyEdit = GlobalKey<FormState>();
  final _dateinput = TextEditingController();
  final _colorinput = TextEditingController();
  final _fileinput = TextEditingController();
  AdvanceContact contact = AdvanceContact();
  final currentDate = DateTime.now();
  Color _currentColor = const Color.fromARGB(255, 224, 188, 215);
  late Color _currentColorEdit;
  ContactBloc? _contactBloc;

  RegExp regex =
      RegExp(r"^[a-zA-Z ]*$"); // regular expression untuk huruf dan spasi
  RegExp regexAngka = RegExp(r"^[0-9]*$");

  late SharedPreferences loginData;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _dateinput.dispose();
    _colorinput.dispose();
    _fileinput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatabaseBloc>(
          create: (context) => DatabaseBloc()..initDatabase(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          actions: [
            IconButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('username');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginApp()));
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocConsumer<DatabaseBloc, DatabaseState>(
            listener: (context, state) {
          if (state is LoadDatabaseState) {
            _contactBloc =
                ContactBloc(database: context.read<DatabaseBloc>().database!);
          }
        }, builder: (context, state) {
          if (state is LoadDatabaseState) {
            return BlocProvider<ContactBloc>(
              create: (context) => _contactBloc!..getContacts(),
              child: BlocConsumer<ContactBloc, ContactState>(
                listener: (context, contactState) {},
                builder: (context, contactState) {
                  if (contactState is ContactInitial) {
                    final contacts = _contactBloc!.contacts;
                    return Padding(
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
                                    child: const Icon(
                                        Icons.phone_android_outlined),
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
                                  Text('Welcome $username'),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: const Text(
                                      'A dialog is a type of  modal window that appears in fornt of app content to provide critical information, or prompt for a decision to be made.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 88, 88, 88)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
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
                                      fillColor:
                                          Color.fromARGB(255, 240, 228, 237),
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
                                      fillColor:
                                          Color.fromARGB(255, 240, 228, 237),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Masukan Nomor Anda Terlebih Dahulu';
                                      }

                                      if (!regexAngka.hasMatch(value)) {
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
                                    keyboardType: TextInputType.phone,
                                    controller: _phone,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: TextFormField(
                                      controller:
                                          _dateinput, //editing controller of this TextField
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
                                          lastDate:
                                              DateTime(currentDate.year + 5),
                                        );

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);

                                          setState(() {
                                            _dateinput.text =
                                                formattedDate; //set output date to TextField value.
                                          });
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
                                    controller: _colorinput,
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
                                                  setState(() {
                                                    _currentColor = color;
                                                    final hexColor = color.value
                                                        .toRadixString(16);
                                                    _colorinput.text =
                                                        hexColor.toString();
                                                  });
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: TextFormField(
                                      controller: _fileinput,
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
                                          setState(() {
                                            _fileinput.text =
                                                pickedFile.files.single.path!;
                                          });
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
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (_contactBloc != null) {
                                              _contactBloc!.addContact(
                                                name: _name.text,
                                                nomor: _phone.text,
                                                color: _colorinput.text,
                                                date: _dateinput.text,
                                                file: _fileinput.text,
                                                context: context,
                                              );
                                            }

                                            _name.clear();
                                            _phone.clear();
                                            _colorinput.clear();
                                            _dateinput.clear();
                                            _fileinput.clear();
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
                              child: contacts.isEmpty
                                  ? const Center(
                                      child: Text('No Contacts'),
                                    )
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                        color: Colors.black,
                                      ),
                                      itemCount: contacts.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: FileImage(
                                              File(contacts[index].file),
                                            ),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(
                                                contacts[index].name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                        '0x${contacts[index].color}'),
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
                                                contacts[index].nomor,
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
                                                contacts[index].date,
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
                                                      builder: (BuildContext
                                                          context) {
                                                        TextEditingController
                                                            nameEdit =
                                                            TextEditingController(
                                                                text: contacts[
                                                                        index]
                                                                    .name);
                                                        TextEditingController
                                                            phoneEdit =
                                                            TextEditingController(
                                                                text: contacts[
                                                                        index]
                                                                    .nomor);
                                                        TextEditingController
                                                            colorEdit =
                                                            TextEditingController(
                                                                text: contacts[
                                                                        index]
                                                                    .color);
                                                        TextEditingController
                                                            dateEdit =
                                                            TextEditingController(
                                                                text: contacts[
                                                                        index]
                                                                    .date);
                                                        TextEditingController
                                                            fileEdit =
                                                            TextEditingController(
                                                                text: contacts[
                                                                        index]
                                                                    .file);
                                                        _currentColorEdit =
                                                            Color(int.parse(
                                                                '0x${contacts[index].color}'));

                                                        return AlertDialog(
                                                          content: Stack(
                                                            children: [
                                                              Positioned(
                                                                right: -40.0,
                                                                top: -40.0,
                                                                child:
                                                                    InkResponse(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      const CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    child: Icon(
                                                                        Icons
                                                                            .close),
                                                                  ),
                                                                ),
                                                              ),
                                                              SingleChildScrollView(
                                                                child: Form(
                                                                  key:
                                                                      _formKeyEdit,
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child:
                                                                            const Text(
                                                                          'Edit Kontak',
                                                                          style:
                                                                              TextStyle(fontSize: 22),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          label:
                                                                              Text('Name'),
                                                                          contentPadding:
                                                                              EdgeInsets.all(15),
                                                                          filled:
                                                                              true,
                                                                          fillColor: Color.fromARGB(
                                                                              255,
                                                                              240,
                                                                              228,
                                                                              237),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Masukan Nama Anda Terlebih Dahulu';
                                                                          }

                                                                          if (value.split(' ').length <
                                                                              2) {
                                                                            return 'Nama Harus Memiliki 2 Kata';
                                                                          }

                                                                          if (value[0] !=
                                                                              value[0].toUpperCase()) {
                                                                            return 'Nama Harus Dimulai Dengan Huruf Besar';
                                                                          }

                                                                          // Nama tidak boleh mengandung angka atau karakter khusus.
                                                                          if (!regex
                                                                              .hasMatch(value)) {
                                                                            return 'Input tidak boleh mengandung angka atau karakter khusus';
                                                                          }

                                                                          return null;
                                                                        },
                                                                        controller:
                                                                            nameEdit,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          contentPadding:
                                                                              EdgeInsets.all(15),
                                                                          label:
                                                                              Text('Nomor'),
                                                                          filled:
                                                                              true,
                                                                          fillColor: Color.fromARGB(
                                                                              255,
                                                                              240,
                                                                              228,
                                                                              237),
                                                                        ),
                                                                        validator:
                                                                            (value) {
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

                                                                          if (value[0] !=
                                                                              '0') {
                                                                            return 'Nomor Harus Dimulai Dengan 0';
                                                                          }

                                                                          return null;
                                                                        },
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        controller:
                                                                            phoneEdit,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            dateEdit, //editing controller of this TextField
                                                                        decoration: const InputDecoration(
                                                                            icon: Icon(Icons.calendar_today), //icon of text field
                                                                            labelText: "Masukan Tanggal" //label text of field
                                                                            ),
                                                                        readOnly:
                                                                            true, //set it true, so that user will not able to edit text
                                                                        onTap:
                                                                            () async {
                                                                          final pickedDate =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                currentDate,
                                                                            firstDate:
                                                                                DateTime(1990),
                                                                            lastDate:
                                                                                DateTime(currentDate.year + 5),
                                                                          );

                                                                          if (pickedDate !=
                                                                              null) {
                                                                            String
                                                                                formattedDate =
                                                                                DateFormat('dd-MM-yyyy').format(pickedDate);

                                                                            setState(() {
                                                                              _dateinput.text = formattedDate; //set output date to TextField value.
                                                                            });
                                                                          }
                                                                        },
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Masukan Tanggal Anda Terlebih Dahulu';
                                                                          }

                                                                          return null;
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            colorEdit,
                                                                        //editing controller of this TextField
                                                                        decoration:
                                                                            InputDecoration(
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              _currentColorEdit,
                                                                          label:
                                                                              const Text(
                                                                            "Pilih Warna",
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                          //label text of field
                                                                        ),
                                                                        readOnly:
                                                                            true, //set it true, so that user will not able to edit text
                                                                        onTap:
                                                                            () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder: (context) =>
                                                                                AlertDialog(
                                                                              title: const Text('Pick a color!'),
                                                                              content: SingleChildScrollView(
                                                                                child: BlockPicker(
                                                                                    // ColorPicker(
                                                                                    // SlidePicker(
                                                                                    pickerColor: _currentColorEdit,
                                                                                    onColorChanged: (color) {
                                                                                      setState(() {
                                                                                        _currentColorEdit = color;
                                                                                        final hexColor = color.value.toRadixString(16);
                                                                                        colorEdit.text = hexColor.toString();
                                                                                      });
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
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Masukan Warna Anda Terlebih Dahulu';
                                                                          }

                                                                          return null;
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            fileEdit,
                                                                        decoration: const InputDecoration(
                                                                            icon:
                                                                                Icon(Icons.file_upload),
                                                                            labelText: "Upload File" //label text of field
                                                                            ),
                                                                        readOnly:
                                                                            true,
                                                                        onTap:
                                                                            () async {
                                                                          final pickedFile = await FilePicker
                                                                              .platform
                                                                              .pickFiles(
                                                                            type:
                                                                                FileType.image,
                                                                          );

                                                                          if (pickedFile !=
                                                                              null) {
                                                                            // store the file path to different path
                                                                            setState(() {
                                                                              fileEdit.text = pickedFile.files.single.path!;
                                                                            });
                                                                          }
                                                                        },
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Masukan File Anda Terlebih Dahulu';
                                                                          }

                                                                          return null;
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          ElevatedButton(
                                                                            style:
                                                                                ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 98, 51, 141)),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              if (_formKeyEdit.currentState!.validate()) {
                                                                                if (_contactBloc != null) {
                                                                                  _contactBloc!.updateContact(
                                                                                    name: nameEdit.text,
                                                                                    color: colorEdit.text,
                                                                                    context: context,
                                                                                    date: dateEdit.text,
                                                                                    file: fileEdit.text,
                                                                                    nomor: phoneEdit.text,
                                                                                    id: contacts[index].id,
                                                                                  );
                                                                                }

                                                                                nameEdit.clear();
                                                                                phoneEdit.clear();
                                                                                dateEdit.clear();
                                                                                fileEdit.clear();
                                                                                colorEdit.clear();

                                                                                Navigator.of(context).pop();
                                                                              }
                                                                            },
                                                                            child:
                                                                                const Text(
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
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                icon: const Icon(Icons.edit,
                                                    color: Colors.black),
                                              ),
                                              IconButton(
                                                onPressed: () async {
                                                  _contactBloc!.removeContact(
                                                      id: contacts[index].id);
                                                },
                                                icon: const Icon(Icons.delete,
                                                    color: Colors.black),
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
                    );
                  }
                  return const SizedBox(
                    child: Text('Belum ada Kontak'),
                  );
                },
              ),
            );
          }
          return const Center(child: Text('Database not Loaded'));
        }),
      ),
    );
  }
}
