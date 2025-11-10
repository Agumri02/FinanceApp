import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Finance App'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cards',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ===== Animated ATM Cards =====
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'BRI Life',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF0033A0),
                    color2: Color(0xFF0072CE),
                    logo:
                        'https://upload.wikimedia.org/wikipedia/commons/6/6d/BRI_2025.png',
                    delay: 0,
                  ),
                  AtmCard(
                    bankName: 'BCA Life',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFF1D2C6B),
                    color2: Color(0xFF2E4EB2),
                    logo:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/500px-Bank_Central_Asia.svg.png',
                    delay: 200,
                  ),
                  AtmCard(
                    bankName: 'BNI Life',
                    cardNumber: '**** 1122',
                    balance: 'Rp9.000.000',
                    color1: Color(0xFFFF6600),
                    color2: Color(0xFFFF944D),
                    logo:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Bank_Negara_Indonesia_logo_%282004%29.svg/1920px-Bank_Negara_Indonesia_logo_%282004%29.svg.png',
                    delay: 400,
                  ),
                  AtmCard(
                    bankName: 'Mandiri Life',
                    cardNumber: '**** 3344',
                    balance: 'Rp6.000.000',
                    color1: Color(0xFF002984),
                    color2: Color(0xFF0055B6),
                    logo:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/1920px-Bank_Mandiri_logo_2016.svg.png',
                    delay: 600,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Grid Menu =====
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
              ],
            ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
