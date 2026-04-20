with Bounded_Vectors;

procedure Test_Push with SPARK_Mode is
   -- Instanz 1: Ein kleiner Stack für Integers
   package Small_Int_Stack is new Bounded_Vectors 
     (Element_Type    => Integer, 
      Default_Element => 0, 
      Max_Capacity    => 10);
   
   -- Instanz 2: Ein großer Stack für Zeichen (nur als Beispiel)
   package Large_Char_Stack is new Bounded_Vectors 
     (Element_Type    => Character, 
      Default_Element => ' ', 
      Max_Capacity    => 1000);

   use Small_Int_Stack;
   V : Small_Int_Stack.Vector;
begin
   pragma Assert (Is_Empty (V));

   Push (V, 42);
   pragma Assert (Top (V) = 42);

   Pop (V);
   pragma Assert (Is_Empty (V));
end Test_Push;
