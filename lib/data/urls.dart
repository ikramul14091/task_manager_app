class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registrationUrl = '$_baseUrl/registration';
  static const String loginUrl = '$_baseUrl/login';
  static const String createNewTaskUrl = '$_baseUrl/createTask';
  static const String getNewTasksUrl = '$_baseUrl/listTaskByStatus/New';
  static const String getProgressTasksUrl = '$_baseUrl/updateTaskStatus/62b7582fac0007cc76c29b53/Progress';
  static const String getTaskStatusCountUrl = '$_baseUrl/taskStatusCount';

  static String updateTaskStatusUrl(String taskId, String status) =>
      '$_baseUrl/updateTaskStatus/$taskId/$status';

  static const String updateProfileUrl = '$_baseUrl/profileUpdate';
}