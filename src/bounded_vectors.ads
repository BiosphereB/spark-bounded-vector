package Bounded_Vectors with SPARK_Mode is
   Max_Capacity : constant := 100;
   subtype Element_Type is Integer;

   type Vector is private with
     Default_Initial_Condition => Length (Vector) = 0;

   function Length (V : Vector) return Natural;
   function Is_Empty (V : Vector) return Boolean is (Length (V) = 0);

   procedure Push (V : in out Vector; E : Element_Type) with
     Pre  => Length (V) < Max_Capacity,
     Post => Length (V) = Length (V)'Old + 1;

   procedure Pop (V : in out Vector) with
     Pre  => not Is_Empty (V),
     Post => Length (V) = Length (V)'Old - 1;

private
   type Element_Array is array (1 .. Max_Capacity) of Element_Type;

   type Vector is record
      Data : Element_Array := (others => 0);
      Size : Natural := 0;
   end record;

   function Length (V : Vector) return Natural is (V.Size);
end Bounded_Vectors;
