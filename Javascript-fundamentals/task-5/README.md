# 📝 Dynamic Quiz Application  

## 📌 Overview  

The **Dynamic Quiz Application** allows users to take a quiz where questions are loaded dynamically. It tracks user responses, calculates their final score, and provides feedback with explanations. The application is designed to be interactive and user-friendly, ensuring smooth navigation between questions.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-5/index.html)

---

## ✅ How the Code Meets the Task Requirements  

| **Task Requirement** | **Implementation in Code** |  
|----------------------|---------------------------|  
| **Store quiz questions and options in a JavaScript object or load them from an external JSON file.** | Quiz questions are stored in a separate **`data.js` file** and imported as a module. This modular approach ensures scalability and easy updates. |  
| **Use event listeners to capture user selections and move through quiz questions.** | Click events handle **answer selection, navigation between questions, and quiz submission**. Selected answers are stored in an array for tracking. |  
| **Calculate and display the final score, providing feedback or explanations.** | The `submitQuiz()` function computes the **final score, percentage**, and presents **correct answers with explanations** for better learning. |  

---

## 🛠️ Technologies Used  

- **HTML** – Defines the quiz layout and structure.  
- **CSS** – Styles the quiz with background effects, hover animations, and responsive design.  
- **JavaScript (ES6 Modules)** – Handles **question rendering, navigation, scoring, and feedback generation**.  

---

## 🔧 Application Workflow  

### 1️⃣ **Loading Quiz Questions Dynamically**  
The application starts by loading questions and answer choices from the `data.js` file. The **`loadQuestion(index)`** function dynamically updates the **question container** and **options container**, ensuring only the relevant content is displayed.  

### 2️⃣ **Handling User Selection**  
Users select an answer by clicking on an option. The **`selectOption()`** function highlights the chosen option and updates the `userAnswers` array to store their response. If users navigate back, their previous selection is retained.  

### 3️⃣ **Navigating Between Questions**  
- The **"Next"** button ensures users cannot proceed without selecting an answer.  
- The **"Previous"** button allows revisiting previous questions while retaining selected answers.  
- The **"Submit"** button appears on the last question, allowing users to complete the quiz.  

### 4️⃣ **Calculating Score and Displaying Feedback**  
Once submitted, the quiz interface hides and the **final score** is displayed as a **percentage**. The app also provides:  
- **Correct and incorrect answers** for review.  
- **Explanations** for each question to help users understand their mistakes.  

---

## 🎨 User Interface & Styling  

✔ **Background GIF (`bg.gif`) provides a visually appealing design.**  
✔ **Hover effects enhance user interaction with options.**  
✔ **Responsiveness ensures the app works on desktops, tablets, and mobile devices.**  
✔ **Navigation buttons have smooth transitions and accessibility considerations.**  

---

## ⚡ Technical Highlights  

✔ **Separation of Concerns:**  
   - `data.js` holds quiz data.  
   - `script.js` handles the logic.  
   - `styles.css` manages UI styling.  

✔ **Efficient State Management:**  
   - User responses are stored in an **array (`userAnswers`)**, allowing seamless navigation.  

✔ **Scalability:**  
   - Questions can easily be **updated or expanded** by modifying `data.js`.  
   - Could be extended to **fetch quiz data from an API** in the future.  

✔ **Error Handling:**  
   - Prevents users from skipping questions without answering.  

---

## ✅ Conclusion  

The **Dynamic Quiz Application** effectively meets all the task requirements by implementing **dynamic question loading, event-driven navigation, real-time answer tracking, and detailed feedback generation**. Its structured code, **scalability, and smooth user experience** make it a **well-designed quiz platform**. 🚀

---