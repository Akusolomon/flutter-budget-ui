import 'package:flutter/material.dart';

class BoxChart extends StatelessWidget {
  final List<double> expenses;
  const BoxChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    double _mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > _mostExpensive) {
        _mostExpensive = price;
      }
    });
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Weekly Spending",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
                iconSize: 30,
              ),
              Text(
                "Nov 10,2019 - Nov 16,2019",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {},
                iconSize: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Mo',
                  amountSpent: expenses[1],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Tu',
                  amountSpent: expenses[2],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Wed',
                  amountSpent: expenses[3],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Th',
                  amountSpent: expenses[4],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Fr',
                  amountSpent: expenses[5],
                  mostExpensive: _mostExpensive),
              Bar(
                  label: 'Sa',
                  amountSpent: expenses[6],
                  mostExpensive: _mostExpensive),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150;
  Bar(
      {required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text('\$${amountSpent.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6)),
        ),
        SizedBox(
          height: 8,
        ),
        Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))
      ],
    );
  }
}
