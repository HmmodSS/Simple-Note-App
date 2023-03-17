class Note{
  late int? id;
  late String? title;
  late String? details;

  Note({this.id,this.title,this.details});

 Note.fromMap(Map<String,dynamic> map){
    
    id = map['id'];
    title = map['title'];
    details=map['details'];


  }

  Map <String,dynamic> toMap({withId =false}){
    Map<String,dynamic> map = Map<String,dynamic>();
   if(withId) map['id']=id;
    map['title']=title;
    map['details']=details;
    return map;

    


  }
}