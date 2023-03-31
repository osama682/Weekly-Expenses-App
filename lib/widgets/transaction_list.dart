import 'package:flutter/material.dart';
import 'package:home_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
// import 'package:home_expenses/widgets/user_transaction.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  // const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Transactions!",
                  style: TextStyle(
                      fontSize: 30, color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/pic.png",
                    // width: 300,
                    // height: 400,
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.2),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 25),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              // so here wo use map for list .. first tx is same as "values" mean whatever value we receive from user we save in "tx" and then simply we return a card which display title which is entered by user..
              itemCount: transactions.length,
            ),
    );
  }
}
