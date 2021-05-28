import 'package:calenderapp/screens/my_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model.dart';
import 'controller.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.put(NoteController());
     
    String text="";
    String addrss='';
    var index;
    text=index==null?" ":nc.notes[index].name;
    addrss=index==null?" ":nc.notes[index].address;

     TextEditingController textEditingController = new TextEditingController(text: text);
     TextEditingController adreeseditController = new TextEditingController(text: addrss);
    Widget getNoteList(){
      return Obx(
            () =>  nc.notes.length==0?Center(child: Text('No Data'),):
            ListView.builder(
                itemCount: nc.notes.length,
                itemBuilder: (context, index)=>
                    Card(
                      child: ListTile(
                          title: Text(nc.notes[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500)),
                                 subtitle: Text(nc.notes[index].address),
                          leading: Text(
                            (index + 1).toString() + ".",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: Wrap(children: <Widget>[
                              
                         
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Delete Details',
                                      middleText: nc.notes[index].name,
                                      onCancel: () => Get.back(),
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        nc.notes.removeAt(index);
                                        Get.back();
                                      });
                                })
                          ])),
                    )
            ),
      );
    }
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Details'),
            ),
            floatingActionButton: FloatingActionButton.extended(
              
               icon: Icon(Icons.add),
        label: Text('Add new User'),
              
            
              onPressed: () {
               // Get.to(MyNote());

                Get.bottomSheet( Container(
                  color: Colors.white,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:10),
                   TextField(
                        controller: textEditingController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(10)),
                        ),
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                    
                     SizedBox(height:10),
                       TextField(
                        controller: adreeseditController,
                      
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: 'Address',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(10)),
                        ),
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Cancel'),
                          color: Colors.red,
                        ),
                        RaisedButton(
                            onPressed: () {
                              if (index==null){
                              nc.notes.add(Note(name: textEditingController.text,address: adreeseditController.text));
                              textEditingController.clear();
                              adreeseditController.clear();
                              // nc.notes.add(Note(address: adreeseditController.text));
                              }
                            //   else{
                            //  var updatenote=nc.notes[index];
                            //  updatenote.name=textEditingController.text;
                            //  updatenote.address=adreeseditController.text;
                            //  nc.notes[index]=updatenote;
                            //   }

                              Get.back();
                            },
                          child: Text('Add'),
                          color: Colors.green,)
                    ])
                  ],
                ),
              ),);
              },
            ),
            body: Container(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child:getNoteList()),
            )));
  }

}
