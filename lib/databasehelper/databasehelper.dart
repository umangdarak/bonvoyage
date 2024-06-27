import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class DataBaseHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase('first.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await oneWayDomesticTable(database);
      await oneWayInternationalTable(database);
      await travellerDetailsTable(database);
      await companyBusTable(database);
      await accomodationDetails(database);
      await carBookingDetails(database);
      await roundtrip(database);
      await roundtripinternational(database);
      await multicityMultipleTable(database);
      await multicityTable(database);
      await multicityTabledomestic(database);
      await multicityMultipleTableDomestic(database);
    });
  }

  static Future<void> multicityTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE multicity(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      sameuser TEXT,
      visa TEXT,
currencymode TEXT,
        currency TEXT,
        amount TEXT,
        remarkscurrency TEXT,
              cab TEXT,
      purpose TEXT,
      insurancerequired TEXT,
      insurancefromdate TEXT,
      insurancetodate TEXT,
      insuranceavailability TEXT,
      insurancename TEXT,
      insurancevaliddate TEXT,
      connectiontotravellertable TEXT,
      issync INTEGER DEFAULT 0
    )
''');
  }

  static Future<void> multicityTabledomestic(sql.Database database) async {
    await database.execute('''
    CREATE TABLE multicitydomestic(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      sameuser TEXT,
      currencymode TEXT,
      currency TEXT,
      amount TEXT,
      cab TEXT,
      purpose TEXT,
      connectiontotravellertable TEXT,
      issync INTEGER DEFAULT 0
    )
''');
  }

  static Future<void> multicityMultipleTableDomestic(
      sql.Database database) async {
    await database.execute('''
CREATE TABLE multicityeachdomestic(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      connection TEXT,
      travelmode TEXT,
      travelclass TEXT,
      origin TEXT,
      destination TEXT,
      traveldate TEXT,
      traveltime TEXT,
      eta TEXT,
      food TEXT,
      accomodation TEXT,
      bags TEXT,
      hotel TEXT,
      occupancy TEXT,
      checkin TEXT,
      checkout TEXT,
      remarks TEXT,
      seat TEXT,
      weight TEXT
      )
''');
  }

  static Future<void> multicityMultipleTable(sql.Database database) async {
    await database.execute('''
CREATE TABLE multicityeach(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      connection TEXT,
      travelmode TEXT,
      travelclass TEXT,
      origin TEXT,
      destination TEXT,
      traveldate TEXT,
      traveltime TEXT,
      eta TEXT,
      food TEXT,
      accomodation TEXT,
      bags TEXT,
      hotel TEXT,
      occupancy TEXT,
      checkin TEXT,
      checkout TEXT,
      remarks TEXT,
      seat TEXT,
      weight TEXT,
      region TEXT)
''');
  }

  static Future<void> oneWayInternationalTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE onewayinternational(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      travelmode TEXT,
      travelclass TEXT,
      origin TEXT,
      destination TEXT,
      traveldate TEXT,
      traveltime TEXT,
      eta TEXT,
      food TEXT,
      accomodation TEXT,
      bags TEXT,
      comments TEXT,
      hotel TEXT,
      occupancy TEXT,
      checkin TEXT,
      checkout TEXT,
      remarks TEXT,
      seat TEXT,
      weight TEXT,
      region TEXT,
      visa TEXT,
currencymode TEXT,
        currency TEXT,
        amount TEXT,
        remarkscurrency TEXT,
              cab TEXT,
      purpose TEXT,
      insurancerequired TEXT,
      insurancefromdate TEXT,
      insurancetodate TEXT,
      insuranceavailability TEXT,
      insurancename TEXT,
      insurancevaliddate TEXT,
      connectiontotravellertable TEXT,
      issync INTEGER DEFAULT 0
    )
''');
  }

  static Future<void> companyBusTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE companybus(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      gender TEXT,
      level TEXT,
      department TEXT,
      email TEXT,
      mobileno TEXT,
      approver TEXT,
      requester TEXT,
      goingto TEXT,
      people TEXT,
      traveldate TEXT,
      purpose TEXT,
      comments TEXT,
      droplocation TEXT,
      debitexpenses TEXT,
      costorproject TEXT,
      issync INTEGER DEFAULT 0
    )
''');
  }

  static Future<void> roundtripinternational(sql.Database database) async {
    await database.execute('''
CREATE TABLE roundtripinternational(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        travelmode TEXT,
        travelclass TEXT,
        origin TEXT,
        destination TEXT,
        traveldate TEXT,
        traveltime TEXT,
        eta TEXT,
        food TEXT,
        comments TEXT,
        accomodation TEXT,
        occupancy TEXT,
        hotel TEXT,
        checkin TEXT,
        checkout TEXT,
        bags TEXT,
        totalweight TEXT,
        remarks TEXT,
        seat TEXT,
        region TEXT,
        traveltypereturn TEXT,
        travelclassreturn TEXT,
        seatreturn TEXT,
        traveldatereturn TEXT,
        traveltimereturn TEXT,
        etareturn TEXT,
        foodreturn TEXT,
        commentsreturn TEXT,
        regionreturn TEXT,
        currencymode TEXT,
        currency TEXT,
        amount TEXT,
        remarkscurrency TEXT,
        cab TEXT,
        purpose TEXT,
        visa TEXT,
        insurancerequired TEXT,
        insurancefromdate TEXT,
        insurancetodate TEXT,
        insuranceavailability TEXT,
        connectiontotravellertable TEXT,
        insurancename TEXT,
        insurancevaliddate TEXT,
        issync INTEGER DEFAULT 0)
