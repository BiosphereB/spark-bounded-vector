package body Bounded_Vectors with SPARK_Mode is

   procedure Push (V : in out Vector; E : Element_Type) is
   begin
      V.Size := V.Size + 1;
      V.Data (V.Size) := E;
   end Push;

   procedure Pop (V : in out Vector) is
   begin
      V.Size := V.Size - 1;
   end Pop;

end Bounded_Vectors;
