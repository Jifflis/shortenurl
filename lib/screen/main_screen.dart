import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/viewmodel/main_viewmodel.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Shortener'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<MainViewmodel>(
          builder: (_, MainViewmodel model, __) => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('long url:'),
                  TextField(controller: model.longUrlController),
                  SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('short url:'),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    model.shortUrl,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: model.loading ? null : () => model.generateShortUrl(),
                      child: Text(
                        'generate short url',
                        style: TextStyle(color: Colors.white),
                      ),
                      disabledColor: Colors.grey,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 50,),

                  Text('short url:'),
                  TextField(controller: model.shorUrlController),
                  SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('long url:'),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    model.longUrl,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: model.loading ? null : () => model.generateLongUrl(),
                      child: Text(
                        'get long url',
                        style: TextStyle(color: Colors.white),
                      ),
                      disabledColor: Colors.grey,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),

              if (model.loading)
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
