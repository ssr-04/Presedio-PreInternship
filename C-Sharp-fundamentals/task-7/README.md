

# 🧠 Task-8: Asynchronous Programming and Multi-threading

## ✅ Objective:
To build a console-based C# application that performs multiple asynchronous operations concurrently and aggregates results from simulated APIs, demonstrating real-world async patterns.

---

### 📌 Requirements Fulfilled:

- ✔️ Used `async`/`await` with `Task.Delay` to simulate real-world API latency.
- ✔️ Created multiple services:
  - **WeatherService** – Fetches current weather.
  - **StockService** – Provides stock price info.
  - **NewsService** – Supplies a trending news headline.
- ✔️ Introduced realistic failure rates using random probabilities.
- ✔️ Aggregated all responses into a personalized feed once all async tasks completed.
- ✔️ Cleanly separated responsibilities into multiple files for better structure and readability.

---

### 📁 Project Structure:

```
task-8/
├── code/
│   ├── IApiService.cs         # Interface for all simulated APIs
│   ├── WeatherService.cs      # Simulated weather API (20% failure)
│   ├── StockService.cs        # Simulated stock API (33% failure)
│   ├── NewsService.cs         # Simulated news API (10% failure)
│   ├── PersonalizedFeed.cs    # Orchestrates and displays all API responses
│   └── Program.cs             # Main entry point (async Main)
```

---

### 🖥️ Sample Output:

```
🔄 Fetching your personalized feed. Please wait...


📬 Personalized Feed:

🌤️ Weather: Sunny, 36°C in Coimbatore.
📈 Stock: FB ₹308.75 ↑16.80%
📰 News: AI revolutionizes healthcare diagnostics.

✅ Done.
```

Another run (with failures):

```
📬 Personalized Feed:

⚠️ Weather API: Something went wrong.
⚠️ Stock API: Something went wrong.
📰 News: AI revolutionizes healthcare diagnostics.

✅ Done.
```

---

### 📚 Concepts Demonstrated:

- **Asynchronous programming** using `async` and `await`
- **Concurrent execution** with `Task.WhenAll()`
- **Randomized simulated failure** handling
- **Loose coupling** via interface-based services
- **Clean architecture** with multiple files for better separation of concerns

---