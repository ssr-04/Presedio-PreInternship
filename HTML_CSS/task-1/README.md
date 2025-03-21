

# **Static Webpage Layout - Portfolio**  

## **📌 Objective**  
This project fulfills the objective of **Task 1: Static Webpage Layout** by implementing a **single-page website** using **semantic HTML** elements and CSS for styling, spacing, and responsiveness.  

## **📑 Project Breakdown (Satisfying Task Requirements)**  

### **1️⃣ Semantic HTML Structure**  
✅ Uses `<header>`, `<nav>`, `<main>`, and `<footer>` to create a meaningful document structure.  
✅ Organizes content into distinct sections like **About, Skills, Education, Projects, Experience, and Certifications** using `<section>`.  
✅ Implements `<section>` and `<div>` where needed to structure elements logically.  

### **Code Example:**  
```html
<header>
  <div class="container">
    <h1>Sachin M Sabariram</h1>
    <p>AI & Data Science Enthusiast</p>
  </div>
</header>

<nav>
  <ul class="nav-links">
    <li><a href="#about">About</a></li>
    <li><a href="#skills">Skills</a></li>
    <li><a href="#projects">Projects</a></li>
  </ul>
</nav>

<main>
  <section id="about">
    <h2>About Me</h2>
    <p>I am an AI and Data Science enthusiast passionate about Generative AI, LLM, and Computer Vision.</p>
  </section>
</main>

<footer>
  <p>&copy; 2025 Sachin M Sabariram. All rights reserved.</p>
</footer>
```
📌 **How it satisfies the requirement?**  
- The structure is **semantic**, improving accessibility and SEO.  
- Uses **meaningful tags** instead of generic `<div>` containers where possible.  

---

### **2️⃣ Basic CSS Styling for Typography & Colors**  
✅ Uses **CSS variables** (`:root`) to define a consistent **dark theme** with gradient effects.  
✅ Defines **typography styles** for headings, paragraphs, and links.  
✅ Implements hover effects for **better user interaction**.  

### **Code Example:**  
```css
:root {
  --bg-primary: #0f1115;
  --text-primary: #f0f0f0;
  --accent-primary: #7928ca;
}

body {
  font-family: 'Inter', sans-serif;
  background: var(--bg-primary);
  color: var(--text-primary);
}

h1 {
  font-size: 3rem;
  background: linear-gradient(90deg, var(--accent-primary), var(--accent-secondary));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
```
📌 **How it satisfies the requirement?**  
- Ensures **consistent typography** across the site.  
- Uses **CSS variables** to manage colors efficiently.  
- Enhances **modern design** with gradients.  

---

### **3️⃣ CSS Spacing (Margins & Paddings)**  
✅ Applies **consistent spacing** for better readability using CSS variables.  
✅ Uses **padding for inner spacing** and **margins for outer spacing** to create a structured layout.  

### **Code Example:**  
```css
:root {
  --spacing-md: 1rem;
  --spacing-lg: 2rem;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--spacing-lg);
}

h2 {
  margin-top: var(--spacing-lg);
  padding-bottom: var(--spacing-md);
  border-bottom: 2px solid var(--accent-primary);
}
```
📌 **How it satisfies the requirement?**  
- Ensures **uniform spacing** across the website.  
- Improves **readability & visual hierarchy**.  

---

### **4️⃣ Responsive Design (Media Queries)**  
✅ Uses **media queries** to adjust layouts for different screen sizes.  
✅ Implements a **hamburger menu** for better mobile navigation.  
✅ Adjusts **font sizes, grid layouts, and element positions** dynamically.  

### **Code Example:**  
```css
@media (max-width: 768px) {
  .nav-links {
    flex-direction: column;
    align-items: center;
  }
}

@media (max-width: 480px) {
  h1 {
    font-size: 1.8rem;
  }

  .container {
    padding: 0 var(--spacing-md);
  }
}
```
📌 **How it satisfies the requirement?**  
- Ensures **optimal readability & usability** on smaller screens.  
- Modifies **layout dynamically** without affecting desktop experience.  

---

## **⚡ Other Important Aspects of the Code**  
### **🔹 Navigation Bar with Responsive Hamburger Menu**  
- By default, the **navigation menu is hidden on mobile** and toggled via a menu button (`#nav-menu:target .nav-links`).  

### **🔹 Grid-Based Layout for Project Cards**  
- Uses `grid-template-columns` for a **flexible project showcase layout**.  

### **🔹 Hover & Interactive Effects**  
- Buttons, links, and cards **change color & position on hover** to enhance **user engagement**.  

---

## **🚀 How to Run the Project?**  
1. **Clone the repository**  
   ```bash
   git clone https://github.com/ssr-04/portfolio.git
   cd portfolio
   ```
2. **Open `index.html` in a browser.**  
3. (Optional) Modify `styles.css` to customize colors and fonts.  

---