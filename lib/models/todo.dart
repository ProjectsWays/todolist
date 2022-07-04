class Todo {
  String _title;
  String _description;
  bool _done;
  int _id;
  int _user;

  get title => _title;
  set title(value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  get done => _done;
  set done(value) => _done = value;

  get id => _id;
  set id(value) => _id = value;

  get user => _user;
  set user(value) => _user = value;

  Todo(
      {String title = '',
      String description = '',
      bool done = false,
      int id,
      int user})
      : _title = title,
        _description = description,
        _done = done,
        _id = id,
        _user = user;

  Todo.copy(Todo from)
      : this(
            title: from._title,
            description: from._description,
            done: from._done,
            id: from._id,
            user: from._user);

  Todo.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title'] ?? '',
            description: json['description'] ?? '',
            done: json['done'] ?? false,
            id: json['id'],
            user: json['user']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'done': done,
        'id': id,
        'user': user
      };
}
