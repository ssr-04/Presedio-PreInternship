# **📂 CSS Accordion Component**

## **📜 Overview**  
This project implements a **pure CSS accordion** that allows users to expand and collapse content sections **without JavaScript**. It uses the **"checkbox hack"** with hidden checkboxes and the `:checked` pseudo-class to control visibility.  

This accordion is:  
✅ **Interactive** – Click on a section to expand/collapse.  
✅ **CSS-Only** – No JavaScript required.  
✅ **Responsive** – Adjusts to different screen sizes.  
✅ **Smoothly Animated** – Uses CSS transitions for a clean UI experience.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-8/index.html)

---

## **🎯 Task Objectives & How They Are Achieved**  

| **Requirement** | **Implementation** |
|---------------|----------------|
| Use the **checkbox hack (`:checked`)** to control visibility | ✅ Each accordion item has a hidden checkbox that toggles content |
| Apply **CSS transitions for smooth animation** | ✅ `max-height`, `overflow: hidden`, and `transition: ease-out` are used |
| Allow **multiple sections to be open simultaneously** | ✅ Since checkboxes are independent, multiple sections can expand at once |
| Ensure **responsiveness** | ✅ Uses percentage-based widths & media queries |

---

## **⚙️ Code Explanation**  

### **1️⃣ HTML Structure**  
Each accordion item follows this structure:  

```html
<div class="accordion-item">
  <input type="checkbox" id="section1" class="accordion-input">
  <label for="section1" class="accordion-label">What does this code do?</label>
  <div class="accordion-content">
    <p>This code creates an interactive accordion component using HTML and CSS.</p>
  </div>
</div>
```
📌 **Key Features:**  
- The **hidden checkbox (`<input type="checkbox">`)** determines whether the content is expanded.  
- The **label (`<label>`)** acts as a clickable trigger for expansion/collapse.  
- The **content (`<div class="accordion-content">`)** is hidden by default and expands when checked.  

---

### **2️⃣ CSS Styling**  

#### **📌 Accordion Container**  
```css
.accordion {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    width: 60%;
}
```
- Uses **flexbox** to stack accordion items vertically.  
- Adjusts width based on screen size.  

#### **📌 Hiding the Checkbox Input**  
```css
.accordion-input {
    display: none;
}
```
- The checkbox remains hidden while still being functional.  

#### **📌 Clickable Label (Accordion Header)**  
```css
.accordion-label {
    display: block;
    padding: 15px;
    background: white;
    cursor: pointer;
    position: relative;
}
.accordion-label:hover {
    background: rgba(255, 255, 255, 0.483);
}
```
- Makes the label **clickable**.  
- Provides a **hover effect** to improve user experience.  

#### **📌 Expand/Collapse Animation**  
```css
.accordion-content {
    max-height: 0;
    background-color: rgba(128, 128, 128, 0.205);
    overflow: hidden;
    padding: 0 15px;
    transition: all 0.3s ease-out;
}
.accordion-input:checked ~ .accordion-content {
    max-height: 100vh; /* Allows auto-expansion */
}
```
- By default, content has `max-height: 0` (**hidden**).  
- When `:checked`, `max-height` is increased, and the section **expands smoothly**.  

#### **📌 `+` & `-` Indicators for Expansion**  
```css
.accordion-label::after {
    content: "+";
    color: black;
    font-size: 1.2rem;
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
}
.accordion-input:checked ~ .accordion-label::after {
    content: "-";
    font-size: 1.3rem;
}
```
📌 **Why?**  
- The **`+` sign** shows that a section is expandable.  
- When expanded, it **changes to `-`** to indicate it can be collapsed.  

---

## **📱 Responsive Design**  
The accordion adapts to **different screen sizes** using **media queries**.

### **🔹 Mobile Devices (≤767px)**
```css
@media screen and (max-width: 767px) {
    .accordion {
        max-width: 100%;
        margin: 10px;
    }
    .accordion-label {
        padding: 12px;
        font-size: 16px;
    }
}
```
- **Accordion width expands to 100%** for better usability on smaller screens.  
- **Font size & padding** are adjusted for readability.  

### **🔹 Tablets (768px - 1024px)**
```css
@media screen and (min-width: 768px) and (max-width: 1024px) {
    .accordion {
        max-width: 90%;
        margin: 15px auto;
    }
}
```
- Increases **width to 90%** for better spacing.  

### **🔹 Large Screens (≥1025px)**
```css
@media screen and (min-width: 1025px) {
    .accordion {
        max-width: 800px;
    }
}
```
- Keeps a **fixed width of 800px** for a clean desktop layout.  

---

## **🚨 CSS-Only Limitations**
Although the **checkbox hack** works well, there are some **limitations**:  

### **1️⃣ Closing Other Sections Automatically (Accordion Behavior)**
✅ **Current Behavior:**  
- Multiple sections can be expanded at the same time.  

⚠ **Limitation:**  
- A **JavaScript-based accordion** would automatically close other sections when one is opened.  
- **CSS-only accordions can’t enforce a single open section at a time.**  

### **2️⃣ Accessibility Concerns (`aria-expanded`)**
✅ **Current Behavior:**  
- Users can **click to expand sections** visually.  

⚠ **Limitation:**  
- Screen readers don’t **dynamically detect open/close states**.  
- **Solution:** In a JS-based approach, we’d set `aria-expanded="true"` when expanded.  

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
3. Click on any **accordion section** to expand or collapse content.  

---

## **✅ Summary of Implementation**
| **Feature** | **Implementation** |
|------------|----------------|
| **Expand/collapse with `:checked`** | ✅ Hidden checkboxes control visibility |
| **Smooth animation using `transition`** | ✅ `max-height` changes with `ease-out` effect |
| **Custom styling (hover effects, fonts, colors)** | ✅ Labels & content have customized styling |
| **Expandable `+` and `-` indicators** | ✅ Dynamically changes using `::after` |
| **Responsive Design** | ✅ Uses media queries for different devices |
| **CSS-Only Limitation** | ⚠ No auto-close behavior for other sections |

---
