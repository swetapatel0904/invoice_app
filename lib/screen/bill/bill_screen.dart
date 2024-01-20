import 'package:flutter/material.dart';
import 'package:invoice_app/utils/global.dart';

import '../../utils/pdf.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bill",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  const Center(child: Text("Customer Details ",style: TextStyle(fontSize: 25)),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Name:",style: TextStyle(fontSize: 20),),
                      Text("${dataList['name']}",style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email:",style: TextStyle(fontSize: 20),),
                      Text("${dataList['email']}",style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("ContactNo.:",style: TextStyle(fontSize: 20),),
                      Text("${dataList['contact']}",style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                  const Divider(thickness:2),
                  const Center(child: Text("Invoice items ",style: TextStyle(fontSize: 25)),),
                  const SizedBox(height: 10,),
                  Column(
                    children: List.generate(chocolateList.length,(index)=> Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Name:",style: TextStyle(fontSize: 20),),
                            Text("${chocolateList[index]["name"]}",style: const TextStyle(fontSize: 18),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Price:",style: TextStyle(fontSize: 20),),
                            Text("${chocolateList[index]["price"]}",style: const TextStyle(fontSize: 18),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Quantity:",style: TextStyle(fontSize: 20),),
                            Text("${chocolateList[index]["quantity"]}",style: const TextStyle(fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                    ),
                  ),
                  const Divider(thickness:2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",style: TextStyle(fontSize: 20),),
                      Text("\$",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gst:",style: TextStyle(fontSize: 20),),
                      Text("18%",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Net Total Price:",style: TextStyle(fontSize: 20),),
                      Text("\$$gst",style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                ],
              ),
          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              createPDF();
            });
          },
          child: const Icon(Icons.save),
        ),

      ),
    );

  }
}
