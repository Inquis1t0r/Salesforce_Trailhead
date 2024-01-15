public class MyIterable implements Iterable<String> {
   public Iterator<String> iterator() {
      return new Set<String>{'Hello', 'World!'}.iterator();
   }
}

/*for (String str : new MyIterable()) {
   System.debug(str);
}*/
