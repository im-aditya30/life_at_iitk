import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';

class PostSearch extends HookWidget {
	final List<Post> posts;
	final  type;
  const PostSearch({
		required this.posts, required this.type});
	@override
	Widget build(BuildContext context) {
		final List<Post> array = [];
		final _controller = useTextEditingController(text: '');
		final StreamController<List<Post>?> streamController = useStreamController()..add(posts);
		final StreamController<String> streamControllerText = useStreamController()..add(_controller.text);
  void _searchPostFromString(String query){
    // ignore: parameter_assignments
    query = query.toLowerCase();
    streamController.add(null);
    streamControllerText.add(query);
    if(query.isEmpty){
      posts.sort((a,b)=>b.timeStamp.compareTo(a.timeStamp));
        streamController.add(posts);
      return;
    }else{
      for (final element in posts) {
        if(element.sub[0].toString().toLowerCase().contains(query) 
          || element.title.toLowerCase().contains(query)  
          || element.council.toLowerCase().contains(query)
          || element.tags.toLowerCase().contains(query)
          || councilNameTOfullForms(element.council.toLowerCase()).toLowerCase().contains(query)){
            array.update(element);
            array.sort((a,b)=>b.timeStamp.compareTo(a.timeStamp)); 
          }
        else{
          array.removeWhere((test)=>test.id == element.id);
          
            array.sort((a,b)=>b.timeStamp.compareTo(a.timeStamp)); 
          
        }
      }
      streamController.add(array);
    }
  }
		return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Container(
          height: 50.0,
          margin: const EdgeInsets.only(right: 20.0),
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.search,
            autofocus: true ,
            keyboardType: TextInputType.text,
            onSubmitted:(text)=> _searchPostFromString(text),
            onChanged:(text)=> _searchPostFromString(text),
            style: const TextStyle(
              color:Colors.black
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.all(2.0),
              focusColor: Colors.black,
              hoverColor: Colors.black,
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              suffixIcon: StreamBuilder<String>(
                stream: streamControllerText.stream,
                builder: (context,AsyncSnapshot<String> snapshot) {
                  if(snapshot.data == null || snapshot.data!.isEmpty){
                    return const Icon(Icons.ac_unit,color: Colors.white,size: 5,);
                  }
                  return IconButton(icon: const Icon(Icons.close), 
                    onPressed: (){
                        _controller.text = '';
                        streamControllerText.add('');
                    },
                    enableFeedback: false,
                  );
                }
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              prefixIcon: Icon(Icons.search,
                color: Theme.of(context).accentColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              )
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<Post>?>(
        stream: streamController.stream,
        builder: (context,snapshot){
              if(snapshot.hasData){
                switch (snapshot.data!.length) {
                  case 0: return Center(child: Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(MaterialIcons.sentiment_neutral,size: 35.0,),
                              SizedBox(width:10.0),
                              Text('No post found for the\n following query.',
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                  fontSize: 18.0
                                )
                              ),
                            ],
                          ),
                          const Text('\nYou can search only with title, \nclub/entity, tags and\n council ( also short forms like snt ) of a post',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),);
                  default: return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      final i =  snapshot.data![index].copyWith(
												dateAsString: convertDateToString(snapshot.data![index].timeStamp)
											);
                      if(snapshot.data!.firstWhere((test){
                        return convertDateToString(test.timeStamp) 
                          == convertDateToString(i.timeStamp);
                      }) == i){
                        return Column(
                          key: ValueKey(i.timeStamp),
                          children: <Widget>[
                            Center(
                              child: Text(i.dateAsString),
                            ),
                            PostTile(index,snapshot.data!,type)
                          ],
                        );
                      }else{
                        return Container(
                          key: ValueKey(i.timeStamp),
                            child: PostTile(index,snapshot.data!,type)
                        );
                      }
                    } 
                  );
                }
              }
              else{
                // print('no datra');
                return InfiniteLoader();
              }
        }
      ), 
    );
  }
  
}
extension ListX<T> on List<T> {
	List<T> update(T item) {
		final index = indexWhere((test) => test == item);
		if(index != -1){
			this[index] = item;
			return this;
		}
		return this..add(item);
	}
}

class PostTile extends StatefulWidget {
  final List<Post> postArray;
  final int index;
  final type;
  const PostTile(this.index,this.postArray,this.type);
  @override
  _PostTileState createState() => _PostTileState(this.index,this.postArray);
}

class _PostTileState extends State<PostTile> {
  final List<Post> postArray;
  final int index;
  _PostTileState(this.index,this.postArray);
  late Timer timer;
  late String time;
  @override
  void initState() { 
    super.initState();
    final timeStamp = DateTime.fromMillisecondsSinceEpoch(postArray[widget.index].timeStamp);
      // postArray[widget.index].dateAsString = convertDateToString(postArray[widget.index].timeStamp);
    switch (convertDateToString(postArray[widget.index].timeStamp)) {
        case 'Today':{
          if (DateTime.now().difference(timeStamp).inMinutes <60 ) {
            final int d;
            switch (d=DateTime.now().difference(timeStamp).inMinutes) {
              case 0: time ='now';
                break;
              default: time = '$d minutes ago';
            }
          } else {time = DateFormat("hh:mm a").format(timeStamp);
          }
        }
        break;
        default: 
          time = DateFormat("hh:mm a, dd MMMM yyyy").format(timeStamp);
      } 
    timer = Timer.periodic(const Duration(minutes: 1), (timer){
      switch (postArray[widget.index].dateAsString) {
        case 'Today':{
          if (DateTime.now().difference(timeStamp).inMinutes <60 ) {
            final int d;
            switch (d=DateTime.now().difference(timeStamp).inMinutes) {
              case 0: setState(() {
                time ='now';
              });
                break;
              default: time = '$d minutes ago';
            }
          } else {
            setState(() {
              time = DateFormat("hh:mm a").format(timeStamp);
              timer.cancel();
            });
          }
        }
        break;
        default: setState((){
          time = DateFormat("hh:mm a, dd MMMM yyyy").format(timeStamp);
        timer.cancel();
        });
      }
    });
  }
  @override
  void dispose() { 
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 15.0,
              right: 0.0,
                  child: IconButton(
                    tooltip: 'Save Post',
                    icon: postArray[index].bookmark?const Icon(
                      MaterialIcons.bookmark
                    ): const Icon(MaterialIcons.bookmark_border),
                    onPressed: ()async{
                      setState(() {
                        postArray[index] = postArray[index].copyWith(
													bookmark: !postArray[index].bookmark
												);
                        
                      });
                    }),
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: AutoSizeText(
                    postArray[index].sub[0].toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.blueGrey
                            : Colors.white70,
                        fontSize: 10.0,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 10.0),
                  child: AutoSizeText(postArray[index].title,
                      minFontSize: 15.0,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 84.0,
                  ),
                  child: AutoSizeText(
                    postArray[index].message,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[850]
                          : Colors.white70,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 5.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Colors.white70,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}