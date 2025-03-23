
# **📌 Tabbed Content Interface (Pure CSS Implementation)**  

## **📜 Overview**  
This project implements a **pure CSS tabbed content interface**, fulfilling the requirements of **Task 6: Tabbed Content Interface**. It enables users to **switch between content sections** using tabs, with smooth transitions, without requiring JavaScript.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-6/index.html)

This implementation achieves:  
✅ **Tab switching using radio buttons and labels**  
✅ **Hiding and displaying content using `:checked` pseudo-class**  
✅ **Smooth animations for better user experience**  
✅ **ARIA attributes for accessibility**  

---

## **🎯 Task Objectives & How They Are Achieved**  

| **Requirement** | **Implementation** |
|---------------|----------------|
| Use **radio buttons or checkboxes** (hidden from view) | ✅ Hidden `<input type="radio">` elements handle tab switching |
| Utilize the **`:checked` pseudo-class** to control visibility | ✅ `#tab1:checked ~ .tab-content #content1` displays the correct content |
| Ensure **smooth transitions** when switching tabs | ✅ `transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;` |

---

## **🛠️ Code Implementation & Explanation**  

### **1️⃣ Using Hidden Radio Buttons to Control Tab Selection**  
- Each **tab is linked to a hidden radio button**.  
- When a user clicks a label, the corresponding radio button gets checked.  

✅ **Code Implementation:**  
```html
<!-- Hidden radio buttons for tab selection -->
<input type="radio" id="tab1" name="tabs" checked hidden />
<input type="radio" id="tab2" name="tabs" hidden />
```
📌 **Why?**  
- These radio buttons **store the state** of the active tab.  
- The `checked` attribute on `tab1` ensures the first tab is **selected by default**.  

---

### **2️⃣ Labels as Clickable Tabs**  
- **Labels are used as tab controls**, linked to the radio buttons using the `for` attribute.  

✅ **Code Implementation:**  
```html
<div class="tabs" role="tablist">
    <label for="tab1" role="tab" aria-controls="content1" tabindex="0">Ingredients</label>
    <label for="tab2" role="tab" aria-controls="content2" tabindex="0">Instructions</label>
</div>
```
📌 **Why?**  
- Clicking a **label** updates the **checked state of the corresponding radio button**.  
- **ARIA attributes**:  
  - `role="tablist"` groups tabs for **screen readers**.  
  - `role="tab"` makes each label **act like a real tab**.  
  - `aria-controls="content1"` **associates tabs with content**.  
  - `tabindex="0"` allows **keyboard navigation**.  

---

### **3️⃣ Content Sections Controlled by `:checked` Pseudo-Class**  
- Each content section is **associated with a tab using `id` and `aria-labelledby`**.  
- The `:checked` pseudo-class **toggles content visibility**.  

✅ **Code Implementation:**  
```html
<div class="tab-content">
    <div id="content1" role="tabpanel">
      <h2>Ingredients</h2>
      <p>This is the content for Tab 1.</p>
    </div>
    <div id="content2" role="tabpanel">
      <h2>Instructions</h2>
      <p>This is the content for Tab 2.</p>
    </div>
</div>
```
📌 **Why?**  
- Each section is **initially hidden** using CSS.  
- The `role="tabpanel"` attribute improves **screen reader usability**.  

✅ **CSS Implementation (Toggle Content)**  
```css
/* Hide all tab content by default */
.tab-content > div {
    position: absolute;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
}

/* Show the selected tab content */
#tab1:checked ~ .tab-content #content1,
#tab2:checked ~ .tab-content #content2 {
    opacity: 1;
    transform: translateY(0);
}
```
📌 **Why does this work?**  
- **All content is hidden initially** (`opacity: 0; transform: translateY(20px);`).  
- When a tab is **selected (`:checked`)**, the corresponding section **fades in and moves up smoothly**.  

---

### **4️⃣ Styling the Tabs & Active State**  
- The **tabs are styled for better usability**.  
- The **active tab gets a different background color**.  

✅ **CSS Implementation:**  
```css
/* Tab container */
.tabs {
    display: flex;
    gap: 1rem;
    justify-content: center;
    padding: 1rem 2rem;
    background: rgb(58, 56, 56);
    color: white;
    border-radius: 5px;
}

/* Tab labels */
.tabs label {
    cursor: pointer;
    font-size: 1.2rem;
    font-weight: bold;
    padding: 0.7rem 2rem;
    border-radius: 8px;
    transition: background 0.3s ease-in-out;
}

/* Active tab */
#tab1:checked ~ .tabs label[for="tab1"],
#tab2:checked ~ .tabs label[for="tab2"] {
    background: rgb(21, 20, 20);
    color: wheat;
}
```
📌 **Why does this work?**  
- `:checked` selects the **active tab label** and changes its background color.  
- The `transition: background 0.3s ease-in-out;` makes **the color change smooth**.  

---

## **📂 Folder Structure**  
```
/project-root
│── index.html   # HTML file
│── styles.css   # CSS file
│── README.md    # Documentation
```

---

## **🚀 How to Run the Project?**  
1. **Clone the repository**  
2. **Open `index.html` in a browser.**  
3. Click on **each tab** to test the switching behavior.  

---

## **✅ Summary of Implementation**
| **Feature** | **Implementation** |
|------------|----------------|
| **Radio buttons for state management** | ✅ Hidden `<input type="radio">` elements |
| **Labels as tab controls** | ✅ `<label>` elements with `for` attributes |
| **Content switching using `:checked`** | ✅ `#tab1:checked ~ .tab-content #content1` |
| **Smooth transitions** | ✅ `opacity` and `transform: translateY(20px);` |
| **ARIA accessibility improvements** | ✅ `role="tablist"`, `role="tabpanel"`, `aria-controls` |

- This implementation provides a **fully functional, accessible, and visually appealing tabbed interface** using **only CSS**. 🚀  

---