package oasis.locations {

  public class LocationObject {

    private var _id: int;
		private static var _parser: ILocationObjectParser = new LocationObjectParser();

    public function LocationObject(data:Object) {
      _id = _parser.parseId(data);
    }

    public function get id(): int { return _id; }

  }
  
}
