
---

# 🧮 Simple Calculator  

## 📌 Overview  

The **Simple Calculator** is a web-based application that allows users to perform **basic arithmetic operations** such as **addition, subtraction, multiplication, and division**. The project is built using **HTML, CSS, and JavaScript**, utilizing **DOM manipulation** to handle user input and update the display dynamically.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-2/index.html)

This project satisfies the task requirements as follows:  

### ✅ **Task Requirements & How They Are Met**  

| **Requirement**                                      | **Implementation in Code** |
|------------------------------------------------------|----------------------------|
| **Create number and operator buttons in HTML.**     | The `index.html` file contains buttons for numbers (0-9) and operators (`+`, `-`, `*`, `/`). |
| **Use JavaScript to capture user input.**           | The `script.js` file has event handlers that process button clicks and update the display. |
| **Perform calculations dynamically.**               | The `calculate()` function executes arithmetic operations when the `=` button is pressed. |
| **Update the display dynamically.**                 | The `appendToDisplay()` and `setOperator()` functions modify the display in real-time. |

---

## 📝 Code Explanation  

### **🔹 HTML (`index.html`)**
The HTML structure consists of:  
- A **display section** (`<div class="display">`) that shows the current input and results.  
- **Number buttons (`0-9`)** for user input.  
- **Operator buttons (`+`, `-`, `*`, `/`)** to define arithmetic operations.  
- A **clear button (`C`)** to reset the calculator.  
- An **equals button (`=`)** to compute the result.  

#### **🔹 Key Snippet**
```html
<div class="display" id="display">0</div>
<button onclick="appendToDisplay('7')">7</button>
<button onclick="appendToDisplay('8')">8</button>
<button onclick="appendToDisplay('9')">9</button>
<button onclick="setOperator('/')">/</button>
```
Each button is linked to a **JavaScript function** to update the display or perform an action.

---

### **🔹 CSS (`styles.css`)**
- The **display** is styled to align text to the right for a calculator-like experience.  
- Buttons are arranged in a **grid layout** for a structured design.  
- Background and shadow effects give it a **modern look**.  

#### **🔹 Key Snippet**
```css
.buttons {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 5px;
}

button {
    padding: 10px;
    font-size: 1em;
    cursor: pointer;
}
```
This ensures proper spacing and alignment of buttons.

---

### **🔹 JavaScript (`script.js`)**
The **JavaScript file handles the main logic** of the calculator.  

#### ✅ **1. Capturing User Input**
The `appendToDisplay(value)` function updates the display when a user clicks a number or `.`.  
```js
function appendToDisplay(value) {
    if (shouldResetDisplay) {
        display.textContent = value;
        shouldResetDisplay = false;
    } else {
        display.textContent = display.textContent === '0' ? value : display.textContent + value;
    }
}
```

---

#### ✅ **2. Handling Operators**
The `setOperator(op)` function **stores the first operand** and waits for the second operand.  
```js
function setOperator(op) {
    if (firstOperand === null) {
        firstOperand = parseFloat(display.textContent);
    } else if (operator) {
        calculate(); // If an operator is already selected, compute the previous result first
        firstOperand = parseFloat(display.textContent);
    }
    operator = op;
    shouldResetDisplay = true;
}
```
This allows **continuous calculations without pressing `=` every time**.

---

#### ✅ **3. Performing Calculations**
When the `=` button is clicked, the `calculate()` function is called.  
```js
function calculate() {
    if (firstOperand !== null && operator) {
        secondOperand = parseFloat(display.textContent);
        let result;

        switch (operator) {
            case '+':
                result = firstOperand + secondOperand;
                break;
            case '-':
                result = firstOperand - secondOperand;
                break;
            case '*':
                result = firstOperand * secondOperand;
                break;
            case '/':
                result = secondOperand === 0 ? 'Error' : firstOperand / secondOperand;
                break;
        }
        display.textContent = result;
        firstOperand = result; // Store the result for further calculations
        operator = null;
        shouldResetDisplay = true;
    }
}
```
This **switch case structure** ensures that **only valid operations are performed**.  

---

#### ✅ **4. Resetting the Calculator**
The `clearDisplay()` function **resets the calculator to its initial state** when the `C` button is clicked.  
```js
function clearDisplay() {
    display.textContent = '0';
    firstOperand = null;
    operator = null;
    secondOperand = null;
    shouldResetDisplay = false;
}
```
This **clears all values** and **prepares the calculator for new calculations**.

---

## ✅ **Conclusion**  
This project meets all the given requirements by implementing a fully functional **button-based calculator** using **DOM manipulation** and **event handling** in JavaScript. The display updates dynamically as users interact with the application, ensuring a smooth experience.

---