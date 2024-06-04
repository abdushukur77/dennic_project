// import 'package:dennic_project/data/model/doctor_model/doctor_model.dart';
// import 'package:dennic_project/utils/constants/app_constants.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class LocalDatabase {
//   static final databaseInstance = LocalDatabase._();
//
//   LocalDatabase._();
//
//   factory LocalDatabase() {
//     return databaseInstance;
//   }
//
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _init("todo.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _init(String databaseName) async {
//     String internalPath = await getDatabasesPath();
//     String path = join(internalPath, databaseName);
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const textType = "TEXT NOT NULL";
//     const intType = "INTEGER DEFAULT 0";
//
//     await db.execute('''
//     CREATE TABLE ${AppConstants.tableName} (
//     ${AppConstants.id} $idType,
//     ${AppConstants.firstName} $textType,
//     ${AppConstants.lastName} $textType,
//     ${AppConstants.imageUrl} $textType,
//     ${AppConstants.gender} $textType,
//     ${AppConstants.birthDate} $textType,
//     ${AppConstants.phoneNumber} $textType,
//     ${AppConstants.email} $textType,
//     ${AppConstants.address} $textType,
//     ${AppConstants.city} $textType,
//     ${AppConstants.country} $textType,
//     ${AppConstants.salary} $intType,
//     ${AppConstants.startTime} $textType,
//     ${AppConstants.finishTime} $textType,
//     ${AppConstants.dayOfWeek} $textType,
//     ${AppConstants.bio} $textType,
//     ${AppConstants.startWorkDate} $textType,
//     ${AppConstants.endWorkDate} $textType,
//     ${AppConstants.workYears} $intType,
//     ${AppConstants.departmentId} $textType,
//     ${AppConstants.roomNumber} $intType,
//     ${AppConstants.createdAt} $textType,
//     ${AppConstants.updatedAt} $textType,
//     ${AppConstants.deletedAt} $textType,
//     ${AppConstants.patientCount} $intType
//     )
//     ''');
//   }
//
//   static Future<DoctorModel> insertNote(DoctorModel doctorModel) async {
//     final db = await databaseInstance.database;
//
//     int savedNoteId =
//         await db.insert(AppConstants.tableName, doctorModel.toJson());
//
//     return doctorModel.copyWith(id: savedNoteId);
//   }
//
//   static Future<List<DoctorModel>> getAllNotes() async {
//     final db = await databaseInstance.database;
//     String orderBy = "${AppConstants.id} DESC";
//     List json = await db.query(AppConstants.tableName, orderBy: orderBy);
//     return json.map((e) => DoctorModel.fromJson(e)).toList();
//   }
//
//   static Future<int> deleteNoteId(String id) async {
//     final db = await databaseInstance.database;
//     int deleteId = await db.delete(AppConstants.tableName,
//         where: "${AppConstants.id} = ?", whereArgs: [id]);
//     return deleteId;
//   }
// }
