

# 📜 Infinite Scrolling Content Loader  

## 📝 Overview  
This project implements an **infinite scrolling mechanism** that dynamically loads new content as the user scrolls toward the bottom of the page. It simulates fetching data asynchronously and appends new elements to the page for a seamless user experience.  

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-9/index.html)

## 🚀 Features  
- Detects when the user is near the bottom of the page.  
- Fetches new content asynchronously using the `Fetch API` (simulated with a function).  
- Dynamically appends new content without reloading the page.  
- Ensures smooth performance with loading indicators and request throttling.  

## 🛠️ Implementation  

### 1️⃣ Detecting Scroll Position  
The `handleScroll` function continuously checks if the user has scrolled near the bottom.  

```js
const { scrollTop, clientHeight, scrollHeight } = document.documentElement;
if (scrollTop + clientHeight >= scrollHeight - 100 && !isLoading) {
    loadMoreContent();
}
```  

### 2️⃣ Fetching Data Asynchronously  
Instead of making real API calls, a **mock function** (`getRandomImage()`) simulates fetching an image after a delay.  

```js
export const getRandomImage = () => {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve({ imageUrl: `https://picsum.photos/400/300?random=${Math.random()}` });
        }, 1000);
    });
};
```  

### 3️⃣ Dynamically Loading Content  
New content is appended to the page in the form of **image cards**, styled using CSS.  

```js
const loadMoreContent = async () => {
    isLoading = true;
    loadingIndicator.style.display = 'block';

    try {
        const newImage = await getRandomImage();
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `<img src="${newImage.imageUrl}" class="card-image" alt="Random image">`;
        contentGrid.appendChild(card);
    } catch (error) {
        console.error('Error loading content:', error);
    } finally {
        isLoading = false;
        loadingIndicator.style.display = 'none';
    }
};
```  

### 4️⃣ Initial Content & Event Listener  
- Initially loads **8 images** when the page loads.  
- Listens for the scroll event to trigger additional content loading.  

```js
for (let i = 0; i < 8; i++) {
    loadMoreContent();
}
window.addEventListener('scroll', handleScroll);
```  

## 🎨 UI & Styling  
The design follows a **modern glassmorphism theme** with smooth hover effects and responsive grid layouts.  

---