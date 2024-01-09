import 'package:flutter/material.dart';
import 'package:task8/controller/controller.dart';


class FactTiles extends StatefulWidget {
  const FactTiles({Key? key}) : super(key: key);

  @override
  _FactTilesState createState() => _FactTilesState();
}

class _FactTilesState extends State<FactTiles> {
  late Future<String> _fact;

  @override
  void initState() {
    super.initState();
    _fact = fetchFact();
  }

  Future<String> fetchFact() async {
    try {
      var factModel = await Api.fetchFact();
      return factModel.fact ?? "Failed to fetch the fact";
    } catch (e) {
      return "Failed to fetch the fact";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fact,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: [
              CommonCard(text: "Fact"),
              CommonCard(text: snapshot.data ?? "No fact available"),
            ],
          );
        }
      },
    );
  }
}

class CommonCard extends StatelessWidget {
  final String text;

  const CommonCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
