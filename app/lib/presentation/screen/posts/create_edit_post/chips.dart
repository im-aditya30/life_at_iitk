import 'package:flutter/material.dart';

class CreateChips extends StatefulWidget {
  final List tags;
  // final String _tag;
  const CreateChips(this.tags);
  @override
  _CreateChipsState createState() => _CreateChipsState();
}

class _CreateChipsState extends State<CreateChips> {
          Iterable<Widget> get tagAsChips sync*{
            if(widget.tags.isNotEmpty == true){
            for (final i in widget.tags){
               yield Chip(label: Text(i.toString()),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: (){
                    setState(() {
                      widget.tags.remove(i);
                    });
                  },
                // )
                );
            } 
          }
          else{
            yield Container();
          }
            
          }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: tagAsChips.toList(),
    );
  }
}