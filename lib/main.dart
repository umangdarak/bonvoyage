import 'package:bonvoyage/classmodels/EmployeeModel.dart';
import 'package:bonvoyage/forms/carbooking.dart';
import 'package:bonvoyage/garbage/databaseentry.dart';
import 'package:bonvoyage/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(), child: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const LoginPage(),
        'car': (ctx) => const CarBooking(),
        '/data': (ctx) => const DatabaseEntryDummy()
      },
    );
  }
}

class AuthProvider extends ChangeNotifier {
  String _username = '';
  String _password = '';
  String get username => _username;
  String get password => _password;

  Employee current = Employee(
    id: 0,
    employeeNumber: 0,
    employeeName: '',
    employeeType: '',
    joinDate: '',
    birthDate: '',
    leftDate: '',
    category: 0,
    categoryName: '',
    descCode: 0,
    descName: '',
    locationCode: 0,
    locationName: '',
    deptCode: 0,
    deptName: '',
    emailId: '',
    place: '',
    sex: '',
    incDate: '',
    panGIRNumber: '',
    state: '',
    orgCode: '',
    divCode: '',
    fatherOrHusbandName: '',
    managerId: 0,
    hodId: 0,
    mobileNo: '',
    profitCentre: '',
    costCentre: '',
    gradeCode: 0,
    cadre: '',
    levelId: '',
    mprDeptCode: 0,
    mprDivision: '',
    mprFunction: '',
    mprDepartment: '',
    mprLocation: '',
    esiEligibleDate: '',
    modifiedDate: '',
    managerName: '',
    managerMail: '',
    hodName: '',
    hodMail: '',
  );

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateCurrentEmployee(Map<String, dynamic> data) {
    current = Employee(
      id: data['id'] ?? current.id,
      employeeNumber: data['EmployeeNumber'] ?? current.employeeNumber,
      employeeName: data['EmployeeName'] ?? current.employeeName,
      employeeType: data['EmployeeType'] ?? current.employeeType,
      joinDate: data['JoinDate'] ?? current.joinDate,
      birthDate: data['BirthDate'] ?? current.birthDate,
      leftDate: data['LeftDate'] ?? current.leftDate,
      category: data['Category'] ?? current.category,
      categoryName: data['CategoryName'] ?? current.categoryName,
      descCode: data['DescCode'] ?? current.descCode,
      descName: data['DescName'] ?? current.descName,
      locationCode: data['LocationCode'] ?? current.locationCode,
      locationName: data['LocationName'] ?? current.locationName,
      deptCode: data['DeptCode'] ?? current.deptCode,
      deptName: data['DeptName'] ?? current.deptName,
      emailId: data['EmailId'] ?? current.emailId,
      place: data['Place'] ?? current.place,
      sex: data['Sex'] ?? current.sex,
      incDate: data['IncDate'] ?? current.incDate,
      panGIRNumber: data['PanGIRNumber'] ?? current.panGIRNumber,
      state: data['State'] ?? current.state,
      orgCode: data['OrgCode'] ?? current.orgCode,
      divCode: data['DivCode'] ?? current.divCode,
      fatherOrHusbandName:
          data['FatherOrHusbandName'] ?? current.fatherOrHusbandName,
      managerId: data['ManagerId'] ?? current.managerId,
      hodId: data['HodId'] ?? current.hodId,
      mobileNo: data['MobileNo'] ?? current.mobileNo,
      profitCentre: data['ProfitCentre'] ?? current.profitCentre,
      costCentre: data['CostCentre'] ?? current.costCentre,
      gradeCode: data['GradeCode'] ?? current.gradeCode,
      cadre: data['Cadre'] ?? current.cadre,
      levelId: data['LevelId'] ?? current.levelId,
      mprDeptCode: data['MprDeptCode'] ?? current.mprDeptCode,
      mprDivision: data['MprDivision'] ?? current.mprDivision,
      mprFunction: data['MprFunction'] ?? current.mprFunction,
      mprDepartment: data['MprDepartment'] ?? current.mprDepartment,
      mprLocation: data['MprLocation'] ?? current.mprLocation,
      esiEligibleDate: data['EsiEligibleDate'] ?? current.esiEligibleDate,
      modifiedDate: data['ModifiedDate'] ?? current.modifiedDate,
      managerName: data['ManagerName'] ?? current.managerName,
      managerMail: data['ManagerMail'] ?? current.managerMail,
      hodName: data['HODName'] ?? current.hodName,
      hodMail: data['HODMail'] ?? current.hodMail,
    );
    notifyListeners();
  }
}
// class AuthProvider extends ChangeNotifier {
//   String _username = '';
//   String _password = '';
//   String get username => _username;
//   String get password => _password;
//   late Employee current;
//   void setUsername(String username) {
//     _username = username;
//     notifyListeners();
//   }

//   void setPassword(String password) {
//     _password = password;
//     notifyListeners();
//   }
// }
