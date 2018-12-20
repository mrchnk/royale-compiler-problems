package {

  import org.apache.royale.test.Assert;

  public class Main {

    public function Main() {
      var array: Array = [ 1, 2, 3 ];
      var filteredArray: Array = array.filter(function isEven(element: int, index: int, arr: Array) : Boolean {
        return element % 2 == 0;
      });
      Assert.strictEqual(filteredArray[0], 2);
      trace("OK");
    }

  }

}
