import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'بغداد',
        ),
        backgroundColor: Theme.of(context).errorColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Container(
            height: 394,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).errorColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/iraq_map.svg'),
                          Expanded(
                            child: Text(
                              'الاحصائات الاجمالية',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '25\n'
                              'ايار',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).errorColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                          ),
                          handleBuiltInTouches: true,
                        ),
                        gridData: FlGridData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: false,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            textStyle: TextStyle(
                              color: Theme.of(context).errorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
//                          margin: ,
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 1:
                                  return 'Jan';
                                case 2:
                                  return 'Feb';
                                case 3:
                                  return 'Mar';
                                case 4:
                                  return 'Apr';
                                case 5:
                                  return 'May';
                                case 6:
                                  return 'Jun';
                                case 7:
                                  return 'Jul';
                                case 8:
                                  return 'Aug';
                                case 9:
                                  return 'Sep';
                                case 10:
                                  return 'Oct';
                                case 11:
                                  return 'Nov';
                                case 12:
                                  return 'DEC';
                              }
                              return '';
                            },
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).unselectedWidgetColor,
                              width: 1,
                            ),
                            left: BorderSide(
                              color: Colors.transparent,
                            ),
                            right: BorderSide(
                              color: Colors.transparent,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        minX: 2.5,
                        maxX: 12,
                        maxY: 5,
                        minY: 0,
                        lineBarsData: linesBarData1(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'التأريخ',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              DataColumn(
                label: Text(
                  'اليومي',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              DataColumn(
                label: Text(
                  'التراكمي',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Container(
                      color: Colors.white,
                      child: Placeholder(),
                    ),
                  ),
                  DataCell(
                    Placeholder(),
                  ),
                  DataCell(
                    Placeholder(),
                  ),
                ],
              ),
              DataRow(
                
                cells: [
                  DataCell(
                    Placeholder(),
                  ),
                  DataCell(
                    Placeholder(),
                  ),
                  DataCell(
                    Placeholder(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffEE3030),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (sop, dnum, data, inum) {
          return FlDotCirclePainter(
              color: Colors.white, strokeColor: Colors.black, strokeWidth: 2);
        },
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    return [
      lineChartBarData2,
    ];
  }
}
