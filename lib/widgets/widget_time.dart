String getGreeting() {
  var hour = DateTime.now().hour;

  if (hour >= 0 && hour < 12) {
    return 'Good morning,';
  } else if (hour >= 12 && hour < 17) {
    return 'Good Afternoon,';
  } else {
    return 'Good Evening,';
  }
}
