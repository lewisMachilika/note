import 'package:note/models/Note.dart';
import 'package:note/repositories/Repository.dart';


class RepositoryService{

  late Repository _repository;

  RepositoryService(){
    _repository = Repository();
  }

  insertNoteData(String table,Note note)async{
    return _repository.insertData(table, note.noteMap2());
  }
  updateNoteData(String table,Note note,int id)async{
    return _repository.updateData(table, note.noteMap(),id);
  }

  readData(String table)async{
    return _repository.readData(table);
  }

  deleteData(String table,int id)async{
    return _repository.deleteData(table, id);
  }
}