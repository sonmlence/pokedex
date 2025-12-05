import 'package:flutter/material.dart';
import 'package:untitled1/calc_button_widget.dart';

String result = '';
int firstNumber = 0;
int secondNumber = 0;
bool isOperationClicked = false;
String action = '';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text('$result', style: TextStyle(fontSize: 50)),
                  Row(
                    children: [
                      Expanded(
                        child: CalcButtonWidget(
                          text: '7',
                          onTap: () {
                            setState(() {
                              result += '7';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '8',
                          onTap: () {
                            setState(() {
                              result += '8';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '9',
                          onTap: () {
                            setState(() {
                              result += '9';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CalcButtonWidget(
                          text: '4',
                          onTap: () {
                            setState(() {
                              result += '4';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '5',
                          onTap: () {
                            setState(() {
                              result += '5';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '6',
                          onTap: () {
                            setState(() {
                              result += '6';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CalcButtonWidget(
                          text: '1',
                          onTap: () {
                            setState(() {
                              result += '1';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '2',
                          onTap: () {
                            setState(() {
                              result += '2';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '3',
                          onTap: () {
                            setState(() {
                              result += '3';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CalcButtonWidget(
                          text: '0',
                          onTap: () {
                            setState(() {
                              result += '0';
                            });

                          },
                        ),
                      ),
                      Expanded(
                        child: CalcButtonWidget(
                          text: '.',
                          onTap: () {
                            setState(() {
                              result += '.';
                            });

                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CalcButtonWidget(
                  text: '+',
                  color: Colors.orange,
                  textColor: Colors.white,
                  onTap: () {
                    action = '+';
                    firstNumber = int.parse(result);
                    isOperationClicked = true;
                    result = '';
                    setState(() {});
                  },
                ),
                CalcButtonWidget(
                  text: 'X',
                  color: Colors.orange,
                  textColor: Colors.white,
                  onTap: () {
                    action = 'X';
                    firstNumber = int.parse(result);
                    isOperationClicked = true;
                    result = '';
                    setState(() {});
                  },
                ),
                CalcButtonWidget(
                  text: '/',
                  color: Colors.orange,
                  textColor: Colors.white,
                  onTap: () {
                    action = '/';
                    firstNumber = int.parse(result);
                    isOperationClicked = true;
                    result = '';
                    setState(() {});
                  },
                ),
                CalcButtonWidget(
                  text: '=',
                  color: Colors.orange,
                  textColor: Colors.white,
                  onTap: () {
                    if (isOperationClicked) {
                      switch (action) {
                        case '+':
                          secondNumber = int.parse(result);
                          result = (firstNumber + secondNumber).toString();
                          break;
                        case 'X':
                          secondNumber = int.parse(result);
                          result = (firstNumber * secondNumber).toString();
                          break;
                        case '/':
                          secondNumber = int.parse(result);
                          result = (firstNumber / secondNumber).toString();
                          break;
                      }
                      isOperationClicked = false;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            // Expanded(
                  //   child: CalcButtonWidget(
                  //     text: 'C',
                  //     color: Colors.grey,
                  //     onTap: () {
                  //       result = '';
                  //       setState(() {});
                  //     },
                  //   ),
                  // ),

                ],
        )));}}
