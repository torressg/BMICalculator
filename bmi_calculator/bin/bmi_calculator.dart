import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bmi_calculator/classes/Person.dart';

dynamic name;
String nameConverted = '';
dynamic height;
double heightConverted = 0;
dynamic weight;
double weightConverted = 0;
double BMI = 0;
dynamic user;

void catchName() {
  print("Digite seu nome:");
  name = stdin.readLineSync(encoding: utf8);
  RegExp regex = RegExp(r"^[a-zA-Z\s]+$");
  if (regex.hasMatch(name)) {
    nameConverted = name.toString();
  } else {
    print('Insira apenas letras. Exemplo: Maria da Silva');
    catchName();
  }
}

void catchHeight() {
  print("Digite sua altura, em metros:");
  height = stdin.readLineSync(encoding: utf8);
  try {
    heightConverted = double.parse(height);
  } catch (e) {
    print('Insira apenas números. Exemplo: 1.83');
    catchHeight();
  }
}

void catchWeight() {
  print("Digite seu peso, em quilos:");
  weight = stdin.readLineSync(encoding: utf8);
  try {
    weightConverted = double.parse(weight);
  } catch (e) {
    print('Insira apenas números. Exemplo: 60.5');
    catchWeight();
  }
}

void addPerson() {
  try {
    user = Person(nameConverted, heightConverted, weightConverted);
  } catch (e) {
    print("Ocorreu um erro, contate o administrador.");
  }
}

void calculateBMI() {
  num heightPow = pow(heightConverted, 2);
  BMI = weightConverted / heightPow;
  print(BMI);
}

void responseToUser(double bmi) {
  print(
      'Olá ${user.getName()}, você mede ${user.getHeight()}m e pesa ${user.getWeight()}Kg.');
  if (bmi < 16) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está com magreza grave.');
  } else if (16 <= bmi && bmi < 17) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está com magreza moderada.');
  } else if (17 <= bmi && bmi < 18.5) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está com magreza leve.');
  } else if (18.5 <= bmi && bmi < 25) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está saudável.');
  } else if (25 <= bmi && bmi < 30) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está com sobrepeso.');
  } else if (30 <= bmi && bmi < 35) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está obesidade grau 1.');
  } else if (35 <= bmi && bmi < 40) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está obesidade grau 2.');
  } else if (bmi >= 40) {
    print(
        'Pelos dados informados seu IMC é $bmi, de acordo com o Ministério da Saúde você está obesidade grau 3.');
  }
}

void main() {
  catchName();
  catchHeight();
  catchWeight();
  calculateBMI();
  addPerson();
  responseToUser(BMI);
}
