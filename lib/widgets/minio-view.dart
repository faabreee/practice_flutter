import 'package:flutter/material.dart';
import 'package:flutter_practice/clases/jsonplaceholder.dart';
import 'package:flutter_practice/services/jsonplaceholder-service.dart';

class MinioView extends StatefulWidget {
  const MinioView({super.key});

  @override
  State<MinioView> createState() => _MinioViewState();
}

class _MinioViewState extends State<MinioView> {

  late Future<List<JsonPlaceholder>> futureJsonPlaceholder;

  @override
  void initState(){
    super.initState();
    futureJsonPlaceholder = getJsonPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: FutureBuilder<List<JsonPlaceholder>>(
        future: futureJsonPlaceholder,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
          }else if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final jsonplaceholder = snapshot.data![index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                jsonplaceholder.thumbnailUrl
                              ),
                            ),
                            Expanded(
                              child: Text(
                                jsonplaceholder.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: null, 
                                child: Icon(Icons.more_horiz)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Image(
                      image: NetworkImage(jsonplaceholder.url)
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: null, 
                              child: Icon(Icons.favorite)
                            ),
                            TextButton(
                              onPressed: null, 
                              child: Icon(Icons.comment)
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: null, 
                          child: Icon(Icons.send))
                      ],
                    ),
                  )
                ]
              );
              }
            );
          }else {
              return const Text('No se encontraron datos');
          }
        }
      )
      
      
      
    );
  }
}