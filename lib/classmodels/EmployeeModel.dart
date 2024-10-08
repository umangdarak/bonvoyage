class Employee {
  final int id;
  final int employeeNumber;
  final String employeeName;
  final String employeeType;
  final String joinDate;
  final String birthDate;
  final String leftDate;
  final int category;
  final String categoryName;
  final int descCode;
  final String descName;
  final int locationCode;
  final String locationName;
  final int deptCode;
  final String deptName;
  final String emailId;
  final String place;
  final String sex;
  final String incDate;
  final String panGIRNumber;
  final String state;
  final String orgCode;
  final String divCode;
  final String fatherOrHusbandName;
  final int managerId;
  final int hodId;
  final String mobileNo;
  final String profitCentre;
  final String costCentre;
  final int gradeCode;
  final String cadre;
  final String levelId;
  final int mprDeptCode;
  final String mprDivision;
  final String mprFunction;
  final String mprDepartment;
  final String mprLocation;
  final String esiEligibleDate;
  final String modifiedDate;
  final String managerName;
  final String managerMail;
  final String hodName;
  final String hodMail;

  Employee({
    required this.id,
    required this.employeeNumber,
    required this.employeeName,
    required this.employeeType,
    required this.joinDate,
    required this.birthDate,
    required this.leftDate,
    required this.category,
    required this.categoryName,
    required this.descCode,
    required this.descName,
    required this.locationCode,
    required this.locationName,
    required this.deptCode,
    required this.deptName,
    required this.emailId,
    required this.place,
    required this.sex,
    required this.incDate,
    required this.panGIRNumber,
    required this.state,
    required this.orgCode,
    required this.divCode,
    required this.fatherOrHusbandName,
    required this.managerId,
    required this.hodId,
    required this.mobileNo,
    required this.profitCentre,
    required this.costCentre,
    required this.gradeCode,
    required this.cadre,
    required this.levelId,
    required this.mprDeptCode,
    required this.mprDivision,
    required this.mprFunction,
    required this.mprDepartment,
    required this.mprLocation,
    required this.esiEligibleDate,
    required this.modifiedDate,
    required this.managerName,
    required this.managerMail,
    required this.hodName,
    required this.hodMail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'employeeId': employeeNumber,
      'employeeName': employeeName,
      'employeeType': employeeType,
      'joinDate': joinDate,
      'birthDate': birthDate,
      'leftDate': leftDate,
      'category': category,
      'categoryName': categoryName,
      'descCode': descCode,
      'descName': descName,
      'locationCode': locationCode,
      'locationName': locationName,
      'deptCode': deptCode,
      'deptName': deptName,
      'emailId': emailId,
      'place': place,
      'sex': sex,
      'incDate': incDate,
      'panGIRNumber': panGIRNumber,
      'state': state,
      'orgCode': orgCode,
      'divCode': divCode,
      'fatherOrHusbandName': fatherOrHusbandName,
      'managerId': managerId,
      'hodId': hodId,
      'mobileNo': mobileNo,
      'profitCentre': profitCentre,
      'costCentre': costCentre,
      'gradeCode': gradeCode,
      'cadre': cadre,
      'levelId': levelId,
      'mprDeptCode': mprDeptCode,
      'mprDivision': mprDivision,
      'mprFunction': mprFunction,
      'mprDepartment': mprDepartment,
      'mprLocation': mprLocation,
      'esiEligibleDate': esiEligibleDate,
      'modifiedDate': modifiedDate,
      'managerName': managerName,
      'managerMail': managerMail,
      'hodName': hodName,
      'hodMail': hodMail,
    };
  }
}
