class Employee{

  int _id;
  double _salary;
  String _name;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Employee(this._id, this._salary, this._name);

  double get salary => _salary;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  set salary(double value) {
    _salary = value;
  }

}