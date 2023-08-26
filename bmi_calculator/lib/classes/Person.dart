class Person {
  String _name = '';
  double _weight = 0;
  double _height = 0;

//Setter and
  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setWeight(double weight) {
    _weight = weight;
  }

  double getWeight() {
    return _weight;
  }

  void setHeight(double height) {
    _height = height;
  }

  double getHeight() {
    return _height;
  }

  Person(String name, double height, double weight) {
    _name = name;
    _height = height;
    _weight = weight;
  }

  @override
  String toString() {
    return {"Name": _name, "Height": _height, "Weight": _weight}.toString();
  }
}
