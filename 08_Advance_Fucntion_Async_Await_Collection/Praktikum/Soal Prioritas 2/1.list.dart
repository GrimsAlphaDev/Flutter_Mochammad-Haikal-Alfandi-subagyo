void main(List<String> args) {
  print("Sepatu HypeBeast");

  List listSepatu = [];
  listSepatu.add(["Adidas", "Adidas Samba"]);
  listSepatu.add(["Nike", "Nike Airmax"]);

  // print before convert
  print(listSepatu);

  // convert bio to map
  Map listSepatuMap =
      Map.fromIterable(listSepatu, key: (e) => e[0], value: (e) => e[1]);

  print(listSepatuMap);
}
