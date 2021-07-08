@RequestMapping("/hello")
String hello(Map<String, Object> model) {
  model.put("message", "Welcome to my app!");
  return "hello";
}
