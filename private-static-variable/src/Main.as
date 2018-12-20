package {

  import oasis.locations.LocationObject;
  import org.apache.royale.test.Assert;

  public class Main {

    public function Main() {
      var location: LocationObject = new LocationObject({ id: 100 });
      Assert.strictEqual(location.id, 100);
      trace("OK");
    }

  }

}
