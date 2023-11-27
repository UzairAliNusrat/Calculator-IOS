import 'package:app_dev_assignment3/GlobalVariables/Global.dart' as global;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_dev_assignment3/Provider/provider.dart';

import '../widgets/button.dart';

class calculatorScreen extends StatelessWidget {
  calculatorScreen({super.key});

  String num = "";
  String oper = "";
  int countOper = 0;
  
  bool isEqualPressed = false;

  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 220,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 180, left: 250, right: 2),
            child: FittedBox(child: number(),) ,
          ),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Button(
                      info: buttons[index],
                      onCountChanged: (p0) {
                        if (p0 == '/' || p0 == 'x' || p0 == '-' || p0 == '+') {
                          global.count++;
                          num = "";
                          countOper++;
                          isEqualPressed = false;

                          if (countOper == 1) {
                            oper = p0;
                          }

                          if (countOper > 1) {
                            global.count = 1;
                            switch (oper) {
                              case "/":
                                {
                                  context.read<operation>().divide();
                                }
                                break;

                              case "x":
                                {
                                  context.read<operation>().multiply();
                                }
                                break;

                              case "-":
                                {
                                  context.read<operation>().subtract();
                                }
                                break;

                              case "+":
                                {
                                  context.read<operation>().add();
                                }
                                break;
                            }
                            countOper = 1;
                          }
                          oper = p0;
                        } else if (p0 == 'AC') {
                          context.read<operation>().setNum2(0);
                          context.read<operation>().setResult(0);
                          num = "";
                          countOper = 0;
                          global.count = 1;
                          
                        } else if (p0 == '+/-') {
                          if (double.parse(num) > 0) {
                            var tempNum = double.parse(num) * -1;
                            num = tempNum.toString();
                            if (global.count > 1) {
                              context
                                  .read<operation>()
                                  .setNum2(double.parse(num));
                              
                            } else {
                              context
                                  .read<operation>()
                                  .setResult(double.parse(num));
                              
                            }
                          } else {
                            var tempNum = double.parse(num) * -1;
                            num = tempNum.toString();
                            if (global.count > 1) {
                              context
                                  .read<operation>()
                                  .setNum2(double.parse(num));
                              
                            } else {
                              context
                                  .read<operation>()
                                  .setResult(double.parse(num));
                              
                            }
                          }
                        } else if (p0 == '%') {
                          var tempNum = double.parse(num) * (1 / 100);
                          num = tempNum.toString();
                          if (global.count > 1) {
                            context
                                .read<operation>()
                                .setNum2(double.parse(num));
                            
                          } else {
                            context
                                .read<operation>()
                                .setResult(double.parse(num));
                            
                          }
                        } else {
                          if (!isEqualPressed) {
                            if (countOper > 0 && !num.contains('.')) {
                              global.count = 2;
                            }
                            num = num + p0;
                            if (global.count > 1) {
                              context
                                  .read<operation>()
                                  .setNum2(double.parse(num));
                              
                            } else {
                              context
                                  .read<operation>()
                                  .setResult(double.parse(num));
                              
                            }
                          } else {
                            isEqualPressed = false;
                            context.read<operation>().setNum2(0);
                            context.read<operation>().setResult(0);
                            num = "";
                            countOper = 0;
                            global.count = 1;
                            if (countOper > 0 && !num.contains('.')) {
                              global.count = 2;
                            }
                            num = num + p0;
                            if (global.count > 1) {
                              context
                                  .read<operation>()
                                  .setNum2(double.parse(num));
                              
                            } else {
                              context
                                  .read<operation>()
                                  .setResult(double.parse(num));
                              
                            }
                          }
                        }
                      },
                    );
                  },
                ))),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10),
                child: Button(
                  info: "0",
                  
                  onCountChanged: (p0) {
                    num = num + p0;
                    if (global.count > 1) {
                      context.read<operation>().setNum2(double.parse(num));
                    } else {
                      context.read<operation>().setResult(double.parse(num));
                    }
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 2),
                child: Button(
                  info: ",",
                  
                  onCountChanged: (p0) {
                    if (num.contains('.')){

                    }
                    else{
                      num = num + ".";
                    if (global.count > 1) {
                      context.read<operation>().setNum2(double.parse(num));
                      
                    } else {
                      context.read<operation>().setResult(double.parse(num));
                      
                    }
                    }
                    
                    
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Button(
                  info: "=",
                  
                  onCountChanged: (p0) {
                    isEqualPressed = true;
                    global.count = 1;
                    countOper = 0;

                    switch (oper) {
                      case "/":
                        {
                          context.read<operation>().divide();
                        }
                        break;

                      case "x":
                        {
                          context.read<operation>().multiply();
                        }
                        break;

                      case "-":
                        {
                          context.read<operation>().subtract();
                        }
                        break;

                      case "+":
                        {
                          context.read<operation>().add();
                        }
                        break;
                    }
                    
                  },
                )),
          ],
        )
      ],
    ));
  }
}

class number extends StatelessWidget {
  const number({super.key});

  @override
  Widget build(BuildContext context) {
    var watchRes = context.watch<operation>().getResult.toString();
    var watchNum2 = context.watch<operation>().getNum2.toString();

    if (global.count > 1) {
      if (watchNum2.endsWith('.0')) {
        return Text('${watchNum2.substring(0, watchNum2.length - 2)}',
            style: Theme.of(context).textTheme.headlineMedium!);
      } else {
        return Text('${watchNum2}',
            style: Theme.of(context).textTheme.headlineMedium!);
      }
    } else {
      if (watchRes.endsWith('.0')) {
        return Text('${watchRes.substring(0, watchRes.length - 2)}',
            style: Theme.of(context).textTheme.headlineMedium!);
      } else {
        return Text('${watchRes}',
            style: Theme.of(context).textTheme.headlineMedium!);
      }
    }
  }
}
