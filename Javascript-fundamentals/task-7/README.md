# 📝 **Real-time Chat Simulation**  

## 📌 **Overview**  
This **Real-time Chat Simulation** application provides an interactive chat experience where users can send messages, and a simulated chatbot responds dynamically. The chat includes **message timestamps, a typing indicator, and proactive bot messages**, all without requiring a backend.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-6/index.html)

---

## ✅ **How the Code Meets Task Requirements**  

| **Task Requirement** | **Implementation** |  
|----------------------|---------------------------|  
| **Create a chat window that displays messages as they are sent.** | Messages are dynamically added to the `.chat-messages` container when the user or bot sends a message. |  
| **Use `setTimeout` or `setInterval` to simulate incoming messages.** | - `setTimeout()` introduces a **delay before bot replies** for realism.  - `setInterval()` sends **random proactive messages** every 20 seconds. |  
| **Handle user input, display timestamps, and update the conversation dynamically.** | - Captures user input via `keypress` (Enter) and `click` events.  - Timestamps (`HH:MM` format) are displayed for each message.  - Updates bot status (`typing...`) before responding. |  

---

## 🛠️ **Technologies Used**  

- **HTML5** – Defines the chat interface structure.  
- **CSS3** – Styles the chat for a **modern, gradient-based UI** with animations.  
- **JavaScript (ES6)** – Implements **message handling, bot responses, timestamps, and dynamic DOM updates**.  

---

## 🔧 **Application Workflow**  

### 1️⃣ **User Sends a Message**  
- When a message is entered in the input field, it is added to the chat as an **outgoing message**.  
- The timestamp of when the message was sent is displayed.  

### 2️⃣ **Chatbot Simulates a Reply**  
- After a small **random delay (1-4 seconds)**, the bot displays a **response message**.  
- The bot’s **status changes to "typing..."** before the message appears.  

### 3️⃣ **Proactive Messages (Bot-Generated)**  
- Every **20 seconds**, the chatbot **sends a message randomly** (if there’s prior activity).  

### 4️⃣ **Real-time UI Updates**  
- The chat **scrolls to the latest message automatically**.  
- **Keyboard accessibility**: Pressing **Enter** sends a message without clicking the send button.  

---

## 🎨 **User Interface & Styling**  

✔ **Gradient background for a modern look**  
✔ **Smooth message animations (`fadeIn` effect)**  
✔ **Incoming (bot) and outgoing (user) messages styled differently**  
✔ **Typing indicator (`typing...`) before bot responses**  
✔ **Timestamp displayed for every message**  

---

## ⚡ **Technical Highlights**  

✔ **Real-time interactions** using **`setTimeout` and `setInterval`**.  
✔ **No backend required** – all logic runs **entirely on the client side**.  
✔ **Efficient DOM updates** for smooth performance.  
✔ **Clean modular structure** with `data.js` for bot responses.  
✔ **Cross-device compatibility** for desktops and mobile screens.  

---

## ✅ **Conclusion**  

This **Real-time Chat Simulation** successfully creates an **engaging and interactive** messaging experience using **vanilla JavaScript**. The combination of **typing delays, timestamps, and proactive responses** makes it feel **realistic and engaging**. 🚀

---