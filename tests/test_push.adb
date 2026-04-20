with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   -- Instantiate with small capacity to test Is_Full easily
   Capacity : constant := 2;
   package Small_Stack is new Bounded_Vectors 
     (Element_Type    => Integer, 
      Default_Element => 0, 
      Max_Capacity    => Capacity);
   
   use Small_Stack;
   V : Vector;
begin
   -- Check initial state
   pragma Assert (Is_Empty (V));
   pragma Assert (not Is_Full (V));

   -- Fill the vector
   Push (V, 1);
   pragma Assert (not Is_Full (V));

   Push (V, 2);
   -- Vector should be full now
   pragma Assert (Is_Full (V));
   pragma Assert (Length (V) = Capacity);

   -- Test transition back to not full
   Pop (V);
   pragma Assert (not Is_Full (V));
end Test_Push;
