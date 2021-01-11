import 'package:flutter/material.dart';
import 'package:urban_roof/app/pages/size_config.dart';

class Person {
  String name;
  String address;
  String mob;
  int age;
  String username;

  Person({
    @required this.name,
    this.address,
    this.mob,
    this.age,
    this.username,
  });
}

String name;
String address;
String mob;
int age;
String username;

void saveinfo(String n, String a, String m, int ag, String u){
    name = n;
    address = a;
    mob = m;
    age = ag;
    username = u;
  }

List tasks = [];


const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

String brinjaltext = 'Preparation of pot:\n\nYou will need one pot for two seeds respectively. If you prefer to use seedling trays and other types of Pots which are made of plastic, then it would be...';
String tomatotext = 'Seed Starting and Germination\n\nTomatoes are a warm-season crop and are usually grown as summer annuals. Tomato seeds must be started indoors between March to June. Here’s how...';
String okratext = 'When to Grow Lady Finger in India?\n\n(Feb – March, Late July-Early Aug)\nLady fingers grow best in sunlight, so summer is the best time to grow it but apart from that any season...';
String peastext = 'Best time for growing peas\n\nPeas are actually a cool-season crop with a life cycle of one year. Depending on location, winter to early summer is the best time for growing peas...';
String spinachtext = 'How to Plant Spinach\n\nYou can start spinach indoors or direct seed it in the garden as soon as the soil is workable. Spinach grows quite quickly, so don\'t start plants indoors...';
String chillitext = 'Tips for growing chillies\n\nLeave fruits to turn a rich red colour for a hotter taste. The hotter the variety the longer the whole growing process will take (from germination...';
