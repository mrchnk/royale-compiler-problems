package {

  public class EnumRegistry {

    private var _registry:Array;

    public function EnumRegistry() {
      _registry = [];
    }

    public function add(type:Class, e:Enum):void {
      _registry.push([type, e]);
    }

    public function find(type:Class, name:String):Enum {
      for each (var row:Array in _registry) {
        var rType:Class = row[0];
        var e:Enum = row[1];
        if (rType === type && e.name === name) {
          return e;
        }
      }
      return null;
    }

  }

}
