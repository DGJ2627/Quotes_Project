import 'dart:convert';

import 'package:final_project/Helper/APICalling.dart';
import 'package:final_project/model/qutoes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Database/SQL/sql_lite.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userMood = Get.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(userMood),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {

              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/Json/quotesJsonData.json"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List myQuotesData = decodedData[userMood];
            List<Quotes_Model> moodQuotesData =
                myQuotesData.map((e) => Quotes_Model.fromMap(data: e)).toList();
            return ListView.builder(
              itemCount: moodQuotesData.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListTile(

                  title: Text(moodQuotesData[i].quote),
                  subtitle: Text(moodQuotesData[i].author),
                  trailing: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          moodQuotesData[i].count,
                        ),
                       
                        IconButton(onPressed: (){
                          DbHelper.dbHelper.addQuotes(dataModel: moodQuotesData[i].quote);
                        }, icon: const Icon(CupertinoIcons.bookmark),),
                      ],
                    ),
                  ),
                ),
              ),

            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
