import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactsApi {
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

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future fetchContact() async {
    try {
      final response = await dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');

      debugPrint(response.data.toString());

      return response;
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

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
