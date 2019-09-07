package {

  import goog.global;

  public class Main {

    public function Main() {
      new ClassWithDependency();
      new ClassWithoutDependency();
      var x: ExternalWithoutDependency = global['_DEFINED_ELSEWHERE_'];
      if (x) {
        x.doSomething();
      }
    }

  }

}
