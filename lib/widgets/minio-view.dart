import 'package:flutter/material.dart';

class MinioView extends StatefulWidget {
  const MinioView({super.key});

  @override
  State<MinioView> createState() => _MinioViewState();
}

class _MinioViewState extends State<MinioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        'https://ih1.redbubble.net/image.1380092762.9137/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg'
                      ),
                    ),
                    Text("usuario_instragram"),
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
              image: NetworkImage('https://st.depositphotos.com/1899425/1623/i/450/depositphotos_16232649-stock-photo-moraine-lake-sunrise-colorful-landscape.jpg')
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
      ),
    );
  }
}