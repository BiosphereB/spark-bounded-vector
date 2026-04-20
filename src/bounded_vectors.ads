package Bounded_Vectors with SPARK_Mode is
   Max_Capacity : constant := 100;
   subtype Element_Type is Integer;

   type Vector is private with
     Default_Initial_Condition => Length (Vector) = 0;

   function Length (V : Vector) return Natural;
   function Is_Empty (V : Vector) return Boolean is (Length (V) = 0);

   function Top (V : Vector) return Element_Type with
     Pre => Length (V) >= 1 and then Length (V) <= Max_Capacity;

   function Element (V : Vector; Index : Positive) return Element_Type with
     Pre => Index >= 1 and then Index <= Length (V) and then Index <= Max_Capacity;

   function Unchanged (V1, V2 : Vector; Up_To : Natural) return Boolean is
     (for all I in 1 .. Up_To => Element (V1, I) = Element (V2, I))
   with Ghost,
     Pre => (if Up_To > 0 then Up_To <= Length (V1) and Up_To <= Length (V2));

   procedure Push (V : in out Vector; E : Element_Type) with
     Pre  => Length (V) < Max_Capacity,
     Post => Length (V) = Length (V'Old) + 1 and then
             Top (V) = E and then
             (if Length (V'Old) > 0 then Unchanged (V, V'Old, Length (V'Old)));

   procedure Pop (V : in out Vector) with
     Pre  => Length (V) >= 1,
     Post => Length (V) = Length (V'Old) - 1 and then
             (if Length (V) >= 1 then 
                Top (V) = Element (V'Old, Length (V)) and
                Unchanged (V, V'Old, Length (V)));

private
   type Element_Array is array (1 .. Max_Capacity) of Element_Type;

   type Vector is record
      Data : Element_Array := (others => 0);
      Size : Natural range 0 .. Max_Capacity := 0;
   end record;

   function Length (V : Vector) return Natural is (V.Size);
   
   function Element (V : Vector; Index : Positive) return Element_Type is
     (V.Data (Index));

   function Top (V : Vector) return Element_Type is
     (V.Data (V.Size));
end Bounded_Vectors;
