with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   package Int_Stack is new Bounded_Vectors 
     (Element_Type    => Integer, 
      Default_Element => 0, 
      Max_Capacity    => 10);
   
   use Int_Stack;
   V : Vector;
begin
   Push (V, 10);
   Push (V, 20);
   Push (V, 30);
   
   -- Replace the middle element
   Replace_Element (V, 2, 99);
   
   pragma Assert (Element (V, 1) = 10); -- Should be unchanged
   pragma Assert (Element (V, 2) = 99); -- Should be updated
   pragma Assert (Element (V, 3) = 30); -- Should be unchanged
   
   pragma Assert (Length (V) = 3);
end Test_Push;
