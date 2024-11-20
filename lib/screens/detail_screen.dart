import 'package:departure_gita/provider/lag_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final lagProvider = Provider.of<LagProvider>(context);

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Detail Page'),
        ),
        body: Center(
          child: Text(
            'No data provided!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lagProvider.getLanguageText(
            "${arguments['name']}",
            "${arguments['name_gujarati']}",
            "${arguments['image_name']}",
          ),

          style: GoogleFonts.kalam(fontSize: 30,letterSpacing: 3),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                lagProvider.getLanguageText(
                  " अध्याय क्रमांक : ${arguments['chapter_number']}",
                  " અધ્યાય ક્રમાંક : ${arguments['chapter_number']}",
                  "chapter Number: ${arguments['chapter_number']}",
                ),

                style: GoogleFonts.kalam(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                lagProvider.getLanguageText(
                  " श्लोक साँख्या : ${arguments['verses_count']}",
                  " શ્લોક સાંખ્યા : ${arguments['verses_count']}",
                  "Count of shlokas : ${arguments['verses_count']}",
                ),

                style: GoogleFonts.kalam(fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            if (arguments['url'] != null)
              Container(
                height: 250,
                width: double.infinity,
                child: Image.asset(arguments['url'],fit: BoxFit.cover,),
              )
            else
              Text(
                'Image not available',
                style: TextStyle(color: Colors.grey),
              ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: Text("${arguments['slok']}",style: GoogleFonts.kalam(fontSize: 18),textAlign: TextAlign.center,)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      lagProvider.getLanguageText(
                        " श्लोक सारांश :\n    ${arguments['slok_summary_hindi']}",
                        " શ્લોક સારાંશ :\n    ${arguments['slok_summary_gujarati']}",
                        "Summary of the shlokas :\n    ${arguments['slok_summary_english']}",
                      ),

                      style: GoogleFonts.kalam(fontSize: 20),
                    ),
                  ),

                ],
              ),
        
            ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      lagProvider.getLanguageText(
                        " अध्याय  सारांश :\n",
                        " અધ્યાય સારાંશ :\n",
                        "Summary of the chapter :\n",
                      ),
                      style: GoogleFonts.kalam(fontSize: 25,fontWeight:FontWeight.w700 ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: Text(
                      lagProvider.getLanguageText(
                        "   ${arguments['chapter_summary_hindi']}",
                        "    ${arguments['chapter_summary_gujarati']}",
                        "  ${arguments['chapter_summary']}",
                      ),

                      style: GoogleFonts.kalam(fontSize: 22),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
  }

