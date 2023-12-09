import 'dart:convert';

import 'package:final_project/Constant/text_string.dart';
import 'package:final_project/Helper/APICalling.dart';
import 'package:final_project/model/qutoes_model.dart';
import 'package:final_project/views/screens/HomeScreens/QuoteScreen.dart';
import 'package:final_project/views/screens/LikesPage/LikeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Authentication/AuthenticationRepo.dart';
import '../../../Constant/Colors.dart';
import '../../../Constant/emojiList.dart';
import '../../../model/DetailsModel.dart';
import '../Horizontal_List/CategoryCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.kLightAccentColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(CustomText.appName.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(color: Colors.black87)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjLejMWAMeU8ra4vu2INSgVPe0INxrrV6Emw&usqp=CAU",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(),
            ),
            ListTile(
              onTap: (){
                Get.to(const LikeScreen());
              },
              leading: const Icon(Icons.favorite),
              title: Text(
                "Liked Quote",
                style: GoogleFonts.aclonica(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                "gautam",
                style: GoogleFonts.aclonica(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: Text(
                "FAQs",
                style: GoogleFonts.aclonica(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email_rounded),
              title: Text(
                "Contact us",
                style: GoogleFonts.aclonica(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star_rate),
              title: Text(
                "Rate Us",
                style: GoogleFonts.aclonica(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: EmojiMood.allMood.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: EmojiMood.allMood[index],
                    onPressed: (b) {
                      for (var category in EmojiMood.allMood) {
                        category.isSelected = false;
                      }
                      setState(() {
                        EmojiMood.allMood[index].isSelected = true;
                        String myMood = EmojiMood.allMood[index].title;
                        Get.to(const QuoteScreen(), arguments: myMood);
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // FutureBuilder(
            //   future: rootBundle
            //       .loadString("lib/Json/quotesJsonData.json"),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Center(
            //         child: Text("${snapshot.hasError}"),
            //       );
            //     } else if (snapshot.hasData) {
            //       String data = snapshot.data!;
            //       Map decodedData = jsonDecode(data);
            //       List myQuotesData = decodedData["Life"];
            //       List<Quotes_Model> moodQuotesData = myQuotesData
            //           .map((e) => Quotes_Model.fromMap(data: e))
            //           .toList();
            //       return ListView.builder(
            //         itemCount: moodQuotesData.length,
            //         itemBuilder: (context, i) => ListTile(
            //           title: Text(moodQuotesData[i].quote,style: const TextStyle(color: Colors.black,height: 16),),
            //           subtitle: Text(moodQuotesData[i].author,style: const TextStyle(color: Colors.black,height: 16),),
            //           trailing: Text(
            //             moodQuotesData[i].count
            //               ,style: const TextStyle(color: Colors.black,height: 16),
            //           ),
            //         ),
            //       );
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
