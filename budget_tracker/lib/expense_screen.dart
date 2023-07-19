import 'package:flutter/material.dart';
import 'main.dart';
import 'expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

List<Expense> expenses = [
  Expense(category: 'Groceries', price: -300),
  Expense(category: 'Bills', price: -1000),
  Expense(category: 'Salary', price: 50000)
];

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool popup = false;

  @override
  Widget build(BuildContext context) {
    int totalExpense = 0;
    for(Expense expense in expenses) {
      totalExpense += expense.price;
    }

    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 60.0, 15.0, 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        child: Text(
                          'Budget Tracker',
                          style: TextStyle(
                            fontFamily: 'BreeSerif',
                            color: Colors.white,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/user_icon.png'),
                        radius: 25.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 100.0, 8.0),
                          child: Text(
                            'Total:',
                            style: TextStyle(
                              fontFamily: 'BreeSerif',
                              color: Colors.indigo[700],
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Text(
                          '$totalExpense',
                          style: TextStyle(
                            color: Colors.indigo[700],
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0,),
                Column(
                  children: expenses.map((expense){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 330.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    expense.category,
                                    style: TextStyle(
                                      fontFamily: 'BreeSerif',
                                      color: Colors.grey[200],
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    '${expense.price}',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                expenses.remove(expense);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          if (popup) Center(
            child: Container(
              height: 200.0,
              width: 280.0,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10.0,),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {popup = false;});
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 23.0,),
                      const Text(
                        'New Entry',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  const Row(
                    children: <Widget>[
                      SizedBox(width: 15.0,),
                      Text(
                        'Category:',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  const Row(
                    children: <Widget>[
                      SizedBox(width: 15.0,),
                      Text(
                        'Price:',
                        style: TextStyle(
                          fontFamily: 'BreeSerif',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 220.0,),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            expenses.add(Expense(category: 'New', price: 100));
                            popup = false;
                          });
                        },
                        icon: const Icon(
                          Icons.check,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !popup ? FloatingActionButton(
        onPressed: () {
          setState(() {popup = true;});
        },
        foregroundColor: Colors.blue[900],
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ) : Container(),
    );
  }
}

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.circular(20),
        ),
      )
    );
  }
}
