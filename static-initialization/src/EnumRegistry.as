package {

  public class EnumRegistry {

    private var _registry: Array;

    public function EnumRegistry() {
      _registry = [];
    }

    public function add(type:Class, name:String, e:Enum):void {
      _registry.push([type, name, e]);
    }

    public function find(type:Class, name:String):* {
      for each (var row:Array in _registry) {
        if (row[0] === type && row[1] === name) {
          return row[2];
        }
      }
      return null;
    }

  }

}
