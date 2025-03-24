# 📄 **CSS-Only Multi-Page Website Simulator**  

## 📌 **Overview**  
This project implements a **multi-page website simulator** using only **HTML and CSS**, without any JavaScript. It enables seamless navigation between different sections, simulating a **multi-page experience** using the `:target` pseudo-class. The site also features **smooth transitions, a responsive navigation menu, and structured content layouts** using **CSS Grid and Flexbox**.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-10/index.html)

---

## 🎯 **Task Requirements & How They Are Fulfilled**  

### ✅ **1. Use `:target` to Display and Hide Sections**  
🔹 The `:target` pseudo-class is used to **show** the selected section while **hiding** others.  
🔹 The **home section is visible by default**. When a different section is targeted (e.g., `#about`), it becomes **active** while the home section disappears.  

📌 **Implementation:**  
```css
.page {
    display: none;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.page:target {
    display: block;
    opacity: 1;
    position: relative;
}

/* Hide home section when another section is targeted */
body:has(.page:target) #home {
    display: none;
    opacity: 0;
}
```
🎯 **Effect:**  
- **Users navigate seamlessly** between sections without JavaScript.  
- **Only one section is displayed at a time**, ensuring a clean UI.  
- **Smooth fading transitions** improve the experience.  

---

### ✅ **2. CSS Transitions & Animations for Page Changes**  
🔹 **CSS transitions (`opacity` and `position`)** ensure smooth page visibility changes.  
🔹 **No abrupt flashing** when switching sections.  

📌 **Implementation:**  
```css
.page {
    display: none;
    opacity: 0;
    transition: opacity 0.3s ease-in-out;
}

.page:target {
    display: block;
    opacity: 1;
    position: relative;
}
```
🎯 **Effect:**  
- Sections **fade in and out smoothly** when navigating between pages.  

---

### ✅ **3. Responsive Navigation Menu**  
🔹 The **desktop menu** is a standard horizontal navigation bar.  
🔹 The **mobile menu** is implemented using a **hamburger icon**, which expands via `:target`.  

📌 **Implementation:**  
```css
/* Desktop Navigation */
.nav-container {
    position: fixed;
    top: 0;
    width: 100%;
    background: #333;
    padding: 1rem;
    display: flex;
    justify-content: center;
    z-index: 100;
}

/* Mobile Navigation */
.hamburger {
    display: none;
    font-size: 2rem;
    position: absolute;
    left: 1rem;
    top: 1rem;
    color: white;
}

/* Mobile Menu using :target */
#menu:target {
    display: block;
    position: fixed;
    background: rgba(0, 0, 0, 0.8);
    z-index: 200;
}
```
🎯 **Effect:**  
- **On mobile, the navigation is hidden** and only appears when the hamburger icon is clicked.  
- The **fullscreen mobile menu opens using `:target`**, and a close button allows users to exit the menu.  

---

### ✅ **4. Responsive Layout Using Grid & Flexbox**  
🔹 **CSS Grid** is used to structure content sections.  
🔹 **Flexbox** ensures **proper spacing and alignment** of elements.  

📌 **Implementation (Grid for structured layouts):**  
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1rem;
    text-align: center;
}
```
🎯 **Effect:**  
- **Ensures content is structured properly** on different screen sizes.  
- **Elements align dynamically** based on available space.  

📌 **Implementation (Flexbox for spacing and alignment):**  
```css
.content-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}
```
🎯 **Effect:**  
- **Text and sections remain well-aligned** across devices.  
- **Consistent spacing** makes navigation intuitive.  

---

### ✅ **5. Fully Responsive Design**  
🔹 The site **adapts to different screen sizes** using `@media` queries.  
🔹 The **mobile experience is optimized** with a hamburger menu and a structured grid layout.  

📌 **Implementation:**  
```css
@media (max-width: 768px) {
    .nav-menu {
        display: none;
    }

    .hamburger {
        display: block;
    }
}
```
🎯 **Effect:**  
- **Mobile-friendly navigation and layouts.**  
- **Optimized user experience across devices.**  

---

## 🏗 **Project Structure**  

📁 **Project Files:**  
```
/project-folder
│── index.html          # Main HTML file
│── styles.css          # Main CSS file
```

📌 **Key Sections in `index.html`:**  
- **`<nav>`** → Navigation bar (desktop and mobile).  
- **`<section>`** → Each page section (`#home`, `#about`, etc.).  
- **`:target` pseudo-class** → Used for page transitions.  
 

---

## 🚀 **Final Thoughts**  
✅ **Successfully implemented a fully functional multi-page website simulator** **without JavaScript**.  
✅ **All requirements are satisfied** using `:target`, CSS animations, Grid, and Flexbox.  
✅ **The site is responsive, visually appealing, and practical** for demonstrating CSS-only navigation.  

---