import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'global.dart';
Future<void> createPDF() async {
  var pdf =pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (context) {
        return  pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Bill",style: pw.TextStyle(fontSize: 30,fontWeight: pw.FontWeight.bold),),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Name:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("${dataList['name']}",style: pw.TextStyle(fontSize: 18),),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Email:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("${dataList['email']}",style: pw.TextStyle(fontSize: 18),),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("ContactNo.:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("${dataList['contact']}",style: pw.TextStyle(fontSize: 18),),
              ],
            ),
            pw.Divider(thickness:2),
            pw.Center(child: pw.Text("Invoice items ",style: pw.TextStyle(fontSize: 25)),),
            pw.SizedBox(height: 10,),
            pw.Column(
              children: List.generate(chocolateList.length,(index)=> pw.Column(
        children: [
          pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Name:",style: pw.TextStyle(fontSize: 20),),
                      pw.Text("${chocolateList[index]["name"]}",style: pw.TextStyle(fontSize: 18),),
                    ],
                  ),
          pw.SizedBox(height: 20,),
          pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Price:",style: pw.TextStyle(fontSize: 20),),
                      pw.Text("${chocolateList[index]["price"]}",style: pw.TextStyle(fontSize: 18),),
                    ],
                  ),
          pw.SizedBox(height: 20,),
          pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Quantity:",style: pw.TextStyle(fontSize: 20),),
                      pw.Text("${chocolateList[index]["quantity"]}",style: pw.TextStyle(fontSize: 18),),
                    ],
                  ),
                ],
              ),
              ),
            ),
            pw.Divider(thickness:2),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Total:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("\$",style: pw.TextStyle(fontSize: 18),),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Gst:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("18%",style:  pw.TextStyle(fontSize: 18),),
              ],
            ),
            pw.SizedBox(height: 20,),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Net Total Price:",style: pw.TextStyle(fontSize: 20),),
                pw.Text("\$$gst",style: pw.TextStyle(fontSize: 18),),
              ],
            ),
          ],
        );
      }
  )
  );
  await Printing.layoutPdf(onLayout: (format)=>pdf.save(),);
}