import 'package:bersihin_app/complaint.dart';
import 'package:bersihin_app/detail.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  final int id;
  final bool isFinished;
  final String laundryType;
  final String status;
  final int weight;
  final String price;

  const Transaction({
    super.key,
    required this.id,
    required this.isFinished,
    required this.laundryType,
    required this.status,
    required this.weight,
    required this.price,
  });

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text("Nota ${widget.id.toString()}"),
            subtitle: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.laundryType),
                    Text("${widget.weight} kg")
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Status: ${widget.status}"),
                    Text(
                      widget.price,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text(widget.status == "Menunggu Dijemput"
                    ? 'TAMBAHKAN DETAIL'
                    : 'DETAIL'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailPage()),
                  );
                },
              ),
              widget.isFinished
                  ? TextButton(
                      child: const Text('KOMPLAIN'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ComplaintPage(),
                          ),
                        );
                      },
                    )
                  : Container(),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
