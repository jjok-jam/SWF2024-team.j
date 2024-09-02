import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const BlockchainScreen());
}

class BlockchainScreen extends StatelessWidget {
  const BlockchainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlockchainPage(),
    );
  }
}

class BlockchainPage extends StatefulWidget {
  const BlockchainPage({super.key});

  @override
  BlockchainScreenState createState() => BlockchainScreenState();
}

class BlockchainScreenState extends State<BlockchainPage> {
  List<Map<String, dynamic>> alerts = [
    {
      'title': '유전자 분석 데이터 제공 동의',
      'status': '요청',
      'time': '방금전',
      'msg': 'B 유전자 기관에서 귀하의 "5대 주요 암" 데이터에 대한 접근 권한을 요청합니다.',
      'isNew': true,
    },
    {
      'title': '[알림] 유전자 분석 접수 알림',
      'status': '알림',
      'time': '1분전',
      'msg': '귀하의 "5대 주요 암" 분석 의뢰가 접수되었습니다.',
      'isNew': true,
    },
    {
      'title': '[알림] 유전자 분석 진행 알림',
      'status': '알림',
      'time': '3일전',
      'msg': 'A 유전자 기관에서 귀하의 "심혈관 질환" 분석이 진행됩니다.',
      'isNew': true,
    },
    {
      'title': '유전자 분석 데이터 제공 동의',
      'status': '완료',
      'time': '3일전',
      'msg': 'A 유전자 기관에서 귀하의 "심혈관 질환" 데이터에 대한 접근 권한을 요청합니다.',
      'isNew': false,
    },
    {
      'title': '[알림] 유전자 분석 접수 알림',
      'status': '읽음',
      'time': '7일전',
      'msg': '귀하의 "심혈관 질환" 분석 의뢰가 접수되었습니다.',
      'isNew': false,
    },
    {
      'title': '[공지] 개인정보 안내',
      'status': '알림',
      'time': '8월15일',
      'msg': '귀하의 모든 유전자 분석 과정 정보가 안전하게 저장되어 보호됩니다.',
      'isNew': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Slidable(
                    key: Key(alert['title']),
                    endActionPane: alert['isNew'] == true
                    ? ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                alert['status'] = alert['status'] == '요청' || alert['status'] == '진행중' 
                                  ? '진행중' 
                                  : '읽음';
                                alert['isNew'] = false;
                              });
                            },
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.check,
                            label: alert['status'] == '요청' ? '수락' : '읽음',
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                if (alert['status'] == '요청'){
                                  alert['status'] = '반려';
                                  alert['isNew'] = false;
                                }
                              });
                            },
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            icon: Icons.cancel,
                            label: alert['status'] == '요청' ? '반려' : '읽지않음',
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                        ],
                      )
                    : null,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      color: Colors.white,
                      shadowColor: Colors.grey[100],
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xFF536DFE),
                                        child: Text(
                                          'N',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        )
                                      ),
                                      // 레드닷 표시 조건: 상태가 '요청'일 때만
                                      if (alert['isNew'] == true)
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: 8,
                                              height: 8,
                                              margin: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      alert['title'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: _getTextColor(alert['isNew']),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.circle,
                                      color: Color.fromRGBO(128, 128, 128, 0.5),
                                      size: 5,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      alert['time'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: alert['isNew'] ? FontWeight.bold : FontWeight.normal,
                                        color: _getTextColor(alert['isNew']),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(alert['status']),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        alert['status'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          height: 1),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      alert['msg'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: _getTextColor(alert['isNew']),
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case '요청':
        return Colors.red.shade400;
      case '완료':
        return Colors.blue;
      case '진행중':
        return Colors.green;
      case '반려':
      case '읽음':
        return Colors.grey;
      default :
        return Colors.orange.shade300;
    }
  }

  Color _getTextColor(bool isNew) {
    return isNew ? Colors.black87 : Colors.grey;
  }
}
