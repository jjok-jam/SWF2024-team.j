import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:logger/logger.dart';
import 'package:genomicschain/screens/detail.dart';

void main() {
  runApp(const MyReport());
}

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 100,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class MyReport extends StatelessWidget {
  const MyReport({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyReportPage(),
    );
  }
}

class MyReportPage extends StatefulWidget {
  const MyReportPage({super.key});

  @override
  MyReportPageState createState() => MyReportPageState();
}

class MyReportPageState extends State<MyReportPage> {
  List<Map<String, dynamic>> reports = [
    {
      'key': UniqueKey(),
      'institution': '스마트 헬스',
      'title': 'APOE 알츠하이머 유전자형 검사',
      'subtitle': '알츠하이머형 치매(AD) 진단을 위한 \nApolipoprotein E(ApoE) 유전자형 검사 결과',
      'image': 'assets/img/t_img_17.jpg',
      'createDate': '2024.08.07',
      'requestDate': '2024.08.10',
      'resultDate': '2024.08.16',
      'requestStatus': '완료',
      'riskSummary': '경계',
      'riskSummaryColor': Colors.orange,
      'resultGenes': ['APOE', 'PSEN1', 'PSEN2'],
      'save': false,
    },
    {
      'key': UniqueKey(),
      'institution': '테라 유전자',
      'title': 'BRCA 유방암 유전자형 검사',
      'subtitle': '알츠하이머형 치매(AD) 진단을 위한 \nApolipoprotein E(ApoE) 유전자형 검사 결과',
      'image': 'assets/img/t_img_16.jpg',
      'createDate': '2024.08.07',
      'requestDate': '2024.08.15',
      'resultDate': '2024.08.16',
      'requestStatus': '완료',
      'riskSummary': '양호',
      'riskSummaryColor': Colors.green,
      'resultGenes': ['KRAS', 'BRCA', 'CDKN2B'],
      'save': false,
    },
    {
      'key': UniqueKey(),
      'institution': '마크로 제네틱',
      'title': '유전성 암의 유전자검사',
      'subtitle': '소량의 혈액 채취로 다양한 유전자들의 변이 분석,\n암 발병 위험도 예측 검사 결과',
      'image': 'assets/img/t_img_13.jpg',
      'createDate': '2024.06.10',
      'requestDate': '2024.08.15',
      'resultDate': null,
      'requestStatus': '진행중',
      'save': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    int currentStep = 2;
    int totalSteps = 3;

    return Scaffold(
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          Color iconColor = report['save']
              ? const Color.fromARGB(255, 241, 217, 2)
              : const Color(0xFF536DFE);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTileCard(
              key: report['key'],
              initiallyExpanded: true,
              expandedTextColor: const Color(0xFF536DFE),
              leading: CircleAvatar(
                backgroundColor: report['requestStatus'] == '완료'
                    ? report['riskSummaryColor']
                    : Colors.grey,
                radius: 25,
                child: Text(
                  report['requestStatus'] == '완료'
                      ? report['riskSummary']
                      : report['requestStatus'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              title: Text(report['title']),
              subtitle: Text(
                report['subtitle'],
                style: const TextStyle(
                  color: Color(0xFF676868),
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
              children: <Widget>[
                const Divider(thickness: 1.0, height: 1.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(report['image']),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _buildDetailWidgets(report),
                            ),
                            if (report['requestStatus'] != '완료')
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Column(
                                        children: [
                                          // 단계별 진행상태 표시
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(totalSteps,
                                                (index) {
                                              if (index == 0) {
                                                return Expanded(
                                                  child: Text(
                                                    '분석 요청\n접수 완료',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: index < currentStep
                                                          ? const Color(
                                                              0xFF536DFE)
                                                          : Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              } else if (index == 1) {
                                                return Expanded(
                                                  child: Text(
                                                    '분석 진행중',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: index < currentStep
                                                          ? const Color(
                                                              0xFF536DFE)
                                                          : Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              } else {
                                                return Expanded(
                                                  child: Text(
                                                    '8월27일\n완료예정',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: index < currentStep
                                                          ? const Color(
                                                              0xFF536DFE)
                                                          : Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                );
                                              }
                                            }),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Container(
                                                  width: 20,
                                                  height: 5,
                                                  color:
                                                      const Color(0xFF536DFE),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.radio_button_checked,
                                                color: Color(0xFF536DFE),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Container(
                                                  width: 80,
                                                  height: 5,
                                                  color:
                                                      const Color(0xFF536DFE),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.radio_button_checked,
                                                color: Color(0xFF536DFE),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Container(
                                                  width: 80,
                                                  height: 5,
                                                  color:
                                                      const Color(0xFF536DFE),
                                                ),
                                              ),
                                              const Icon(
                                                  Icons.radio_button_unchecked,
                                                  color: Color(0xFF536DFE)),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Container(
                                                  width: 20,
                                                  height: 5,
                                                  color:
                                                      const Color(0xFF536DFE),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(totalSteps,
                                                (index) {
                                              String text;
                                              if (index == 0) {
                                                text = '요청';
                                              } else if (index == 1) {
                                                text = '진행';
                                              } else {
                                                text = '완료';
                                              }
                                              return Expanded(
                                                child: Text(
                                                  text,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: index < currentStep
                                                        ? const Color(
                                                            0xFF536DFE)
                                                        : Colors.grey,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    buttonHeight: 52.0,
                    buttonMinWidth: 90.0,
                    children: <Widget>[
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: report['requestStatus'] == '완료'
                            ? () {
                                logger.i('save pressed..');
                                setState(() {
                                  report['save'] = !report['save'];
                                });
                              }
                            : null,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: report['requestStatus'] == '완료'
                                  ? iconColor
                                  : Colors.grey,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              'Save',
                              style: TextStyle(
                                color: report['requestStatus'] == '완료'
                                    ? const Color(0xFF536DFE)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: report['requestStatus'] == '완료'
                            ? () {
                                logger.i('report pressed..');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReportDetail()),
                                );
                              }
                            : null,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.view_agenda,
                              color: report['requestStatus'] == '완료'
                                  ? const Color(0xFF536DFE)
                                  : Colors.grey,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              'Report',
                              style: TextStyle(
                                color: report['requestStatus'] == '완료'
                                    ? const Color(0xFF536DFE)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: report['requestStatus'] == '완료'
                            ? () {
                                logger.i('share pressed..');
                              }
                            : null,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: report['requestStatus'] == '완료'
                                  ? const Color(0xFF536DFE)
                                  : Colors.grey,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              'Share',
                              style: TextStyle(
                                color: report['requestStatus'] == '완료'
                                    ? const Color(0xFF536DFE)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildDetailWidgets(Map<String, dynamic> report) {
    final List<Map<String, dynamic>> details;

    if (report['requestStatus'] == '완료') {
      details = [
        {'label': '검사 기관', 'value': report['institution']},
        {'label': '분석 완료 일자', 'value': report['resultDate']},
        {'label': '발병 위험도', 'value': report['riskSummary']},
        {
          'label': '예상 변이',
          'value': report['resultGenes'] is List
              ? report['resultGenes'].join(', ')
              : report['resultGenes']
        },
      ];
    } else {
      details = [
        {'label': '검사 기관', 'value': report['institution']},
        {'label': '요청 일자', 'value': report['requestDate']},
      ];
    }

    return details.map((detail) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.8),
        child: Text(
          '${detail['label']}: ${detail['value']}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: const Color(0xFF676868),
              ),
          textAlign: TextAlign.left,
        ),
      );
    }).toList();
  }
}
