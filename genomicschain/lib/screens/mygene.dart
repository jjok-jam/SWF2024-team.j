import 'package:flutter/material.dart';
import 'package:genomicschain/component/modal_widget.dart';
import 'package:genomicschain/screens/report.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/percent_indicator.dart';

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true));

void main() {
  runApp(const MyGeneScreen());
}

class MyGeneScreen extends StatelessWidget {
  const MyGeneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyGenePage(),
    );
  }
}

class MyGenePage extends StatefulWidget {
  const MyGenePage({super.key});

  @override
  MyGeneScreenState createState() => MyGeneScreenState();
}

class MyGeneScreenState extends State<MyGenePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int currentStep = 2;
    int totalSteps = 3;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE),
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('유전체 분석 의뢰 현황',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ]),
              ),
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '심혈관 유전자 검진',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF536DFE),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 24,
                              child: ElevatedButton(
                                onPressed: null, // null > ElevatedButton 비활성화
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              horizontal: 12.0, vertical: 4.0)),
                                ),
                                child: const Text('진행중',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyReportPage(), // ReportPage로 이동
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.info_outline,
                            color: Color(0xFF536DFE),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '분석 요청일: 2021년 8월 10일',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '분석 기관: Smart Health',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '만설질환의 발명 가능성을 예측할 수 있습니다.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(totalSteps, (index) {
                              if (index == 0) {
                                return Text(
                                  '분석 의뢰\n접수 완료',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: index < currentStep
                                        ? const Color(0xFF536DFE)
                                        : Colors.grey,
                                  ),
                                );
                              } else if (index == 1) {
                                return Text(
                                  '분석 진행중',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: index < currentStep
                                        ? const Color(0xFF536DFE)
                                        : Colors.grey,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    '8월27일\n완료예정',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: index < currentStep
                                          ? const Color(0xFF536DFE)
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                width: 15,
                                height: 5,
                                color: const Color(0xFF536DFE),
                              ),
                            ),
                            const Icon(
                              Icons.radio_button_checked,
                              color: Color(0xFF536DFE),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                width: 120,
                                height: 5,
                                color: const Color(0xFF536DFE),
                              ),
                            ),
                            const Icon(
                              Icons.radio_button_checked,
                              color: Color(0xFF536DFE),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                width: 120,
                                height: 5,
                                color: const Color(0xFF536DFE),
                              ),
                            ),
                            const Icon(Icons.radio_button_unchecked,
                                color: Color(0xFF536DFE)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                width: 15,
                                height: 5,
                                color: const Color(0xFF536DFE),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(totalSteps, (index) {
                              String text;
                              if (index == 0) {
                                text = '요청';
                              } else if (index == 1) {
                                text = '진행';
                              } else {
                                text = '완료';
                              }
                              return Text(
                                text,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: index < currentStep
                                      ? const Color(0xFF536DFE)
                                      : Colors.grey,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE),
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('나의 유전자 데이터',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ]),
              ),
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.5,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: 0.9,
                            center: const Text("180GB",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            leading: const Text("WGS",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            barRadius: const Radius.circular(20),
                            progressColor: const Color(0xFF536DFE),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFF536DFE)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Text('상세보기',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                showCustomModalBottomSheet(context);
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.5,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: 0.3,
                            center: const Text("20GB",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            leading: const Text("WES",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            barRadius: const Radius.circular(20),
                            progressColor: const Color(0xFF536DFE),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF536DFE)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: const Text('상세보기',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.5,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: 0.2,
                            center: const Text("10GB",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            leading: const Text("RNA",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            barRadius: const Radius.circular(20),
                            progressColor: const Color(0xFF536DFE),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF536DFE)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: const Text('상세보기',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE),
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('최신 알림',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ]),
              ),
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xFF536DFE),
                                child: Text(
                                  'N',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(width: 10),
                            Text(
                              '심장 질환 위험 예측 분석 착수',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.circle,
                              color: Color.fromRGBO(128, 128, 128, 0.5),
                              size: 5,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '1시간 전',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '의뢰하신 심장 질환 관련 유전체 데이터 분석이 착수되었습니다. 유전자 변이와 심장 질환 간의 상관관계를 중심으로 발병 위험도를 예측 합니다.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Color(0xFF536DFE),
                                child: Text(
                                  'N',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(width: 10),
                            Text(
                              '간암 위험 예측 분석 완료',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.circle,
                              color: Color.fromRGBO(128, 128, 128, 0.5),
                              size: 5, // 더 작은 크기로 설정
                            ),
                            SizedBox(width: 5),
                            Text(
                              '오후 12:34',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '의뢰하신 유전체 데이터를 기반으로 간암 위험 예측 분석을 완료하였습니다.'
                            '이번 분석에서는 특정 유전자 변이(SNP)와 간암 발병률 사이의 상관관계를 평가하였습니다.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
