import 'package:flutter/material.dart';
import 'package:flutter_appp/models/imdb.api.dart';
import 'package:flutter_appp/models/imdb.dart';
import 'package:flutter_appp/services/auth.dart';
import 'package:flutter_appp/widgets/card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Imdb> _imdbs;
  bool _isLoading = true;

  Future<void> getImdbs() async {
    _imdbs = await ImdbApi.getRecipe();
    if (mounted) {
      // check whether the state object is in tree
      setState(() {
       _isLoading=false;
      });
    }

    print(_imdbs);
    print(_imdbs.length);
  }

  @override
  void initState() {
    getImdbs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent,elevation: 0,foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<Auth>(context, listen: false).signOut();
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.deepPurpleAccent,
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: _imdbs.length,
                  itemBuilder: (context, index) {
                    return ImdbCard(
                        title: _imdbs[index].title,
                        year: _imdbs[index].year.toString(),
                        titleType: _imdbs[index].titleType);
                  },
                ),
        ),
      ),
    );
  }
}
