
# Moka: Todo List

Moka: Todo List is a simple task management application that I created as an exercise in cross-platform application development using the Dart programming language and the Flutter framework.

During the creation of this application, I applied the Flutter concepts I learned from the Flutter course on the Udemy platform. These concepts include implementing CRUD operations using Riverpod, designing responsive widget sizes with MediaQuery, and leveraging various combinations of widgets. Additionally, I also practiced theme concepts and other related skills. While I haven't put into practice certain concepts such as implementing architectural patterns and using APIs, I plan to apply these practices to future iterations of the app to improve its functionality.

Furthermore, I adopted Vincent Driessen's widely recognized git branching approach in the development of application. Although I only implemented a portion of his comprehensive strategy, the application remains straightforward and employs dummy data from user input.

I established two branches: the main branch, serving as the stable application branch, and the development branch, where active development takes place.

Upon completing development on the development branch and ensuring the application's stability, I merge it into the main branch using the command git merge --no-ff develop. This ensures a smooth merge process and maintains a clear branching history with a merge commit.

## Screenshots

![Uncompleted Todo](https://raw.githubusercontent.com/amyrmdhn/moka_todo_list/develop/assets/screenshots/Uncompleted%20Task.png)
![Add Todo](https://raw.githubusercontent.com/amyrmdhn/moka_todo_list/develop/assets/screenshots/Add%20Todo.png)
![Delete Todo](https://raw.githubusercontent.com/amyrmdhn/moka_todo_list/develop/assets/screenshots/Delete%20Task.png)
![Detail Todo Overlay](https://raw.githubusercontent.com/amyrmdhn/moka_todo_list/develop/assets/screenshots/Detail%20Task.png)
![Completed Todo](https://raw.githubusercontent.com/amyrmdhn/moka_todo_list/develop/assets/screenshots/Completed%20Todo.png)
## Features

- Add Task
- Delete Task
- Detail Task Overlay
- Mark as completed
- Cross-platform
- Sorted Task by date


## Tech Stack

**Client:** Flutter

**Database:** SQFLite Local Database

**State Managemenet:** Riverpod

