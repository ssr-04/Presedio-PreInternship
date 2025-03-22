

---

# **Pure CSS Dropdown Menu**  

## **📌 Overview**  
This project implements a **CSS-only dropdown navigation menu**, meeting the requirements of **Task 4: Pure CSS Dropdown Menu**. The menu includes:  
✔ A **nested structure using `<ul>` elements** for the menu and submenu.  
✔ A **hover-based dropdown** using `:hover` and smooth transitions.  
✔ A **mobile-friendly fallback** using checkboxes to toggle submenus.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-4/index.html)

---

## **🎯 Task Objectives & How They Are Achieved**  

### **1️⃣ Uses Nested `<ul>` for Menu & Submenu**  
✅ The dropdown structure follows **semantic HTML** with `<ul>` and `<li>` elements.  
✅ Each **submenu is placed inside a parent `<li>`**, making it **hierarchical and accessible**.  

✅ **Code Implementation:**  
```html
<ul class="nav-links">
    <li>
        <a href="#Mobile">Mobile</a>
        <ul class="submenu">
            <li><a href="#Xiaomi">Xiaomi Series</a></li>
            <li><a href="#Redmi">Redmi Series</a></li>
            <li><a href="#Poco">Poco Series</a></li>
        </ul>
    </li>
</ul>
```
📌 **Why is this important?**  
- Ensures **a clear hierarchy** for styling and navigation.  
- **Improves SEO & accessibility** by maintaining structured data.  

---

### **2️⃣ Smooth Reveal Using `:hover` & Transitions**  
✅ The submenu appears **on hover**, and a smooth transition makes the effect more elegant.  
✅ Uses **CSS opacity and transitions** for a **smooth appearance/disappearance**.  

✅ **Code Implementation:**  
```css
nav ul ul {
    display: none;
    position: absolute;
    background-color: #444;
    min-width: 150px;
    z-index: 1;
    flex-direction: column;
    gap: 0.2rem;
    opacity: 0;
    transition: opacity 0.3s ease;
}

nav li:hover > ul {
    display: flex;
    opacity: 1;
}
```
📌 **Why does this work well?**  
- `display: none; opacity: 0;` **keeps the submenu hidden** initially.  
- When the user **hovers over the parent menu**, `display: flex; opacity: 1;` **reveals the submenu**.  
- The `transition: opacity 0.3s ease;` **adds a smooth fade-in effect**.  

---

### **3️⃣ Mobile-Friendly Fallback Using Checkboxes**  
✅ On **mobile**, the hover-based dropdown **won’t work well** due to lack of hover interactions.  
✅ Instead, a **checkbox-based toggle system** is used to open submenus.  
✅ Clicking on a submenu label (`+`) **toggles the visibility of the submenu**.  

✅ **Code Implementation:**  
```html
<input type="checkbox" id="toggle-mobile" class="submenu-toggle">
<label for="toggle-mobile" class="submenu-label">+</label>
<ul class="submenu">
    <li><a href="#Xiaomi">Xiaomi Series</a></li>
    <li><a href="#Redmi">Redmi Series</a></li>
    <li><a href="#Poco">Poco Series</a></li>
</ul>
```
✅ **CSS for Functionality:**  
```css
/* Hide checkboxes */
.nav-links li input.submenu-toggle {
    display: none;
}

/* Display submenu when checkbox is checked */
.nav-links li input.submenu-toggle:checked + .submenu-label + .submenu {
    display: flex;
}
```
📌 **Why is this necessary?**  
- **Touchscreens don’t support hover-based menus**, so a click-based solution is needed.  
- This **checkbox-based method keeps it CSS-only** (no JavaScript required!).  
- The submenu **stays open until the user clicks again**, improving usability.  

---

### **4️⃣ Responsive Navigation (Mobile Support)**  
✅ The **hamburger menu** (`.hamburger`) makes navigation cleaner on small screens.  
✅ Uses **CSS media queries** to adjust the layout.  

✅ **Code Implementation:**  
```css
@media (max-width: 768px) {
    .nav-links {
        display: none;
        flex-direction: column;
    }

    #nav-menu:target .nav-links {
        display: flex;
    }
}
```
📌 **Why does this matter?**  
- **Prevents overcrowding on small screens** by stacking menu items vertically.  
- **Ensures navigation remains accessible** on both large and small devices.  

---

## **📂 Folder Structure**  
```
/project-root
│── index.html         # HTML file
│── styles.css         # CSS file
│── README.md          # Documentation
```

---

## **🚀 How to Run the Project?**  
1. **Clone the repository**  
2. **Open `index.html` in a browser.**  
3. Modify `styles.css` as needed for customization.  

---

## **📌 Conclusion**  
✔ **Task 4 is successfully completed with a functional, responsive dropdown menu.**  
✔ **The hover effect and transitions ensure a smooth UI.**  
✔ **The mobile-friendly fallback improves accessibility on touch devices.**  
✔ **A pure CSS solution ensures lightweight performance without JavaScript.**  

---