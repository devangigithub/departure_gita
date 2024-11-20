import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:departure_gita/provider/lag_provider.dart';
import 'package:departure_gita/provider/them_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List decodedJson = [];

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("data/geeta_data.json").then((value) {
      decodedJson = jsonDecode(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final lagProvider = Provider.of<LagProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
      title: Text(
        lagProvider.getLanguageText('अध्याय', 'અધ્યાય', 'Chapter',),
        style: GoogleFonts.kalam(
          fontSize: 30,
          // color: Colors.black,
          letterSpacing: 4,
        ),
      ),

      actions: [
        Row(
          children: [
            DropdownButton<String>(
              value: lagProvider.currentLanguage,
              items: [
                DropdownMenuItem(
                  value: 'hi',
                  child: Text(lagProvider.getLanguageText('हिंदी', 'हिंदी','हिंदी',),
                      style: GoogleFonts.kalam(fontSize: 22,)),
                ),
                DropdownMenuItem(
                  value: 'gu',
                  child: Text(lagProvider.getLanguageText( 'ગુજરાતી', 'ગુજરાતી','ગુજરાતી'),
                      style: GoogleFonts.kalam(fontSize: 22,)),
                  ),

                DropdownMenuItem(
                  value: 'en',
                  child: Text(lagProvider.getLanguageText('English', 'English','English'),
                      style: GoogleFonts.kalam(fontSize: 22, )),
                ),

              ],
              onChanged: (String? value) {
                if (value != null) {
                  lagProvider.toggleLanguage(value); // Update language in provider
                }
              },
            ),

            IconButton(
                  icon: Icon(
                    themeProvider.themeModel.isLight
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: themeProvider.themeModel.isLight ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    themeProvider.changeTheme(); // Toggle theme mode
                  },
                ),
  ],
      ),
],
    ),

      body: decodedJson.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemBuilder: (context, index) {
            Map<String, dynamic> item = decodedJson[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: ListTile(
                shape: Border.all(width: 1, color: Colors.white),
                tileColor: Colors.grey.shade500,
                minTileHeight: 50,
                leading: Text(
                  lagProvider.getLanguageText(
                    "${item['ch_number']}",
                    "${item['ch_number_gujarati']}",
                        "${item['chapter_number']}"
                  ),

                  style: GoogleFonts.kalam(fontSize: 18, color: Colors.white),
                ),
                title: Text(
                  lagProvider.getLanguageText(
                    "${item['name']}",
                    "${item['name_gujarati']}",
                    "${item['image_name']}",
                  ),

                  style: GoogleFonts.kalam(fontSize: 22, color: Colors.white),
                ),
                subtitle: Text(
                  lagProvider.getLanguageText(
                  "${item['name_translation']}",
                  "${item['name_translation_gujarati']}",
                  "${item['name_meaning']}",
                ),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('detail_page', arguments: item);
                },
              ),
            );
          },
          itemCount: decodedJson.length,
        ),
      ),
    );
  }
}

