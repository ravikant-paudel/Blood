abstract class Utils {
  static String getUsername(String email) {
    return "live:${email.split('@')[0]}";
  }

  static String getInitials(String displayName) {
    final List<String> nameSplit = displayName.split(' ');
    final String firstName = nameSplit[0][0];
    final String secondName = nameSplit[1][0];
    return firstName.toUpperCase() + secondName.toUpperCase();
  }
}
