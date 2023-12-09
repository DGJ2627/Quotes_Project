import 'dart:convert';
import 'dart:developer';
import 'package:final_project/model/qutoes_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  Database? db;

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "quotesDB.db");

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String qry =
          "CREATE TABLE IF NOT EXISTS QUOTES(quoteId INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT);";
      
      await db.execute(qry);
    });
  }
  
  
  Future<int?> addQuotes({required String dataModel}) async{
    await initDb();
    String qury = "INSERT INTO QUOTES (quotes) VALUES(?);";
    List argument = [
      dataModel,
    ];
    int? res = await db?.rawInsert(qury,argument);

    log("====================================ok=====================================");
    
    return res;
  }

  Future<List<Quotes_Model>>? fetchQuotes() async {
    await initDb();
    String qury = "SELECT * FROM QUOTES;";
    List<Map<String,dynamic>>? res = await db?.rawQuery(qury);

    List<Quotes_Model> myAllData =  res!.map((e) => Quotes_Model.fromMap(data: e)).toList();

    log("====================================done=====================================");

    return myAllData;
  }

  // Future addMood() async {
  //   await initDb();
  //
  //   String path = "lib/Json/quotesJsonData.json";
  //
  //   String jsonData = await rootBundle.loadString(path);
  //   List decodedData = await jsonDecode(jsonData);
  //
  //   List<moodModel> mood =
  //   decodedData.map((e) => moodModel.fromMap(e)).toList();
  //
  //   // List<moodModel> moods = await mood.localJson
  //   for (int i = 0; i < mood.length; i++) {
  //     String qry = "INSERT INTO moods(moodId, quotesMood) VALUES (? , ?);";
  //     List arg = [
  //       mood[i].id,
  //       mood[i].quotesMood,
  //     ];
  //
  //     await db!.rawInsert(qry, arg);
  //   }
  //
  //   for (int i = 0; i < mood.length; i++) {
  //     for (int j = 0; j < mood[i].quotes.length; j++) {
  //       String qry1 =
  //           "INSERT INTO quotes(quote_id, quoteMood, quote, author) VALUES (?,?,?,?);";
  //
  //       List arg1 = [
  //         mood[i].quotes[j].id,
  //         mood[i].quotes[j].mood,
  //         mood[i].quotes[j].quote,
  //         mood[i].quotes[j].author,
  //       ];
  //       await db!.rawInsert(qry1, arg1);
  //     }
  //   }
  //
  //   // getStorage.write("isTableInserted", true);
  //   tableInsert = true;
  // }
  //
  // Future<List<moodDbModel>> fetchAllMoods() async {
  //   await initDb();
  //   if (tableInsert != true) {
  //     await addMood();
  //   }
  //
  //   String qry = "SELECT * FROM moods;";
  //
  //   List<Map<String, dynamic>> res = await db!.rawQuery(qry);
  //
  //   List<moodDbModel> allMoods =
  //   res.map((e) => moodDbModel.formMap(data: e)).toList();
  //
  //   return allMoods;
  // }
  //
  // Future<List<QuotesDabModel>> fetchAllQuotes({required String mood}) async {
  //   await initDb();
  //   String qry = "SELECT * FROM quotes WHERE quoteMood = ?;";
  //   List args = [mood];
  //
  //   List<Map<String, dynamic>> res = await db!.rawQuery(qry, args);
  //   List<QuotesDabModel> allQuotes =
  //   res.map((e) => QuotesDabModel.formMap(data: e)).toList();
  //
  //   return allQuotes;
  // }
}