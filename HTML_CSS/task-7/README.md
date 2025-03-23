# **🎠 Pure CSS Carousel/Slider**  

## **📜 Overview**  
This project implements a **pure CSS image carousel** that supports both **automatic sliding** and **manual navigation**. The carousel cycles through images using CSS animations and allows users to navigate manually using radio buttons.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-7/index.html)

This project demonstrates:  
✅ **Auto-sliding using `@keyframes`**  
✅ **Manual navigation using `:checked` pseudo-class**  
✅ **Responsive design for different screen sizes**  
✅ **Smooth transitions and animations**  

However, **making both auto-sliding and manual selection work seamlessly together using only CSS** presents a significant limitation, which will be discussed below.  

---

## **🎯 Task Objectives & How They Are Achieved**  

| **Requirement** | **Implementation** |
|---------------|----------------|
| Use **CSS animations (`@keyframes`)** for auto-sliding | ✅ `@keyframes slide` moves the slides automatically |
| Implement **manual navigation using `:checked` pseudo-class** | ✅ Hidden `<input type="radio">` elements allow manual selection |
| Ensure **responsiveness and smooth transitions** | ✅ Flexbox-based layout adapts to different screen sizes |

---

## **⚙️ Code Explanation**  

### **1️⃣ Auto-Sliding Using CSS Animations (`@keyframes`)**  
- The `.slides` container has a **keyframe animation** that cycles through images automatically.  

✅ **CSS Implementation:**  
```css
@keyframes slide {
    0% { margin-left: 0; }
    25% { margin-left: -100%; }
    50% { margin-left: -200%; }
    75% { margin-left: -300%; }
    100% { margin-left: 0; }
}

/* Apply auto-slide animation */
.slides {
    width: 400%;
    height: 100%;
    display: flex;
    animation: slide 20s infinite;
}
```
📌 **Why?**  
- Moves the slides every **5 seconds (`20s / 4 slides`)**.  
- Loops infinitely to create a continuous slideshow.  

---

### **2️⃣ Manual Navigation Using `:checked` Pseudo-Class**  
- Hidden **radio buttons** (`<input type="radio">`) are used to track the active slide.  
- Clicking on a **manual button (`<label>`)** selects the corresponding radio button.  

✅ **HTML Implementation:**  
```html
<input type="radio" name="slide" id="slide1">
<input type="radio" name="slide" id="slide2">
<input type="radio" name="slide" id="slide3">
<input type="radio" name="slide" id="slide4">
```
✅ **CSS Implementation:**  
```css
#slide1:checked ~ .slides { margin-left: 0; animation: none !important; }
#slide2:checked ~ .slides { margin-left: -100%; animation: none !important; }
#slide3:checked ~ .slides { margin-left: -200%; animation: none !important; }
#slide4:checked ~ .slides { margin-left: -300%; animation: none !important; }
```
📌 **Why?**  
- When a **radio button is selected**, the `margin-left` value moves the `.slides` container.  
- **Auto-slide animation (`@keyframes`) is disabled (`animation: none !important;`)** when a slide is manually selected.  

---

### **3️⃣ Navigation Buttons for Manual Control**  
- **Labels (`<label>`)** act as clickable buttons for each slide.  
- Clicking on a label **activates the corresponding radio button**.  

✅ **HTML Implementation:**  
```html
<div class="navigation-manual">
  <label for="slide1" class="manual-btn"></label>
  <label for="slide2" class="manual-btn"></label>
  <label for="slide3" class="manual-btn"></label>
  <label for="slide4" class="manual-btn"></label>
</div>
```
📌 **Why?**  
- Provides a simple **manual navigation mechanism** without JavaScript.  
- Labels are visually styled as **navigation dots**.  

✅ **CSS Implementation:**  
```css
.manual-btn {
    border: 2px solid #fff;
    padding: 5px;
    border-radius: 10px;
    cursor: pointer;
    transition: background 0.3s;
}

.manual-btn:hover {
    background: #fff;
}
```
📌 **Why?**  
- Buttons have a **hover effect** for better UX.  

---

## **🚨 CSS-Only Limitation: Auto & Manual Navigation Conflict**
One major limitation with **CSS-only carousels** is that:  
1. **Manual navigation (`:checked`) overrides auto-sliding.**  
   - Once a user clicks a slide button, the **animation stops permanently** (`animation: none !important;`).  
   - CSS lacks the capability to "restart" the animation after a delay.  
   
2. **Auto-sliding doesn't resume after manual selection.**  
   - Since CSS **can't detect user interactions dynamically**, there's **no way to reset auto-slide** after a manual selection.  
   
3. **A JavaScript solution is needed for seamless integration.**  
   - With **JavaScript**, we could:  
     - Detect when a manual button is clicked.  
     - Restart auto-sliding after some delay.  
     - Allow smooth switching between auto/manual modes.  

---

## **📂 Folder Structure**  
```
/project-root
│── index.html               # HTML file
│── styles.css               # CSS file
│── README.md                # Documentation (this file)
```

---

## **🚀 How to Run the Project?**  
1. **Clone the repository**  
2. **Open `index.html` in a browser.**  
3. Observe the **auto-sliding effect**.  
4. Click on the **manual buttons** to navigate between slides.  

---

## **✅ Summary of Implementation**  
| **Feature** | **Implementation** |
|------------|----------------|
| **Auto-sliding using `@keyframes`** | ✅ `@keyframes slide` moves the slides automatically |
| **Manual navigation using `:checked`** | ✅ Hidden radio buttons allow manual selection |
| **Smooth transitions** | ✅ `transition: margin-left 0.6s ease-in-out;` |
| **Fully responsive design** | ✅ Adapts to different screen sizes |
| **Auto vs Manual Navigation Conflict** | ⚠ **Manual selection disables auto-slide permanently** |

---