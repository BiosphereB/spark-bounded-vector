with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   -- Wir instanziieren das Package für Integer
   package Int_Vectors is new Bounded_Vectors (Element_Type => Integer, Default_Element => 0);
   use Int_Vectors;

   V : Vector;
begin
   pragma Assert (Is_Empty (V));

   Push (V, 42);
   pragma Assert (Top (V) = 42);

   Push (V, 100);
   pragma Assert (Top (V) = 100);

   Pop (V);
   pragma Assert (Top (V) = 42);
   
   Pop (V);
   pragma Assert (Is_Empty (V));
end Test_Push;
