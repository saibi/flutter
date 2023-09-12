void main(List<String> args) {
  // const age1 = 18;
  // const age2 = 7;

  // const result = age1 / age2;
  // print(result);
  // const result2 = age1 ~/ age2;
  // print(result2);

  var age = 30;
  print(--age); // unary prefix operator
  print(age--); // unary postfix operator
}

// fswatch -o bin/ | xargs -n1 -I{} sh -c 'clear; dart bin/example1.dart'

// 0110 0011
// shift left by 1
// 
