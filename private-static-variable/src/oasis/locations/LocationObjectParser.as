package oasis.locations {

    public class LocationObjectParser implements ILocationObjectParser {

      public function parseId(data: Object): int { 
        return data.id;
      }

    }

}
