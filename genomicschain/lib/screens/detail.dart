import 'package:flutter/material.dart';
import 'package:genomicschain/screens/report.dart';
import 'package:logger/logger.dart';
import 'package:fl_chart/fl_chart.dart';

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true));

void main() {
  runApp(const ReportDetail());
}

class ReportDetail extends StatelessWidget {
  const ReportDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReportDetailPage(),
    );
  }
}

class ReportDetailPage extends StatefulWidget {
  const ReportDetailPage({super.key});

  @override
  ReportDetailPageState createState() => ReportDetailPageState();
}

class ReportDetailPageState extends State<ReportDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            logger.i('Back button pressed..');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyReportPage()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              logger.i('search pressed..');
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              logger.i('search pressed..');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 1.0,
            color: Colors.grey[300], // Divider color
          ),
          Expanded(
            child: ListView(children: <Widget>[
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('[유방암] 유전자 분석 결과',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('검사일: 2024년 8월 7일',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600])),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const StepIndicator(currentStep: 3),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE), // 배경색 설정
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('유전자 분석 결과',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      const Text('각 구간별 건강관리는 단계별 관리지침 참고.',
                          style: TextStyle(fontSize: 13)),
                    ]),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF536DFE),
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: const Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text('발병위험도',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1)),
                      ],
                    ),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '평균대비',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '2.43',
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            height: 0.75,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '배',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: const Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text('유전적인 유방암 발병률이 높은 편입니다.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '유전적인 유방암 발병률은 일반인에 비해 2.43배로 높은 편입니다. 알려드린 위험 요인들을 잘 숙지하시어 유방암 예방을 위한 관리를 지속하시기 바랍니다.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE), // 배경색 설정
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('상세 분석 결과',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: '유전자 분석결과 ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Colors.black), // Change color to red
                                ),
                                TextSpan(
                                  text: 'KRAS, BRCA, CDKN2B ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .yellow[900]), // Change color to blue
                                ),
                                const TextSpan(
                                  text: '유전자에서 변이가 발생되었습니다.',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors
                                          .black), // Change color to green
                                ),
                              ], // Default text style
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                child: const GeneIndicator(),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: const Color(0xFF536DFE), // 배경색 설정
                        child: const SizedBox(
                          height: 25,
                          width: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('연령별 유방암 발병률 통계',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ]),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        const Text('나의 발병률'),
                        const SizedBox(width: 20),
                        Container(
                          width: 10,
                          height: 10,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 5),
                        const Text('연령별 평균 발병률'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 15,
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            show: true,
                            topTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                              margin: 16,
                              getTitles: (double value) {
                                return '${value.toInt()}대';
                              },
                            ),
                            rightTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                              margin: 8,
                              reservedSize: 30,
                              getTitles: (double value) {
                                if (value == 0) {
                                  return '0%';
                                } else if (value == 5) {
                                  return '5%';
                                } else if (value == 10) {
                                  return '10%';
                                } else if (value == 15) {
                                  return '15%';
                                } else {
                                  return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: _generateBarGroups(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  /// Bar Chart
  final List<List<double>> predefinedData = const [
    [30, 0.78, 0.32],
    [40, 3.79, 1.56],
    [50, 7.41, 3.05],
    [60, 10.30, 4.24],
    [70, 12.25, 5.04],
    [80, 13.19, 5.43],
  ];

  List<BarChartGroupData> _generateBarGroups() {
    List<BarChartGroupData> barChartGroups = [];

    for (var data in predefinedData) {
      int age = data[0].toInt();
      double y1 = data[1];
      double y2 = data[2];

      logger.i('age: $age, y1: $y1, y2: $y2');

      // Check for invalid values
      if (y1.isNaN || y1.isInfinite || y2.isNaN || y2.isInfinite) {
        continue; // Skip this data point if any value is invalid
      }

      barChartGroups.add(
        BarChartGroupData(
          x: age,
          barRods: [
            BarChartRodData(
              y: y1,
              colors: [Colors.blue],
              width: 15,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                y: 15,
                colors: [Colors.blue.withOpacity(0.1)],
              ),
            ),
            BarChartRodData(
              y: y2,
              colors: [Colors.red],
              width: 15,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                y: 15,
                colors: [Colors.red.withOpacity(0.1)],
              ),
            ),
          ],
        ),
      );
    }

    return barChartGroups;
  }
}

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStep(context, "양호", 1),
        _buildLine(context),
        _buildStep(context, "관심", 2),
        _buildLine(context),
        _buildStep(context, "경계", 3),
        _buildLine(context),
        _buildStep(context, "위험", 4),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String title, int step) {
    bool isActive = step == currentStep;

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: isActive ? 30.0 : 20.0,
          backgroundColor:
              isActive ? const Color(0xFF536DFE) : Colors.grey[350],
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
      ],
    );
  }

  Widget _buildLine(BuildContext context) {
    return Container(
      width: 40.0,
      height: 2.0,
      color: Colors.grey,
    );
  }
}

class GeneIndicator extends StatelessWidget {
  const GeneIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFF536DFE),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'A',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text: 'A',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ], // Default text style
                ),
              ),
            ),
            Container(
              width: 80,
              height: 2,
              color: const Color(0xFF536DFE),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFF536DFE),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'A',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text: 'G',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[900],
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ], // Default text style
                ),
              ),
            ),
            Container(
              width: 80,
              height: 2,
              color: const Color(0xFF536DFE),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFF536DFE),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'G',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextSpan(
                      text: 'G',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ], // Default text style
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "정상",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 108,
            ),
            const Text(
              "일부 변이",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 108,
            ),
            const Text(
              "변이",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
