generic
   type Element_Type is private;
   Default_Element : Element_Type;
   Max_Capacity    : Positive; 
package Bounded_Vectors with SPARK_Mode is

   type Vector is private with
     Default_Initial_Condition => Length (Vector) = 0;

   -- Basic observers
   function Length (V : Vector) return Natural;
   function Is_Empty (V : Vector) return Boolean is (Length (V) = 0);
   function Is_Full (V : Vector) return Boolean is (Length (V) = Max_Capacity);
   
   -- Returns the maximum number of elements the vector can hold
   function Capacity (V : Vector) return Positive is (Max_Capacity);

   -- Check if an element exists in the vector
   function Contains (V : Vector; E : Element_Type) return Boolean with
     Post => Contains'Result = (for some I in 1 .. Length (V) => Element (V, I) = E);

   -- Returns the top element without removing it
   function Top (V : Vector) return Element_Type with
     Pre => Length (V) >= 1 and then Length (V) <= Max_Capacity;

   -- Returns the element at a specific index
   function Element (V : Vector; Index : Positive) return Element_Type with
     Pre => Index >= 1 and then Index <= Length (V) and then Index <= Max_Capacity;

   -- Ghost function to verify that the prefix of the vector remains unchanged
   function Unchanged (V1, V2 : Vector; Up_To : Natural) return Boolean is
     (for all I in 1 .. Up_To => Element (V1, I) = Element (V2, I))
   with Ghost,
     Pre => (if Up_To > 0 then Up_To <= Length (V1) and Up_To <= Length (V2));

   -- Adds an element to the top of the vector
   procedure Push (V : in out Vector; E : Element_Type) with
     Pre  => not Is_Full (V),
     Post => Length (V) = Length (V'Old) + 1 and then
             Top (V) = E and then
             (if Length (V'Old) > 0 then Unchanged (V, V'Old, Length (V'Old)));

   -- Removes the top element
   procedure Pop (V : in out Vector) with
     Pre  => not Is_Empty (V),
     Post => Length (V) = Length (V'Old) - 1 and then
             (if Length (V) >= 1 then 
                Top (V) = Element (V'Old, Length (V)) and
                Unchanged (V, V'Old, Length (V)));

   -- Replaces an element at a specific index
   procedure Replace_Element (V : in out Vector; Index : Positive; E : Element_Type) with
     Pre  => Index <= Length (V),
     Post => Length (V) = Length (V'Old) and then
             Element (V, Index) = E and then
             Unchanged (V, V'Old, Index - 1) and then
             (for all I in Index + 1 .. Length (V) => Element (V, I) = Element (V'Old, I));

   procedure Clear (V : in out Vector) with
     Post => Is_Empty (V);

private
   type Element_Array is array (1 .. Max_Capacity) of Element_Type;

   type Vector is record
      Data : Element_Array := (others => Default_Element);
      Size : Natural range 0 .. Max_Capacity := 0;
   end record;

   function Length (V : Vector) return Natural is (V.Size);
   function Element (V : Vector; Index : Positive) return Element_Type is (V.Data (Index));
   function Top (V : Vector) return Element_Type is (V.Data (V.Size));

end Bounded_Vectors;
