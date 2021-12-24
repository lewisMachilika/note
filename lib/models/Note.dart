class Note{
  late int id;
  late String note;
  late DateTime dateTime;
  late DateTime dueDate;
  noteMap(){
    var mapping =Map<String, dynamic>();
    mapping['id'] = id;
    mapping['note'] = note;
    mapping['dateTime'] = dateTime.toString();
    mapping['dueDate'] = dueDate.toString();
    return mapping;
  }

  noteMap2(){
    var mapping =Map<String, dynamic>();
    //mapping['id'] = id;
    mapping['note'] = note;
    mapping['dateTime'] = dateTime.toString();
    mapping['dueDate'] = dueDate.toString();
    return mapping;
  }
}