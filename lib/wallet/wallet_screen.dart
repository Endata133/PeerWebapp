import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  final double _balance = 150.75; // Example balance
  final List<Map<String, dynamic>> _transactions = [
    {
      'type': 'Deposit',
      'amount': 50.00,
      'date': 'Oct 1, 2024',
      'status': 'Completed',
    },
    {
      'type': 'Withdrawal',
      'amount': 20.00,
      'date': 'Sept 29, 2024',
      'status': 'Pending',
    },
    {
      'type': 'Payment',
      'amount': 15.99,
      'date': 'Sept 28, 2024',
      'status': 'Completed',
    },
    // Add more transactions here
  ];

  // Function to handle adding funds
  void _addFunds(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Add Funds functionality coming soon!')),
    );
  }

  // Function to handle withdrawing funds
  void _withdrawFunds(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Withdraw Funds functionality coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Section
            _buildBalanceSection(),

            SizedBox(height: 20),

            // Add and Withdraw Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add Funds'),
                  onPressed: () => _addFunds(context),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.remove),
                  label: Text('Withdraw'),
                  onPressed: () => _withdrawFunds(context),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Transaction History Title
            Text(
              'Transaction History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Transaction History List
            Expanded(
              child: _buildTransactionList(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display the balance
  Widget _buildBalanceSection() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            '\$$_balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display the transaction history list
  Widget _buildTransactionList() {
    return ListView.builder(
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(_transactions[index]['type']),
            subtitle: Text(
              '${_transactions[index]['date']} - ${_transactions[index]['status']}',
            ),
            trailing: Text(
              _transactions[index]['amount'] > 0
                  ? '+\$${_transactions[index]['amount'].toStringAsFixed(2)}'
                  : '-\$${_transactions[index]['amount'].abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: _transactions[index]['amount'] > 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
