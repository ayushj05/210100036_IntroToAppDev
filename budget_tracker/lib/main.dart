import 'package:flutter/material.dart';
import 'expense_screen.dart';
import 'expense.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int totalExpense = 0;
    for(Expense expense in expenses) {
      totalExpense += expense.price;
    }

    return Scaffold(
        backgroundColor: Colors.blue[700],
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                child: Text(
                  'Budget Tracker',
                  style: TextStyle(
                    fontFamily: 'BreeSerif',
                    color: Colors.white,
                    fontSize: 47.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40.0),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/user_icon.png'),
                radius: 70.0,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Ayush Joshi',
                style: TextStyle(
                  color: Colors.blue[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontFamily: 'BreeSerif',
                  color: Colors.white,
                  fontSize: 30,
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
                            color: Colors.grey[200],
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Text(
                        '$totalExpense',
                        style: const TextStyle(fontSize: 24.0),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExpenseScreen()));
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );;
  }
}
