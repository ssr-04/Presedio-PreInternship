
# Task-6: Delegates, Events, and Basic Event Handling

## ✅ Objective

To build a **console-based event-driven application** using C# that demonstrates:

- Delegates and events
- Event-driven programming
- Decoupling of publisher (producer) and subscriber (consumer) logic

---

## 📋 Task Description

The program implements a **counter system** that:

- Defines a custom delegate and raises an event when a **threshold** is reached.
- Subscribes multiple **event handlers** to react to the threshold event.
- Uses multiple files to separate the publisher, subscriber, and main logic.
- Demonstrates clean and modular use of **event-driven architecture**.

---

## 📂 Project Structure

```
task-6/
├── task.txt               # Task description
├── output.txt             # Console output of program
└── code/                  # .NET Console App Project Folder
    ├── CounterPublisher.cs      # Publisher with delegate and event
    ├── CounterSubscriber.cs     # Subscriber with event handlers
    ├── Program.cs               # Main program entry point
    ├── task-6.csproj
    └── bin/ and obj/ folders    # Auto-generated build files
```

---

## 🧠 Key Concepts Used

- **Delegate:** `ThresholdReachedHandler` defines a method signature for the event.
- **Event:** `ThresholdReached` is fired when a counter hits the predefined threshold.
- **Custom EventArgs:** `ThresholdReachedEventArgs` carries additional context.
- **Decoupled Logic:** Publisher and subscribers are modular and unaware of each other’s internals.

---

## ⚙️ How It Works

1. `CounterPublisher` raises the `ThresholdReached` event when the counter reaches the defined value.
2. `CounterSubscriber` contains two handlers: `AlertHandler` and `LogHandler`, both triggered when the event is fired.
3. The `Main` method links the two using event subscriptions and runs the counter in a loop.

---

## 💻 Sample Output

```
Starting Counter...

Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5

[Publisher] Threshold 5 reached. Raising event...📢

[Subscriber] 🔔 Alert: Counter threshold reached!
[Subscriber] 📝 Log: Threshold event handled and logged.

Counter: 6
Counter: 7
Counter: 8
Counter: 9
Counter: 10

✅Program Ended.
```

---