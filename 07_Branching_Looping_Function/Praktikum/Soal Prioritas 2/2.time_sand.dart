import 'dart:io';

void main(List<String> args) {
  // display time sand

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < i; j++) {
      // Prints spaces before the asterisks
      stdout.write(" ");
    }

    for (int k = 0; k <= (8 - i) * 2; k++) {
      // Prints the asterisks
      stdout.write("0");
    }

    // Prints a new line
    print("");
  }

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8 - i; j++) {
      // Prints spaces before the asterisks
      stdout.write(" ");
    }

    for (int k = 0; k <= i * 2; k++) {
      // Prints the asterisks
      stdout.write("0");
    }

    // Prints a new line
    print("");
  }
}
