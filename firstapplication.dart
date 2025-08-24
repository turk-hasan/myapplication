import 'dart:io';

class ToDo {
  final int id;
  late String title;
  late String decription;
  DateTime time;
  bool isComplete = false;

  static int totaltask = 0;
  static int copletedTask = 0;

  ToDo(this.id, this.title, this.decription, this.time, this.isComplete) {
    totaltask++;
  }

  @override
  String toString() {
    return "ID : ${id} \n Title : ${title} \n Drscription : ${decription} \n Time : ${time} \n IsComplete : ${isComplete} \n ";
  }
}

class ToDoStatus {
  List<ToDo> todot = [];

  void addTask(ToDo todo) {
    todot.add(todo);
  }

  void allTasks() {
    print('ToDo Number${todot.length} , ToDo ${todot}');
  }

  void isNotcomplete() {
    print(
      'Tasks Not Complete : ${todot.where((pointer) => pointer.isComplete == false)} ',
    );
  }

  void timeNear() {
    DateTime now = DateTime.now();
    DateTime after3days = now.add(Duration(days: 3));
    print(
      'The time is near to complete the task \n ${todot.where((pointer1) => pointer1.time.isAfter(DateTime.now()) && pointer1.time.isBefore(after3days) && pointer1.isComplete == false)}',
    );
  }

  void timelate() {
    print(
      'The Time is late for the task \n ${todot.where((pointer2) => pointer2.time.isBefore(DateTime.now()) && pointer2.isComplete == false)} ',
    );
  }

  void marktoDocompleted(int numberID) {
    for (int i = 0; i < todot.length; i++) {
      if (todot[i].id == numberID) {
        todot[i].isComplete = true;
        ToDo.copletedTask++;
        print('Task with ID ${numberID} marked as completed');
        return;
      }
    }
    print('Task with ${numberID} not found');
  }
}

void main() {
  print("Welcome To Our Program\n");
  ToDoStatus run = ToDoStatus();
  print("Now you can add the tasks\n");
  run.addTask(ToDo(1, 'Doctor', 'Go To Woroud', DateTime(2025, 08, 17), false));
  run.addTask(ToDo(2, 'Doctor', 'Go To School', DateTime(2025, 08, 18), false));
  run.addTask(ToDo(3, 'Doctor', 'Go To work', DateTime(2025, 09, 19), false));
  run.addTask(ToDo(4, 'Doctor', 'Go To mall', DateTime(2025, 08, 15), true));
  // run.timeNear();
  print("To do the task press these numbers");
  print(
    " 1-List all tasks with serial numbers\n 2-Mark tasks as completed by number\n 3-Show incomplete tasks\n 4-Alert tasks overdue or due within 2 days\n 5-Track totals with static variables",
  );
  int number = int.parse(stdin.readLineSync()!);

  switch (number) {
    case 1:
      run.allTasks();
      break;
    case 2:
      print(
        "Pleas Enter Number of The Task That you need to make it Completed",
      );
      int number1 = int.parse(stdin.readLineSync()!);
      run.marktoDocompleted(number1);
      break;
    case 3:
      run.isNotcomplete();
      break;
    case 4:
      run.timeNear();
      break;
    case 5:
      print("Total Task =${ToDo.totaltask}");
      print("Completed Task =${ToDo.copletedTask}");
      break;
  }
}
