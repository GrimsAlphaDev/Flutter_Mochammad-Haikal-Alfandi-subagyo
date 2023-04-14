import 'package:app_section_27/model/contacts_model.dart';
import 'package:app_section_27/view/screen/prioritas_2/prioritas_2_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contact_test.mocks.dart';

@GenerateMocks([Prioritas2ViewModel])
void main() {
  group('Contacts', () {
    final Prioritas2ViewModel contacsViewModel = MockPrioritas2ViewModel();

    List<ContacsModel> contacts = [];

    test('Insert Data Contacts Return Data', () {
      when(contacsViewModel.addContact(
        name: "Fernando Torez",
        color: "ff00000",
        date: "11-08-2001",
        file:
            "/storage/emulated/0/Android/data/com.example.app_section_27/files/Pictures/IMG_20210811_101000.jpg",
        nomor: "082554553",
      )).thenAnswer((_) async {
        contacts = await Prioritas2ViewModel().addContact(
          name: "Fernando Torez",
          color: "ff00000",
          date: "11-08-2001",
          file:
              "/storage/emulated/0/Android/data/com.example.app_section_27/files/Pictures/IMG_20210811_101000.jpg",
          nomor: "082554553",
        );

        expect(contacts.isNotEmpty, true);
      });
    });

    test('Get All Contacts Return Data', () {
      when(contacsViewModel.getContacts()).thenAnswer((_) async {
        contacts = await Prioritas2ViewModel().getContacts();
        expect(contacts.isNotEmpty, true);
      });
    });
  });
}
