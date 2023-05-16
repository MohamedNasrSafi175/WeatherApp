void main() {
  //print(createMasses());
  print('Hello My World');
  Future.delayed(
    Duration(seconds: 3),
    () {
      print('Hello World');
    },
  );
  print("TheMohamed");
}

dynamic createMasses() async {
  var ordrt = await TheOrder;
  return 'The Massese is $ordrt';
}

Future<String> TheOrder() => Future.delayed(
      Duration(seconds: 3),
      () => "HelloWorld",
    );
