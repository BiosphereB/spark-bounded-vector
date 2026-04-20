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

   procedure Clear (V : in out Vector) is
   begin
      V.Size := 0;
   end Clear;

   function Contains (V : Vector; E : Element_Type) return Boolean is
   begin
      for I in 1 .. V.Size loop
         if V.Data (I) = E then
            return True;
         end if;

         pragma Loop_Invariant 
           (for all J in 1 .. I => V.Data (J) /= E);
      end loop;
      
      return False;
   end Contains;

end Bounded_Vectors;
