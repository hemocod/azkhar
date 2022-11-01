// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations

import 'package:azkhar/models/section_detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const SectionDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SectionDetailScreenState createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  List<SectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    // ignore: todo

    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 52, 52),
        title: Text("${widget.title}",
            style: GoogleFonts.lalezar(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              fontSize: 30,
              color: Color.fromARGB(255, 207, 176, 62),
            
            
            )),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
             
              decoration: BoxDecoration(color: Color.fromARGB(255, 226, 223, 223), boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 36, 33, 33).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
              child: ListTile(
                title: Text(
                  "${sectionDetails[index].reference}",
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 36, 33, 33),
                  ),
                ),
                subtitle: Text(
                  "${sectionDetails[index].content}",
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 27,
                    color: Color.fromARGB(255, 36, 33, 33),
                     
                  ),
               
                  
                ),
                

              ),
              

            );
            
          },
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: Colors.grey.withOpacity(.8),
          ),
          itemCount: sectionDetails.length,
        ),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail =
            SectionDetailModel.fromJson(section);

        if (_sectionDetail.section_id == widget.id) {
          sectionDetails.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
