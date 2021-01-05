void main() {
  //signature
  //body

  //data types
  int x = 10;
  String s = 'Bangladesh'; //""or'' can be used but common is ''
  double d = 20.2; //dart doesn't have float
  bool status = false;
  //no matter the data type, all of them are object in dart
//   print(s.toUpperCase());

  var y =
  29; //no data type declared. dart compiler sees integer type 29. considers //it integer

//   print(y.runtimeType);

//   var z = 56c;<--error
//   print(z.runtimeType);

  dynamic something = 'something';
//   print(something.runtimeType);
  something = false;
//   print(something.runtimeType);
  something = 20;
//   print(something.runtimeType);//difference between var and dynamic, var cannot store different datatype from the initial one but dynamic can.

  num n = 20;
  num m = 23.9; //num takes both integer and double
//   print(n.runtimeType);
//   print(m.runtimeType);

  final i = 20; //final keyword means constant. cannot change value
  const j =
      'bitm'; //same as final. extra features of constant will be discussed later.
//   i = 'w';<---error

  //list
  var marks = []; //dynamic list
//   print(marks.runtimeType);
  var mark = [20, 30, false, 'someone', {}, []]; //object list
//   print(mark.runtimeType);
  for (var i = 0; i < mark.length; i++) {
//     print(mark[i]);
  }
  marks = [20, 10, 90, 30, 60, 55];
  for (var j in marks) {
//     print(j);//better to use this
//     if (j%3 == 0)//mod
//       print(j);
  }

  //map
  var personOne = {
    'Name': 'Mr. XYZ',
    'Age': 30,
    'NID': 203942905,
    'Phone': '+8801711******',
    'Email': 'xyz@gmail.com'
  }; //key-value pair

//   print(personOne['Phone']);//key must be same as input
//   print(personOne);

  //difference between map and list: list accessed using index, map accessed using key

  var people = [
    {
      'Name': 'Mr. XYZ',
      'Age': 30,
      'NID': 203942905,
      'Phone': '+8801711******',
      'Email': 'xyz@gmail.com'
    },
    {
      'Name': 'Mr. ABC',
      'Age': 31,
      'NID': 203942906,
      'Phone': '+8801712******',
      'Email': 'abc@gmail.com'
    },
    {
      'Name': 'Mr. PQR',
      'Age': 32,
      'NID': 203942907,
      'Phone': '+8801713******',
      'Email': 'pqr@gmail.com'
    }
  ];
  for (var p in people) {
//     print('${p['Name']} - ${p['Age']}');
  }

  int b = 100;
//   print('x is ${x.bitLength}');//to call method use bracket after $ sign

  //function: to stop repetation


//   add2num(7, 8);
//   print(mul2num(7, 8));//for return type

//   add2num(6, 2);
//   print(mul2num(6, 2));

  //Another way of writing
  //fat arrow line

  add2num(6, 2);
  print(mul2num(6, 2));

  sum(7, 7);

  //annoynymous function: declared inside main
      () {
    print('something is happening');
  };

//   Function si = () => print('i am a plant');// have to print si to see output.
  //higher order function: special type of function which takes another function as argument / can take another function as parameter.

  var grade = [4, 3.7, 3.9, 3.3, 2.7];
//   grade.forEach(jekonokichu);//can receive another function as parameter
//   grade.forEach((num element){
//   print(element);
// });

  //some function returning another function is also higher order function
  Function someFunction(Function f) => (){};

  grade.forEach((num element) => print(element));

  someFunction(() => print('goodbye'));
} //main

void someFunction (Function f){
  print(f());
}


void jekonokichu(num element){
  print(element);
}

sum(num b, num c) {
  print(b + c);
}

//   void add2num(num x, num y){
//     print (x + y);
//   }
//   num mul2num(num x, num y){
//     return x * y;
//   }

add2num(num x, num y) => print(x + y);

mul2num(num x, num y) => x * y;
