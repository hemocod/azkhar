// ignore_for_file: file_names

import 'package:azkhar/models/section_model.dart';
import 'section_detail_screen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 27, 27),
        title: Text(
          'اذكار المسلم اليومية',
           
          
          style: GoogleFonts.lalezar(
            textStyle: const TextStyle(
             
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            fontSize: 30,
             
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
// ignore: prefer_const_constructors
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 8, 19),
              Color.fromARGB(255, 93, 98, 122),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            "${model.name}",
            style: GoogleFonts.lalezar(
              fontSize: 25,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((section) {
        // ignore: no_leading_underscores_for_local_identifiers
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });

      setState(() {});
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
    });
  }
}
