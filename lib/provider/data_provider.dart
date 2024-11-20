import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeetaModel {
  final int id;
  final int chapterNumber;
  final int versesCount;
  final String name;
  final String nameMeaning;
  final String nameTranslation;
  final String chapterSummary;
  final String chapterSummaryHindi;

  GeetaModel({
    required this.id,
    required this.chapterNumber,
    required this.versesCount,
    required this.name,
    required this.nameMeaning,
    required this.nameTranslation,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
  });

  factory GeetaModel.fromJson(Map<String, dynamic> json) {
    return GeetaModel(
      id: json['id'],
      chapterNumber: json['chapter_number'],
      versesCount: json['verses_count'],
      name: json['name'],
      nameMeaning: json['name_meaning'],
      nameTranslation: json['name_translation'],
      chapterSummary: json['chapter_summary'],
      chapterSummaryHindi: json['chapter_summary_hindi'],
    );
  }
}

class DataProvider extends ChangeNotifier {
  List<GeetaModel> newData = [];

  Future<void> getGeetaData() async {
    String getData = await rootBundle.loadString('data/geeta_data.json');
    Map geeta = jsonDecode(getData);
    List<dynamic> allData = geeta["geeta"];
    newData = allData
        .map(
          (e) => GeetaModel(
        id: e['id'],
        chapterNumber: e['chapter_number'],
        versesCount: e['verses_count'],
        name: e['name'],
        nameMeaning: e['name_meaning'],
        nameTranslation: e['name_translation'],
        chapterSummary: e['chapter_summary'],
        chapterSummaryHindi: e['chapter_summary_hindi'],
      ),
    )
        .toList();
    notifyListeners();
  }

}
