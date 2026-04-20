# SPARK Bounded Vector

A formally verified bounded vector implementation written in SPARK Ada.

This project demonstrates how to build a simple container with strong correctness guarantees using the SPARK toolchain and GNATprove.

---

## ✨ Features

* Generic bounded vector
* Fixed capacity (no dynamic allocation)
* Formally verified using GNATprove
* SPARK-compliant (suitable for high-integrity systems)

---

## 📦 Structure

```
spark-bounded-vector/
├── src/        -- implementation
├── tests/      -- usage examples / tests
├── gpr/        -- project file
```

---

## 🚀 Example Usage

```ada
with Bounded_Vectors;

procedure Example is

   package Int_Vectors is new Bounded_Vectors
     (Element_Type => Integer,
      Capacity     => 10);

   V : Int_Vectors.Vector;

begin
   Int_Vectors.Init (V);
   Int_Vectors.Push (V, 42);
end Example;
```

---

## 🔍 Verification

To run SPARK proofs:

```bash
gnatprove -P gpr/bounded_vector.gpr --mode=all
```

Expected result:

```
All checks proved
```

---

## 🧠 Design Notes

* The container avoids dynamic allocation
* Capacity is fixed at instantiation time
* Initialization ensures all elements are valid
* Operations are guarded by preconditions

Example:

* `Push` requires the vector not to be full
* `Top` / `Pop` (future) require non-empty vector

---

## 📌 Status

This is an **experimental, formally verified core implementation**.

Planned improvements:

* Pop / Top operations
* Extended contracts
* Additional test cases

---

## 📜 License

MIT License

```
```

