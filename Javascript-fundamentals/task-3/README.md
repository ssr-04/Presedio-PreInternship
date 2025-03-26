

# 🖼️ Image Gallery Lightbox  

## 📌 Overview  

The **Image Gallery Lightbox** is a web-based gallery that allows users to **click on a thumbnail to view a larger image in a modal (lightbox overlay)**. Users can navigate between images using **left (`<`) and right (`>`) buttons**, as well as **keyboard controls (`ArrowLeft`, `ArrowRight`, and `Escape`)**.  

This project demonstrates **JavaScript fundamentals**, including **event listeners, dynamic content updates, and CSS-based transitions**.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-3/index.html)

---

## ✅ How the Code Meets the Task Requirements  

| **Task Requirement**                                        | **Implementation in Code** |
|-------------------------------------------------------------|----------------------------|
| **Use event listeners to detect when a thumbnail is clicked.** | Each `.thumbnail` has an `addEventListener` for `click`, which updates the modal with the selected image. |
| **Dynamically update the modal content with the selected image.** | Clicking a thumbnail updates `modalImage.src` with the `data-fullsize` value of the clicked image. |
| **Toggle CSS classes to show/hide the modal and add transitions for smooth effects.** | The modal opens by adding the `.active` class and closes by removing it. CSS transitions ensure smooth fading effects. |

---

## 📝 Code Explanation  

### **🔹 HTML (`index.html`)**
The HTML structure consists of:  
- A **gallery section** with multiple **thumbnail images**.  
- A **modal overlay** that appears when a thumbnail is clicked.  
- **Navigation buttons** (`<`, `>`, `X`) inside the modal for image control.  

#### **🔹 Key Snippet**
```html
<img src="https://picsum.photos/id/11/300" class="thumbnail" data-fullsize="https://picsum.photos/id/11/800" alt="Image 1">
```
- The `data-fullsize` attribute stores the **larger version** of the image.  

---

### **🔹 CSS (`styles.css`)**
- The **gallery layout** uses a **CSS grid** for responsiveness.  
- The **modal overlay** uses `opacity` and `visibility` to smoothly **appear/disappear**.  
- **Button styles** ensure a **user-friendly navigation experience**.  

#### **🔹 Key Snippet**
```css
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
}
.modal-overlay.active {
    opacity: 1;
    visibility: visible;
}
```
- The `.active` class **toggles the modal's visibility smoothly**.  

---

### **🔹 JavaScript (`script.js`)**
The **JavaScript file handles modal interactions** and **image navigation**.  

#### ✅ **1. Opening the Modal**  
```js
thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', () => {
        const fullSizeSrc = thumbnail.dataset.fullsize;
        modalImage.src = fullSizeSrc;
        modalOverlay.idx = index;
        modalOverlay.classList.add('active');
    });
});
```
- Clicking a thumbnail **updates the modal image** and **opens the overlay**.  

---

#### ✅ **2. Closing the Modal**  
```js
const closeModal = () => {
    modalOverlay.classList.remove('active');
};
closeBtn.addEventListener('click', closeModal);
modalOverlay.addEventListener('click', (e) => {
    if (e.target === modalOverlay) closeModal();
});
```
- Clicking the **"X" button** or outside the modal **closes the lightbox**.  

---

#### ✅ **3. Navigating Between Images (`<` and `>`)**  
```js
const moveRight = () => {
    let newIdx = (modalOverlay.idx + 1) % count;
    modalOverlay.idx = newIdx;
    modalImage.src = thumbnails[newIdx].dataset.fullsize;
};
rightBtn.addEventListener('click', moveRight);
```
- Clicking **`>` moves to the next image**, wrapping around when at the last image.  
- **`moveLeft()`** works similarly, but moves **backward (`<`)**.  

---

#### ✅ **4. Keyboard Support**  
```js
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && modalOverlay.classList.contains('active')) {
        closeModal();
    }
    if (modalOverlay.classList.contains('active')) {
        if (e.key === 'ArrowRight') {
            moveRight();
        } else if (e.key === 'ArrowLeft') {
            moveLeft();
        }
    }
});
```
- **Escape (`Esc`) closes the modal**.  
- **Arrow Keys (`←`, `→`) navigate images** inside the lightbox.  

---

## ✅ **Conclusion**  
This project meets all the given requirements by implementing a fully functional **image gallery lightbox** using **DOM manipulation**, **CSS transitions**, and **event handling**. Users can **click on images, navigate using buttons, and control the lightbox using keyboard shortcuts** for a smooth experience. 🚀

---