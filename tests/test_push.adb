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
   
   pragma Assert (Contains (V, 10));
   pragma Assert (Contains (V, 20));
   pragma Assert (not Contains (V, 30));

   Pop (V);
   pragma Assert (not Contains (V, 20));
   pragma Assert (Contains (V, 10));
   
   Clear (V);
   pragma Assert (not Contains (V, 10));
end Test_Push;
