package {

  public class Target extends Enum {

    public static const JSRoyale:Target = new Target('JSRoyale');
    public static const JS:Target = new Target('JS');
    public static const JSNode:Target = new Target('JSNode');
    public static const JSNodeModule:Target = new Target('JSNodeModule');
    public static const SWF:Target = new Target('SWF');

    public function Target(name:String) {
      super(name);
    }

  }

}
