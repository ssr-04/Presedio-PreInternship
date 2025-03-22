
# **CSS Card Component with Hover Effects**  

## **📌 Objective**  
This project fulfills the objective of **Task 2: CSS Card Component with Hover Effects** by creating a **visually appealing card layout** that includes:  
- An **image**,  
- A **title**, and  
- A **description**,  
along with **hover effects, shadows, and responsive design**.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/HTML_CSS/task-2/index.html)

---

## **📑 Meeting Task Requirements**  

### **1️⃣ Card Layout with Image, Title, and Description**  
✅ Each card contains:  
- **An image** representing a person.  
- **A title (`<h2>`)** with the person’s name.  
- **A description (`<p>`)** featuring an inspirational quote.  

✔ **Code Implementation:**  
```html
<div class="card">
    <img src="./assets/elon-musk.webp" height="150" width="150" alt="Elon Musk">
    <h2>Elon Musk</h2>
    <p>People work better when they know what the goal is and why...</p>
</div>
```
📌 **How it satisfies the requirement?**  
- **Uses semantic HTML** (`<h2>`, `<p>`, `<img>`) for accessibility and SEO.  
- **Encapsulates elements in a `.card` container**, making it easy to style and reuse.  

---

### **2️⃣ Styling the Card with Borders, Shadows, and Padding**  
✅ The card has:  
- **A background color:** `var(--card-bg)`.  
- **Padding (`padding: var(--spacing-md);`)** for spacing inside the card.  
- **Border-radius (`border-radius: var(--border-radius);`)** for smooth edges.  
- **Box-shadow on hover (`box-shadow: 1px 1px 20px var(--accent-secondary);`)** for an elegant glow effect.  

✔ **Code Implementation:**  
```css
.card {
    background: var(--card-bg);
    padding: var(--spacing-md);
    border-radius: var(--border-radius);
    opacity: 70%;
    transition: all 1s ease;
}
```
📌 **How it satisfies the requirement?**  
- **Adds a shadow & smooth edges** for a modern appearance.  
- **Padding improves readability & structure.**  

---

### **3️⃣ Hover Effect with Smooth Transitions**  
✅ The card reacts to **user interaction** by:  
- **Increasing opacity from 70% to 100%.**  
- **Scaling up (`scale(1.1)`) and shifting upwards (`translateY(-3px)`).**  
- **Applying a glowing border (`box-shadow`).**  

✔ **Code Implementation:**  
```css
.card:hover {
    opacity: 100%;
    transform: translateY(-3px) scale(1.1);
    box-shadow: 1px 1px 20px var(--accent-secondary);
}
```
📌 **How it satisfies the requirement?**  
- **Creates a smooth, engaging hover effect.**  
- **Enhances visibility & interactivity.**  

---

### **4️⃣ Responsive Design (Media Queries for Mobile View)**  
✅ Uses **CSS Grid** to ensure:  
- **Dynamic card arrangement** (`grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));`).  
- **Mobile optimization** (`@media (max-width: 768px) { .grid { grid-template-columns: 1fr; } }`).  

✔ **Code Implementation:**  
```css
@media (max-width: 768px) {
    .grid {
        grid-template-columns: 1fr;
    }
}
```
📌 **How it satisfies the requirement?**  
- **Ensures cards adjust for different screen sizes.**  
- **Improves user experience on mobile devices.**  

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
   git clone https://github.com/your-username/css-card-hover.git
   cd css-card-hover
   ```
2. **Open `index.html` in a browser.**  
3. (Optional) Modify `styles.css` to customize colors and fonts.  

---

## **✅ Final Notes**  
✔ **This project follows best coding practices,** including semantic HTML, CSS variables, and responsive design.  
✔ **The hover effect enhances interactivity,** making the UI more engaging.  
✔ **Mobile responsiveness ensures accessibility across devices.**  


---