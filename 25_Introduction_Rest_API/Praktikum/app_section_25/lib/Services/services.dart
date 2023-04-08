import 'package:app_section_25/Model/contacts_model.dart';
import 'package:app_section_25/Model/put_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Services {
  final Dio dio = Dio();

  Future postDataContact({
    required String name,
    required String phone,
  }) async {
    try {
      final Response response = await dio.post(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
          data: {
            'name': name,
            'phone': phone,
          });
      debugPrint(response.data.toString());

      final ContactsModel contactsModel = ContactsModel.fromJson(response.data);
      return contactsModel;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchContact() async {
    try {
      final response = await dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');

      debugPrint(response.data.toString());

      final ContactsModel contactsModel = ContactsModel.fromJson(response.data);

      return contactsModel;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future putDataContacts({
    required String title,
    required String body,
  }) async {
    try {
      final response =
          await dio.put('https://jsonplaceholder.typicode.com/posts/1', data: {
        'id': 1,
        'title': title,
        'body': body,
        'userId': 1,
      });

      debugPrint(response.data.toString());

      final PutData putData = PutData.fromJson(response.data);

      return putData;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchImageCustom({required String seed}) async {
    try {
      final response = await dio
          .get('https://api.dicebear.com/6.x/pixel-art/svg?seed=$seed');

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchImage() async {
    try {
      final response =
          await dio.get('https://api.dicebear.com/6.x/lorelei/svg');

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
