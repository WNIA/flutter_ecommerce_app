void main() {
  Student s1 = Student();
//   print(s1.getInfo());
  s1.name = 'Shimu';
  s1.courseName = 'cse';
  s1.email = 'a@g.com';
  s1.phone = '88';

  Student s2 = Student();
  s2.name = 'tt';

  var s3 = Student() ..courseName = 'rafi' ..phone = '77';
  print(s1.getInfo());
  print(s2.getInfo());
  print(s3.getInfo());
}

class Student {
  String name;
  String email;
  String phone;
  String courseName;

//   student(){
//     //default constructor
//     //if no use, no need
//   }
  String getInfo() => 'Name: $name, Email: $email, Phone: $phone, Course Name: $courseName';

}