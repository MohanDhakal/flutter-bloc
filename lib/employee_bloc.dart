import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  /*
  * Steps for implementing BLOC
  * todo: 1. crete List of employee
  * todo: 2. Stream Controllers
  * todo: 3. Stream Sink getter
  * todo: 4 constructor -add data;listen to the changes on the data
  * todo: 5 core functions
  * todo: dispose */

  List<Employee> _employeeList = [
    Employee(1, 1290.56, "Mohan"),
    Employee(2, 1590.6, "Kumar "),
    Employee(3, 1390.56, "Sumit"),
    Employee(4, 1990.6, "Jitendra"),
    Employee(5, 1670.3, "Keshav"),
  ];

  final _employeelistStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncreementStreamController =
      StreamController<Employee>();
  final _employeeSalaryDicreementStreamController =
      StreamController<Employee>();

  //getters

  Stream<List<Employee>> get employeeListStream =>
      _employeelistStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeelistStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncreement =>
      _employeeSalaryIncreementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecreement =>
      _employeeSalaryIncreementStreamController.sink;

  EmployeeBloc() {
    _employeelistStreamController.add(_employeeList);
    _employeeSalaryIncreementStreamController.stream.listen(_increementSalary);
    _employeeSalaryDicreementStreamController.stream.listen(_decreementSalary);
  }

  void _increementSalary(Employee event) {
    double salary = event.salary;
    double increementedSalary = event.salary * 0.2;
    _employeeList[event.id - 1].salary = salary + increementedSalary;
    employeeListSink.add(_employeeList);
  }

  void _decreementSalary(Employee event) {
    double salary = event.salary;
    double decreementedSalary = event.salary * 0.2;
    _employeeList[event.id - 1].salary = salary - decreementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeSalaryDicreementStreamController.close();
    _employeeSalaryDicreementStreamController.close();
    _employeelistStreamController.close();
  }
}
