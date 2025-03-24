## **Task 9: Complex Responsive Layout with Grid and Flexbox**  

### **Overview**  
This task required designing a sophisticated webpage layout using **CSS Grid** and **Flexbox** while implementing features such as:  
- A **sticky header or sidebar**  
- **Overlapping elements** using `position` and `z-index`  
- **Dynamic reordering** for different screen sizes  

However, instead of building a new demonstration from scratch, we realized that our **portfolio website already satisfies these requirements**. Therefore, we are using the same portfolio to demonstrate the implementation of Task-9.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-9/index.html)

---

## **How Our Portfolio Fulfills Task-9**  

### ✅ **1. Sticky Header (Navigation Bar)**
The **navigation bar (`nav`) is sticky**, ensuring it stays visible as the user scrolls down.  
📌 **Implementation:**  
```css
nav {
    background-color: var(--bg-secondary);
    position: sticky;
    top: 0;
    z-index: 100;
    padding: var(--spacing-md) 0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
```
- The `position: sticky;` makes the navbar stay at the top.
- `z-index: 100;` ensures it appears above other elements.
- A subtle `box-shadow` enhances visibility when scrolling.  

💡 **Effect:** Users can navigate the website easily without scrolling back up.  

---

### ✅ **2. CSS Grid for Page Layout**
We use **CSS Grid** to structure the layout for different sections, ensuring a well-organized, responsive design.  
📌 **Implementation in Project & Certification Sections:**  
```css
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: var(--spacing-lg);
}
```
- `display: grid;` enables grid-based layout.  
- `grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));` creates **responsive** columns.  
- `gap: var(--spacing-lg);` provides uniform spacing between grid items.  

💡 **Effect:**  
- In **desktop view**, multiple items are arranged in a **grid with multiple columns**.  
- In **mobile view**, the grid **stacks into a single column**.  

---

### ✅ **3. Flexbox for Inner Alignment & Spacing**  
**Flexbox** is used to manage spacing and alignment in key sections like:  
- **Header (Profile & Contact Info)**
- **Navigation Links**
- **Skills Section (Skill Categories & Lists)**  

📌 **Example: Centering Contact Info with Flexbox**  
```css
.contact-info {
    display: flex;
    justify-content: center;
    gap: var(--spacing-md);
    flex-wrap: wrap;
}
```
- `display: flex;` ensures items align horizontally.  
- `justify-content: center;` keeps items centered.  
- `flex-wrap: wrap;` ensures responsiveness (items stack on smaller screens).  

💡 **Effect:**  
- Contact info aligns **horizontally on larger screens** and **stacks vertically on smaller screens**.  

---

### ✅ **4. Overlapping Elements with `position` & `z-index`**  
Overlapping elements are implemented in the **mobile navigation menu** using `z-index`.  

📌 **Implementation:**  
```css
/* Hide the nav-links by default */
#nav-menu .nav-links {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    z-index: 50;
    background: var(--bg-secondary);
    padding: var(--spacing-md);
}

/* Display the nav-links when the menu is targeted */
#nav-menu:target .nav-links {
    display: flex;
    flex-direction: column;
    gap: var(--spacing-md);
}
```
- `position: absolute;` positions the navigation **overlapping** the content.  
- `z-index: 50;` ensures it **appears above other elements**.  
- The **menu expands when clicked** due to the `:target` selector.  

💡 **Effect:** The **mobile navigation overlaps** the content while keeping the layout clean.  

---

### ✅ **5. Dynamic Reordering Based on Screen Size**
We handle responsiveness using **media queries**, dynamically rearranging content.  

📌 **Example: Adjusting Layout for Smaller Screens**  
```css
@media (max-width: 768px) {
    .nav-links {
        flex-direction: column;
        align-items: center;
    }

    .grid {
        grid-template-columns: 1fr;
    }

    .timeline-item {
        padding-left: var(--spacing-lg);
    }
}
```
- **Navigation & grid items stack vertically on smaller screens.**  
- **Padding & alignment adjust dynamically for a better user experience.**  

💡 **Effect:**  
- **On desktops:** A **multi-column grid** layout is used.  
- **On mobile screens:** Content **stacks in a single column** for better readability.  

---

## **Conclusion** 🎯  
Instead of creating a new layout from scratch, we **repurpose the portfolio website** as it already **fulfills all Task-9 requirements**:  
✔ **Sticky navbar for persistent navigation**  
✔ **CSS Grid for structured page layout**  
✔ **Flexbox for alignment & spacing**  
✔ **Overlapping elements & z-index control in mobile navbar**  
✔ **Responsive design with dynamic reordering using media queries**  

By leveraging **CSS Grid, Flexbox, and responsive design techniques**, this portfolio **demonstrates a practical and functional implementation** of a **complex layout**. 🚀  

---