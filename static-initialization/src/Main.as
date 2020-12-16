package {

  import org.apache.royale.test.Assert;

  public class Main {
    public function Main() {
      var target:Target = Enum.find(Target, 'JSNode');
      Assert.assertStrictlyEquals(target, Target.JSNode);
      console.log("OK");
    }
  }

}
