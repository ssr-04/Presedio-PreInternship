
---

# **Responsive Grid Layout**  

## **📌 Overview**  
While working on **Task 2 (CSS Card Component with Hover Effects)**, the **grid-based layout** was already implemented. Since it naturally satisfies the requirements of **Task 3 (Responsive Grid Layout)**, no additional modifications were needed.  

This is a good example of how **structuring components with reusability in mind** can help avoid redundant work while ensuring a clean and scalable design.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-3/index.html) 

---

## **🎯 Task Objective**  
Build a **responsive grid layout** that:  
✔ Uses **CSS Grid** to arrange items in three columns on desktops.  
✔ Stacks items into **a single column on mobile** using media queries.  
✔ Maintains **consistent spacing and alignment** between items.  

---

## **✅ How Task 3 is Already Implemented in Task 2**  

### **1️⃣ CSS Grid for Layout**  
✔ **Desktop View:** Cards are displayed in a **3-column grid**.  
✔ **Mobile View:** Cards stack into **a single column**.  

✅ **Code Implementation (from Task 2):**  
```css
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: var(--spacing-lg);
}
```
📌 **Why does this work?**  
- `repeat(auto-fill, minmax(300px, 1fr))` ensures the grid adapts dynamically.  
- The layout remains flexible across different screen sizes.  

---

### **2️⃣ Responsive Adjustments with Media Queries**  
✔ The grid **switches to a single column** on smaller screens (`≤ 768px`).  

✅ **Code Implementation:**  
```css
@media (max-width: 768px) {
    .grid {
        grid-template-columns: 1fr;
    }
}
```
📌 **How does this help?**  
- Ensures **optimal readability** on smaller screens.  
- Prevents **layout breaking** by making elements stack neatly.  

---

### **3️⃣ Consistent Spacing & Alignment**  
✔ **Spacing between items:** `gap: var(--spacing-lg);`  
✔ **Inner padding & structured alignment for cards.**  

✅ **Code Implementation:**  
```css
.card {
    padding: var(--spacing-md);
    border-radius: var(--border-radius);
    transition: all 0.3s ease-in-out;
}
```
📌 **Why does this matter?**  
- Maintains **visual consistency** across devices.  
- Provides **clear separation** between items.  

---

## **📂 Folder Structure**  
```
/project-root
│── /assets                  # Images used in cards
│── index.html               # HTML file
│── styles.css               # CSS file
│── README.md                # Documentation (this file)
```

---

## **🚀 How to Run the Project?**  
1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/responsive-grid.git
   cd responsive-grid
   ```
2. **Open `index.html` in a browser.**  
3. Modify `styles.css` as needed for customization.  

---

## **📌 Conclusion**  
✔ **Task 3 was naturally implemented during Task 2** due to a well-structured design.  
✔ **Demonstrates the importance of reusable, scalable layouts.**  
✔ **Grid-based approach ensures responsiveness across all devices.**  

Moving forward, this approach can be applied to more complex layouts without needing major changes. 🚀  

---