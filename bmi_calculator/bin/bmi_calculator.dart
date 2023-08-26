import 'dart:convert';
import 'dart:io';

import 'package:bmi_calculator/classes/Person.dart';

dynamic name;
String nameConverted = '';
dynamic height;
double heightConverted = 0;
dynamic weight;
double weightConverted = 0;

void getName() {
  print("Digite seu nome:");
  name = stdin.readLineSync(encoding: utf8);
  RegExp regex = RegExp(r"^[a-zA-Z\s]+$");
  if(regex.hasMatch(name)) {
    nameConverted = name.toString();
  } else {
    print('Insira apenas letras. Exemplo: Maria da Silva');
    getName();
  }
}

void getHeight() {
  print("Digite sua altura, em metros:");
  height = stdin.readLineSync(encoding: utf8);
  try {
    heightConverted = double.parse(height);
  } catch (e) {
    print('Insira apenas números. Exemplo: 1.83');
    getHeight();
  }
}

void getWeight() {
  print("Digite seu peso, em quilos:");
  weight = stdin.readLineSync(encoding: utf8);
  try {
    weightConverted = double.parse(weight);
  } catch (e) {
    print('Insira apenas números. Exemplo: 60.5');
    getWeight();
  }
}

void main() {
  getName();
  print(nameConverted);
  getHeight();
  print(heightConverted);
  getWeight();
  print(weightConverted);
}
