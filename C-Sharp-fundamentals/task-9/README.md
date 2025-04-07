
# 🛠️ Developer Automation Task Runner

## Overview

This project demonstrates the use of **Reflection** and **Custom Attributes** in C# by simulating a **Developer Automation Task Runner**. The application dynamically discovers and executes methods marked with a custom `[Runnable]` attribute, mimicking how automated scripts or CI/CD tools might trigger specific developer tasks.

---

## ✅ Task Objectives

| Requirement | Implementation |
|-------------|----------------|
| Define a custom attribute | ✔️ `[Runnable]` with a `description` field |
| Mark methods using the attribute | ✔️ Several static methods decorated with `[Runnable]` |
| Use reflection to discover methods | ✔️ Uses `Assembly.GetExecutingAssembly()` to find runnable methods |
| Invoke discovered methods dynamically | ✔️ Executes via `MethodInfo.Invoke` and logs output |
| Bonus: Custom logic | ✔️ Added `[Secret]` attribute to mark excluded/hidden methods |

---

## 🧱 Project Structure

```
task-9/
├── code/
│   ├── Attributes.cs          # Contains custom attributes: [Runnable], [Secret]
│   ├── DeveloperTasks.cs      # Static class with methods tagged with attributes
│   ├── AutomationRunner.cs    # Reflection logic to find and invoke [Runnable] methods
│   └── Program.cs             # Entry point that runs the automation runner
```

---

## 🚀 How It Works

1. The application starts in `Program.cs`.
2. `AutomationRunner` uses reflection to:
   - Scan all types in the current assembly.
   - Find all **methods** decorated with `[Runnable]`.
3. Each discovered method is:
   - Displayed with its description.
   - Invoked dynamically.
4. Methods without `[Runnable]` (or marked as `[Secret]`) are **not executed**.

---

## 🧪 Sample Output

```
🛠️ Developer Automation Task Runner

🔍 Scanning for [Runnable] tasks...

▶️ Running: GenerateReport — Performs the system tests.
📄 All tests passed.

▶️ Running: PerformHealthCheck — Performs the system health check.
💻 Health Check: Nominal (CPU 34%, Memory 65%, Disk 70%).

▶️ Running: SendSummaryMail — Sends summary email to the team.
📧 Summary Email sent to admin@company.com.

✅ All runnable tasks executed.
```

---

## 💡 Features

- `RunnableAttribute`: Main attribute used to tag executable methods.
- `SecretAttribute`: Demonstrates attribute-based exclusion (not invoked).
- `Reflection`: Core mechanism used to dynamically find and run tagged methods.
- `MethodInfo.Invoke`: Allows execution of methods at runtime without hardcoding calls.

---

## 🔧 Requirements

- [.NET 6 SDK or later](https://dotnet.microsoft.com/download)
- Terminal / Command Line

---

## 📦 How to Run

```bash
cd task-9/code
dotnet run
```

---

## 📚 Concepts Covered

- Custom Attributes in C#
- Reflection and Assembly Inspection
- Runtime Method Discovery
- Dynamic Invocation using `MethodInfo.Invoke`

---
