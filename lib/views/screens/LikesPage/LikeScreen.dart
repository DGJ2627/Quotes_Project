import 'package:flutter/material.dart';

import '../../../Database/SQL/sql_lite.dart';
import '../../../model/qutoes_model.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: FutureBuilder(
        future: DbHelper.dbHelper.fetchQuotes(),
        builder: (context, snapshot) => ListView.builder(
          itemBuilder: (context, index) {
            if (snapshot.hasError) {
              return Text("$snapshot.hasError");
            } else if (snapshot.hasData) {
              List<Quotes_Model>? allData = snapshot.data;
              return (allData!.isEmpty)
                  ?  Center(
                      child: Text("DATA NOT FOUND",style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    )
                  : ListView.builder(
                      itemCount: allData.length,
                      itemBuilder: (context, i) => ListTile(
                        title: Text(allData[i].quote,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                      ),
                    );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
