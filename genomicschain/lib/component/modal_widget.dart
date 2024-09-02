import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true));

void main() {
  runApp(const XonoBlockModal());
}

class XonoBlockModal extends StatelessWidget {
  const XonoBlockModal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showCustomModalBottomSheet(context);
            },
            child: const Text('Show Modal Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}

void showMetadataAlert(BuildContext context, VoidCallback onRequest) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.only(top: 10.0),
        title: const Text(
          "내 데이터 분석을 의뢰하시겠습니까?",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                      child: const Text('의뢰', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onRequest();
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                      child: const Text('취소', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}

void showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return const CustomModalContent();
    },
  );
}

class CustomModalContent extends StatefulWidget {
  const CustomModalContent({super.key});

  @override
  CustomModalContentState createState() => CustomModalContentState();
}

class CustomModalContentState extends State<CustomModalContent> {
  // 각 분석 항목의 상태를 저장
  List<Map<String, dynamic>> datas = [
    {
      'title': '5대 주요 암 분석',
      'desc': '유방암, 대장암, 폐암 등의 유전적 위험도 분석 및 특정 유전자 변이 검사',
      'status': '대기',
    },
    {
      'title': '만성질환 분석',
      'desc': '당뇨병, 고혈압, 알츠하이머병 등 만성질환의 유전적 소인 확인',
      'status': '대기',
    },
    {
      'title': '심혈관 질환 분석',
      'desc': '심장질환, 뇌졸중 등의 특정 유전자 변이 소인 확인 및 위험 요인 분석',
      'status': '진행중',
    },
  ];

  void _handleAnalysisRequest(int index) {
    showMetadataAlert(context, () {
      setState(() {
        datas[index]['status'] = '의뢰중'; // 상태 업데이트
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController, // scrollController 적용
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 정보 영역
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('샘플 유형',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('혈액',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('채취일',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('2024.8.15',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('샘플 채취 위치',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('서울대학교병원, 유전체 연구소',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('분석 기술',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('전장 유전체 시퀀싱 (WGS)',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('시퀀싱 플랫폼',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('illumina NovaSeq 6000',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('데이터 익명화 여부',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('익명화',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('데이터 접근 권한 허용',
                              style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                          const Text('제한적',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF536DFE))),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // 분석 항목 리스트
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: datas.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = datas[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: const AssetImage('assets/img/t_img_13.jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data['title'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800]),
                                        ),
                                        Text(
                                          data['desc'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 80,
                                    height: 35,
                                    child: ElevatedButton(
                                      onPressed: data['status']=='대기' ? () => _handleAnalysisRequest(index) : null,
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                          data['status']=='대기' ? const Color(0xFF536DFE) : 
                                            data['status']=='진행중' ? Colors.green : 
                                              Colors.grey),
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0), // 버튼 내부 패딩 설정
                                        ),
                                      ),
                                      child: Text(
                                        data['status']=='대기' ? '분석' : data['status'],
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, height: 1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
