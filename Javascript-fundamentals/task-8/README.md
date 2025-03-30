
# **Single-Page Application (SPA) with Hash-based Routing**  

## **Overview**  
This project demonstrates a **Single-Page Application (SPA) with hash-based routing** using **vanilla JavaScript, HTML, and CSS**. The application dynamically updates content based on the URL hash, allowing seamless navigation between different views **without reloading the page**.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-8/index.html)

## **Features**  
✅ **Hash-based Routing:** Uses `window.onhashchange` to detect route changes.  
✅ **Dynamic Content Loading:** Pages update without a full-page refresh.  
✅ **Active Navigation Highlighting:** The selected menu item updates automatically.  
✅ **State Persistence:** A counter value remains even when switching views.  
✅ **Smooth Transitions:** Animated page changes for a better user experience.  
✅ **Responsive Design:** Fully functional across all screen sizes.  

## **Project Structure**  
```
/spa-hash-routing  
│── index.html        # Main application file  
│── styles.css        # Styling for UI/UX  
│── script.js         # Handles routing and state logic  
└── README.md         # Project documentation  
```

## **Implementation Details**  

### **1️⃣ Routing Mechanism**  
- The app listens to `window.onhashchange` to detect URL hash changes.  
- Based on the hash (`#home`, `#about`, `#features`, etc.), the corresponding content section is displayed.  
- The `active` class is dynamically applied to the selected menu item.  

### **2️⃣ Page Navigation**  
- Clicking on a menu link updates the hash (`#home`, `#about`, etc.).  
- The app then displays the relevant section while hiding others.  

### **3️⃣ Counter with State Persistence**  
- The **Counter Page** demonstrates state persistence within the app.  
- The counter value is **maintained** even when navigating between pages, showcasing how SPAs can handle UI state.  

## **How to Use**  
1️⃣ Open `index.html` in a browser.  
2️⃣ Click on navigation links to move between different views.  
3️⃣ Try increasing/decreasing the counter on the **Counter Page** and switch views to see its state persistence.  

## **Tech Stack**  
🔹 HTML5  
🔹 CSS3  
🔹 JavaScript (Vanilla)  

## **Conclusion**  
This project showcases a fundamental **hash-based routing system in a SPA** without relying on external frameworks. It provides a **smooth user experience**, **state persistence**, and an easy-to-maintain structure for small-scale web applications. 🚀  

---