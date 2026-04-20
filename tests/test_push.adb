with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   My_Cap : constant := 10;
   package Int_Stack is new Bounded_Vectors 
     (Element_Type    => Integer, 
      Default_Element => 0, 
      Max_Capacity    => My_Cap);
   
   use Int_Stack;
   V : Vector;
begin
   -- Test Capacity observer
   pragma Assert (Capacity (V) = My_Cap);

   Push (V, 10);
   Replace_Element (V, 1, 42);
   pragma Assert (Element (V, 1) = 42);
   
   pragma Assert (Contains (V, 42));
   Clear (V);
   pragma Assert (Is_Empty (V));
end Test_Push;
