package {

  import org.apache.royale.test.Assert;

  public class Main {

    public function Main() {
      var object: Object = { coordinate : [ 10, 20 ] };
      var x: Number = object.coordinate[0];
      Assert.strictEqual(x, 10);
      trace("OK");
    }

  }

}
