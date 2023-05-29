class Todo
{
  late int? id;
  late String task;
  late String dateCreated;
  Todo(this.id,this.task,this.dateCreated);
  Map<String,dynamic> toMap() {
    return {
      "id":id,
      "task":task,
      "dateCreated":dateCreated,
    };
  }
  Todo.formMap(Map<String,dynamic> map)
  {
    id = map["id"];
    task = map["task"];
    dateCreated = map["dateCreated"];
  }
}