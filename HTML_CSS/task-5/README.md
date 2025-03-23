# **CSS-Based Modal Popup**  

## **📌 Overview**  
This project implements a **pure CSS modal (popup window)** using two different approaches:  
1. **`:target` pseudo-class** (Anchor-based modal)  
2. **`:checked` pseudo-class** (Checkbox-based modal)  

This meets the requirements of **Task 5: Modal Popup Using the `:target` or Checkbox Hack** while ensuring a **smooth user experience without JavaScript**.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-5/index.html)

---

## **🎯 Task Objectives & How They Are Achieved**  

### **1️⃣ Modal Visibility Using `:target` and `:checked`**  

| **Method**          | **Implementation** | **Behavior** |
|---------------------|------------------|--------------|
| `:target` Modal    | Uses `href="#modal1"` | Clicking the link opens the modal, navigating to `#modal1` |
| `:checked` Modal   | Uses a hidden checkbox | Clicking the label toggles a hidden checkbox, which controls modal visibility |

✅ **Code for Both Approaches:**  
```html
<!-- Modal using :target -->
<a href="#modal1" class="open-modal-button">Open Modal (Target)</a>
<div id="modal1" class="modal-container">
    <div class="modal">
        <h3>Confirmation</h3>
        <p>Modal implemented using the CSS :target pseudo-class.</p>
        <a href="#" class="close-btn">Okay</a>
    </div>
</div>

<!-- Modal using :checked -->
<label for="modal-toggle" class="open-modal-button">Open Modal (Checked)</label>
<input type="checkbox" id="modal-toggle" class="modal-toggle">
<div class="modal-container checked-modal">
    <div class="modal">
        <h3>Success</h3>
        <p>Modal implemented using the CSS :checked pseudo-class.</p>
        <label for="modal-toggle" class="close-btn">Close</label>
    </div>
</div>
```
📌 **How does this satisfy the requirement?**  
- **Uses `:target`** to control the first modal’s visibility via URL navigation.  
- **Uses `:checked`** to toggle visibility without affecting browser history.  

---

### **2️⃣ Styling the Modal to Be Centered with an Overlay**  
✔ **Positioning:** The modal is centered using `position: fixed;`  
✔ **Backdrop Effect:** A semi-transparent overlay (`background-color: rgba(0, 0, 0, 0.5);`)  
✔ **Modal Box:** Styled with padding, box-shadow, and a smooth border.  

✅ **CSS Implementation:**  
```css
.modal-container {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.5);
}
.modal {
    background-color: rgb(54, 58, 58);
    color: white;
    padding: 2rem;
    border-radius: 8px;
    width: 300px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
```
📌 **Why does this work?**  
- `position: fixed; top: 0; left: 0;` keeps the modal **centered on the screen**.  
- The backdrop overlay **darkens the background** for better focus.  

---

### **3️⃣ Smooth Appearance & Disappearance with CSS Transitions**  
✔ **The modal fades in and slides down smoothly when opened.**  
✔ **Uses `opacity` and `transform` for an elegant animation.**  

✅ **CSS Implementation:**  
```css
.modal {
    opacity: 0;
    transform: translateY(-50px);
    transition: all 0.3s ease;
}
.modal-container:target .modal, 
.checked-modal .modal {
    transform: translateY(0);
    opacity: 1;
}
```
📌 **Why does this work?**  
- `opacity: 0; transform: translateY(-50px);` keeps the modal **hidden initially**.  
- When the modal is **opened**, `opacity: 1; transform: translateY(0);` **creates a smooth transition**.  

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
3. Click on **either modal button** to test both approaches.  

---

## **📌 Conclusion**  
✔ **Task 5 is fully completed with two CSS-only modal implementations.**  
✔ **The `:target` approach is simple and effective, while the `:checked` approach provides smoother behavior.**  
✔ **Smooth animations, a centered modal, and a backdrop improve UX.**  

This showcases how **pure CSS can achieve JavaScript-like functionality**, keeping the UI lightweight and efficient. 🚀  

---