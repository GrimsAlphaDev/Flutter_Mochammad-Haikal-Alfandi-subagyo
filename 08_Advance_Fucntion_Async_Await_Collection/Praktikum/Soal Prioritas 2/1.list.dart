void main(List<String> args) {
  List bio = [
    ['Haikal Alfandi'],
    [21],
  ];

  // print before convert
  print(bio);

  // convert bio to map with key name and age
  Map<String, dynamic> bioMap = {
    'name': bio[0][0],
    'age': bio[1][0],
  };
  
  print(bioMap);
  
  
}
