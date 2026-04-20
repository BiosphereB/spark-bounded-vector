with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   package Int_Stack is new Bounded_Vectors 
     (Element_Type    => Integer, 
      Default_Element => 0, 
      Max_Capacity    => 10);
   
   use Int_Stack;
   V : Vector;
begin
   -- Fill and then clear
   Push (V, 42);
   Push (V, 24);
   pragma Assert (Length (V) = 2);

   Clear (V);
   pragma Assert (Is_Empty (V));
   pragma Assert (Length (V) = 0);
end Test_Push;
