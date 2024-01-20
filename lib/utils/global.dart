import 'package:flutter/cupertino.dart';

Map dataList={
  "name":"","email":"","contact":"","addresss":"","image":""
};
List<Map> chocolateList=
[
  {"name":"","price":0,"quantity":0,"s1":TextEditingController(),"s2":TextEditingController(),"s3":TextEditingController()},

];
int total = 0;
int gst  = 0;
void sum()
{
  for(int i=0;i<chocolateList.length;i++)
    {
      total = total+((chocolateList[i]["price"]*chocolateList[i]["quantity"])as int);
    }
  gst = total+(total*18~/100);
}
