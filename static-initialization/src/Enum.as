package {

  public class Enum {

    private static const _registry:EnumRegistry = new EnumRegistry();

    private var _name:String;

    public function Enum(name:String) {
      _name = name;
      _registry.add((this as Object).constructor, name, this);
    }

    public function get name():String {
      return _name;
    }

    public static function find(type:Class, name:String):* {
      return _registry.find(type, name);
    }

  }

}