''');
  }

  static Future<void> roundtrip(sql.Database database) async {
    await database.execute('''
 CREATE TABLE roundtripdomestic(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        travelmode TEXT,
        travelclass TEXT,
        origin TEXT,
        destination TEXT,
        traveldate TEXT,
        traveltime TEXT,
        eta TEXT,
        food TEXT,
        comments TEXT,
        accomodation TEXT,
        occupancy TEXT,
        hotel TEXT,
        checkin TEXT,
        checkout TEXT,
        bags TEXT,
        totalweight TEXT,
        remarks TEXT,
        seat TEXT,
        travelmodereturn TEXT,
        travelclassreturn TEXT,
        originreturn TEXT,
        destinationreturn TEXT,
        seatreturn TEXT,
        traveldatereturn TEXT,
        traveltimereturn TEXT,
        etareturn TEXT,
        foodreturn TEXT,
        bagreturn TEXT,
        totalweightreturn TEXT,
        remarksreturn TEXT,
        currencymode TEXT,
        currency TEXT,
        amount TEXT,
        cab TEXT,
        purpose TEXT,
        region TEXT,
        connectiontotravellertable TEXT,
        issync INTEGER DEFAULT 0)
''');
  }

  static Future<void> accomodationDetails(sql.Database database) async {
    await database.execute('''
      CREATE TABLE accomodation(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        accomodation TEXT,
        occupancy TEXT,
        hotel TEXT,
        city TEXT,
        checkin TEXT,
        checkout TEXT,
        people TEXT,
        adults TEXT,
        children TEXT,
        rooms TEXT,
        remarks TEXT,
       currencymode TEXT,
        currency TEXT,
        amount TEXT,
       cab TEXT,
        purpose TEXT,
 approver TEXT,
    travellername TEXT,
    travellergender TEXT,
    travellerlevel TEXT,
    department TEXT,
    email TEXT,
    mobileno TEXT,
    debitexpenses TEXT,
    costorproject TEXT, 
    requester TEXT,
    comments TEXT,
            issync INTEGER DEFAULT 0
      )
''');
  }

  static Future<void> carBookingDetails(sql.Database database) async {
    await database.execute('''
    CREATE TABLE carbooking(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            fromplace TEXT,
            places TEXT,
            people TEXT,
            cartype TEXT,
            fromdate TEXT,
            todate TEXT,
            pickupdetails TEXT,
            travellername TEXT,
            travellergender TEXT,
            level TEXT,
            department TEXT,
            email TEXT,
            mobileno TEXT,
            approver TEXT,
            debitexpenses TEXT,
            project TEXT,
            requester TEXT,
            comments TEXT,
            purpose TEXT,
            issync INTEGER DEFAULT 0
    )
''');
  }

  static Future<void> travellerDetailsTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE travellerdetails(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    connection TEXT,
    approver TEXT,
    travellername TEXT,
    travellergender TEXT,
    travellerlevel TEXT,
    department TEXT,
    email TEXT,
    mobileno TEXT,
    debitexpenses TEXT,
    costorproject TEXT, 
    requester TEXT,
    comments TEXT
    )
''');
  }

  static Future<void> oneWayDomesticTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE onewaydomestic(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      travelmode TEXT,
      travelclass TEXT,
      origin TEXT,
      destination TEXT,
      traveldate TEXT,
      traveltime TEXT,
      eta TEXT,
      food TEXT,
      accomodation TEXT,
      bags TEXT,
      comments TEXT,
      hotel TEXT,
      occupancy TEXT,
      checkin TEXT,
      checkout TEXT,
      remarks TEXT,
      seat TEXT,
      weight TEXT,
      currencymode TEXT,
      currency TEXT,
      amount TEXT,
      cab TEXT,
      purpose TEXT,
      connectiontotravellertable TEXT,
      issync INTEGER DEFAULT 0
    )

''');
  }

  static Future<int> insertItemOneWayDom(
      Map<String, dynamic> d, String table) async {
    final output = await db();
    return output.insert(table, d, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<List<Map<String, dynamic>>> readOneWayDom(String table) async {
    final output = await db();
    return output.query(table);
  }

  static Future<Future<List<Map<String, Object?>>>> readOneItem(
      String table, int id) async {
    final output = await db();
    return output.query(table, where: "id=?", whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> readOneItemRandom(
      String table, String column, String columnvalue) async {
    final output = await db();
    return output.query(table, where: "${column}=?", whereArgs: [columnvalue]);
  }

  static Future<int> deleteOneWayDom(int id, String table) async {
    final output = await db();
    return output.delete(table, where: "id=?", whereArgs: [id]);
  }

  static Future<int> deletewholetableonewaydom(String table) async {
    final output = await db();
    return output.delete(table);
  }
}
