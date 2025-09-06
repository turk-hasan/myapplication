import 'dart:io';

class ToDo {
  final int id;
  String title;
  String description;
  DateTime time;
  bool isComplete = false;

  static int totaltask = 0;
  static int completedTask = 0;

  ToDo(this.id, this.title, this.description, this.time, this.isComplete) {
    totaltask++;
  }
}

class ToDoStatus {
  List<ToDo> todotask = [];

  void addTask(ToDo todo) {
    todotask.add(todo);
  }

  List<ToDo> allTasks() {
    return todotask;
  }

  List<ToDo> incompleteTasks() {
    return todotask.where((pointer) => pointer.isComplete == false).toList();
  }

  List<ToDo> timeNear() {
    DateTime now = DateTime.now();
    DateTime after3days = now.add(Duration(days: 3));
    return todotask
        .where(
          (pointer1) =>
              pointer1.time.isAfter(DateTime.now()) &&
              pointer1.time.isBefore(after3days) &&
              pointer1.isComplete == false,
        )
        .toList();
  }

  List<ToDo> overdueTasks() {
    return todotask
        .where(
          (pointer2) =>
              pointer2.time.isBefore(DateTime.now()) &&
              pointer2.isComplete == false,
        )
        .toList();
  }

  bool marktoDocompleted(int numberID) {
    for (int i = 0; i < todotask.length; i++) {
      if (todotask[i].id == numberID) {
        todotask[i].isComplete = true;
        ToDo.completedTask++;
        return true;
      }
    }
    return false;
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

  while (true) {
    print("\n========== MENU ==========\n");
    print(
      "1-List all tasks with serial numbers\n"
      "2-Mark tasks as completed by number\n"
      "3-Show incomplete tasks\n"
      "4-Alert tasks due within 3 days \n"
      "5-Alert overdue tasks\n"
      "6-Track totals with static variables\n"
      "7-Exit",
    );
    stdout.write("Enter your choice : ");
    int number = int.parse(stdin.readLineSync()!);

    switch (number) {
      case 1:
        List<ToDo> tasks = run.allTasks();
        for (int i = 0; i < tasks.length; i++) {
          print(
            " ID : ${tasks[i].id} \n Title : ${tasks[i].title} \n Drscription : ${tasks[i].description} \n Time : ${tasks[i].time} \n IsComplete : ${tasks[i].isComplete} \n",
          );
        }
        break;
      case 2:
        stdout.write("Enter the ID of the task to mark as completed: ");
        int number1 = int.parse(stdin.readLineSync()!);
        bool done = run.marktoDocompleted(number1);
        if (done) {
          print('Task with ID ${number1} marked as completed');
        } else {
          print('Task with ID ${number1} not found');
        }
        break;
      case 3:
        List<ToDo> notComplete = run.incompleteTasks();
        print("The Task isn't complete :");
        for (int i = 0; i < notComplete.length; i++) {
          print(
            " ID : ${notComplete[i].id} \n Title : ${notComplete[i].title} \n Drscription : ${notComplete[i].description} \n Time : ${notComplete[i].time} \n IsComplete : ${notComplete[i].isComplete} \n",
          );
        }
        break;
      case 4:
        List<ToDo> near = run.timeNear();
        for (int i = 0; i < near.length; i++) {
          print(
            " ID : ${near[i].id} \n Title : ${near[i].title} \n Drscription : ${near[i].description} \n Time : ${near[i].time} \n",
          );
        }
        break;
      case 5:
        List<ToDo> late = run.overdueTasks();
        for (int i = 0; i < late.length; i++) {
          print(
            " ID : ${late[i].id} \n Title : ${late[i].title} \n Drscription : ${late[i].description} \n Time : ${late[i].time} \n",
          );
        }
        break;
      case 6:
        print("Total Task =${ToDo.totaltask}");
        print("Completed Task =${ToDo.completedTask}");
        break;
      case 7:
        print("Exit program");
        return;

      default:
        print("Invalid choice , please try again");
    }
  }
}
