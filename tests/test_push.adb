with Bounded_Vectors; use Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   V : Vector;
begin
   pragma Assert (Is_Empty (V));

   Push (V, 42);
   pragma Assert (Top (V) = 42);

   Push (V, 100);
   pragma Assert (Top (V) = 100);

   Pop (V);
   -- SPARK weiß nun: Der neue Top(V) ist Element(V'Old, 1), was 42 war.
   pragma Assert (Top (V) = 42);
   
   Pop (V);
   pragma Assert (Is_Empty (V));
end Test_Push;
