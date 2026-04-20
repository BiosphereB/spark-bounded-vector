with Bounded_Vectors; use Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   V : Vector; -- Nutzt automatisch Default_Initial_Condition
begin
   -- Initialer Status
   pragma Assert (Is_Empty (V));

   -- Element hinzufügen
   Push (V, 42);
   pragma Assert (Length (V) = 1);

   -- Element entfernen
   Pop (V);

   -- Wieder leer
   pragma Assert (Is_Empty (V));
end Test_Push;
