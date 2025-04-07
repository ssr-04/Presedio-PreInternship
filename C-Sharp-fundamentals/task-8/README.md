
# Task-8: Generics and Interfaces with a Repository Pattern

## ✅ Objective:
Implement a generic in-memory repository pattern in C# to demonstrate **CRUD operations**, **generic constraints**, and **interface-based design**, along with a console-based UI.

---

## 📋 Requirements Covered:

- ✅ Defined a generic interface `IRepository<T>` with basic CRUD methods:
  - `Add`
  - `Get`
  - `GetAll`
  - `Update`
  - `Delete`

- ✅ Created an `IEntity` interface to enforce the presence of an `Id` property.

- ✅ Developed a generic class `InMemoryRepository<T>` that implements `IRepository<T>` with a constraint:
  ```csharp
  where T : IEntity
  ```

- ✅ Used a `Dictionary<int, T>` for efficient in-memory storage and lookup.

- ✅ Created a sample entity `Product` implementing `IEntity`.

- ✅ Demonstrated full repository usage through a console application.

---

## 📁 Project Structure

```
task-8/
├── code/
│   ├── Program.cs              # Console UI demonstrating repository usage
│   ├── InMemoryRepository.cs   # Generic repository class
│   └── IRepository.cs          # Interfaces: IRepository<T> and IEntity
├── output.txt                  # Console output of the program
└── README.md                   # Project documentation (this file)
```

---

## 💻 Sample Console Output

```
[ADD] Product with ID 101 added.
[ADD] Product with ID 102 added.
[ADD] Product with ID 103 added.

📦 All Products:
ID: 101, Name: Laptop, Price: ₹60000
ID: 102, Name: Mouse, Price: ₹500
ID: 103, Name: Keyboard, Price: ₹1200

[UPDATE] Product with ID 102 updated.
[DELETE] Product with ID 103 deleted.

📦 Updated Product List:
ID: 101, Name: Laptop, Price: ₹60000
ID: 102, Name: Wireless Mouse, Price: ₹700

🔍 Get Product with ID 101: ID: 101, Name: Laptop, Price: ₹60000
```

---

## 🔧 Key Concepts Demonstrated

- **Generics (`<T>`):** Allows the repository to be reused for different data types.
- **Interfaces:** Decouples logic and promotes extensibility.
- **Type Constraints (`where T : IEntity`):** Ensures type safety by requiring the presence of an `Id` property.
- **In-memory storage:** Efficient dictionary-based storage for demo purposes.

---

