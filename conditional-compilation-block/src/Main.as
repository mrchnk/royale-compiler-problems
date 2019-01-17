package {

  import org.apache.royale.test.Assert;

  public class Main {

    public function Main() {
      CONFIG::DEBUG {
        debugThis();
        debugThat();
        Assert.strictEqual(0, _debug);
      }
      trace("OK");
    }

    CONFIG::DEBUG {

      private var _debug: int = 0;

      private function debugThis(): void {
        _debug++;
      }

      private function debugThat(): void {
        _debug--;
      }

    }

  }

}
