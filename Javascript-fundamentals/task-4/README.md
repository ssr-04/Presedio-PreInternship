# 🌦️ Weather App with API Integration  

## 📌 Overview  

The **Weather App** allows users to **fetch real-time weather data** by entering a city name. It integrates with the **OpenWeatherMap API** to retrieve **temperature, humidity, wind speed, and other weather conditions**. The background dynamically changes based on the weather conditions.  

---

## ✅ How the Code Meets the Task Requirements  

| **Task Requirement** | **Implementation in Code** |  
|----------------------|---------------------------|  
| **Use the Fetch API to retrieve weather data** | `getCoords(city)` fetches coordinates, then `getWeather(lat, lon)` fetches weather data from OpenWeatherMap API. |  
| **Parse the JSON response and update the DOM** | `displayResults(data)` extracts data and dynamically updates the UI. |  
| **Implement error handling for invalid input or failed requests** | Custom `showToast()` displays error messages for API failures, invalid inputs, or empty responses. |  
| **Dynamic background changes** | `bgImage.src = ./assets/${main}.gif;` updates the background based on weather. |  
| **Efficient UI updates** | Uses **loops** to dynamically update weather details instead of hardcoding. |  

---

## 🛠️ Technologies Used  

- **HTML** – Structure of the application.  
- **CSS** – Styling and layout, including animations.  
- **JavaScript (ES6 Modules)** – Fetching weather data, DOM manipulation, and event handling.  
- **OpenWeatherMap API** – Provides weather data.  
- **Custom Toast Notifications** – Displays error/success messages.  

---

## 🔧 Setup & API Key  

⚠️ **Security Best Practice:** The API key is **not included** in the code. Users must manually set it.  

### **Steps to Set Up the API Key**  
1. **Get an API key** from [OpenWeatherMap](https://openweathermap.org/api).  
2. **Store it in `localStorage`** before running the app:  
   ```js
   localStorage.setItem('weatherApiKey', 'YOUR_API_KEY_HERE');
   ```
3. The app will **automatically retrieve** the key from `localStorage`.  

---

## 📝 Code Explanation  

### **🔹 HTML (`index.html`)**
- **User Input** – Input box (`#city-input`) for users to enter city names.  
- **Search Button** – Triggers weather retrieval (`#search-btn`).  
- **Dynamic Weather Display** – Grid layout with three cards (`#card1`, `#card2`, `#card3`) for weather details.  

```html
<input type="text" id="city-input" maxlength="20" placeholder="Enter the city..">
<button id="search-btn">Search</button>
<div class="results" id="results">
    <h2 id="city-name"></h2>
    <h3 id="weather-description"></h3>
    <div class="grid-container">
        <div class="grid">
            <div class="card" id="card1"></div>
            <div class="card" id="card2"></div>
            <div class="card" id="card3"></div>
        </div>
    </div>
</div>
```
---

### **🔹 CSS (`styles.css`)**
- **Dark-themed UI** with gradient backgrounds.  
- **Background GIF updates dynamically** based on weather.  
- **Smooth transitions for weather results (`.results.active`).**  
- **Hover effects** for weather cards (`.card:hover`).  

```css
.bg-overlay img {
    position: absolute; 
    min-width: 100%; 
    min-height: 100%; 
    object-fit: cover; 
    opacity: 0.4;
}
.results {
    opacity: 0;
    visibility: hidden;
    transform: scale(0.8);
    transition: all 0.4s ease-in;
}
.results.active {
    opacity: 1;
    visibility: visible;
    transform: scale(1);
}
```
---

### **🔹 JavaScript (`script.js`)**
Handles API requests, **error handling**, **input validation**, and **DOM updates**.

#### ✅ **1. Fetching Weather Data**
- **Step 1:** Convert city name to coordinates using **Geocoding API**.  
- **Step 2:** Fetch weather details using **Weather API**.  

```js
const getCoords = async(city) => {
    try {
        const response = await fetch(`https://api.openweathermap.org/geo/1.0/direct?q=${encodeURIComponent(city)}&limit=1&appid=${apiKey}`);
        if (!response.ok) throw new Error("Failed to fetch coordinates");
        const data = await response.json();
        return data.length ? data[0] : null;
    } catch (error) {
        showToast("Invalid city name!", "error");
    }
};

const getWeather = async(lat, lon) => {
    try {
        const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=metric`);
        if (!response.ok) throw new Error("Failed to fetch weather");
        return await response.json();
    } catch (error) {
        showToast("Weather data unavailable!", "error");
    }
};
```
---

#### ✅ **2. Handling User Input & Validation**
- **Ensures valid city names (`A-Z` and spaces only, min 3 characters).**  
- **Calls `getCoords()` and `getWeather()` after validation.**  

```js
const validateInput = (city) => /^[A-Za-z ]{3,}$/.test(city);
searchBtn.addEventListener('click', async () => {
    let city = searchInput.value.trim();
    if (!validateInput(city)) return showToast("Invalid input!", "error");

    const response = await getCoords(city);
    if (response) displayResults(await getWeather(response.lat, response.lon));
});
```
---

#### ✅ **3. Updating the UI with Weather Data**
- **Uses arrays & loops** to dynamically generate content.  
- **Updates background image based on weather conditions.**  

```js
const displayResults = (data) => {
    const { lat, lon } = data.coord;
    const { main, description } = data.weather[0];
    const { temp, feels_like, temp_min, temp_max, pressure, humidity } = data.main;
    const { speed } = data.wind;
    const { name, visibility } = data;

    bgImage.src = `./assets/${main}.gif`;
    cityName.innerHTML = name;
    weatherDescription.innerHTML = `It feels like ${description}`;

    const details = [
        { card: card1, title: 'Co-ordinates', content: [{parameter: 'Latitude', value: lat}, {parameter: 'Longitude', value: lon}] },
        { card: card2, title: 'Temperature', content: [{parameter: 'Real temp', value: temp}, {parameter: 'Feels like', value: feels_like}, {parameter: 'Minimum', value: temp_min}, {parameter: 'Maximum', value: temp_max}] },
        { card: card3, title: 'Others', content: [{parameter: 'Pressure', value: pressure}, {parameter: 'Humidity', value: humidity}, {parameter: 'Wind', value: speed}, {parameter: 'Visibility', value: visibility}] }
    ];

    details.forEach(({ card, title, content }) => {
        card.innerHTML = `<h3>${title}</h3>`;
        content.forEach(({ parameter, value }) => {
            let p = document.createElement('p');
            p.textContent = `${parameter}: ${value}`;
            card.appendChild(p);
        });
    });

    results.classList.add('active');
};
```
---

### **🔹 Custom Toast Notifications (`toast.js`)**
Displays **alerts for errors, warnings, and success messages**.

```js
export const showToast = (message, type = 'success') => {
    const toast = document.createElement('div');
    toast.textContent = message;
    toast.style.position = 'fixed';
    toast.style.top = '20px';
    toast.style.left = '50%';
    toast.style.transform = 'translateX(-50%)';
    toast.style.padding = '15px 20px';
    toast.style.borderRadius = '5px';
    toast.style.zIndex = '9999';
    toast.style.transition = 'opacity 0.3s ease-in-out';
    toast.style.backgroundColor = type === 'error' ? '#f44336' : type === 'warning' ? '#ff9800' : '#4CAF50';
    document.body.appendChild(toast);

    setTimeout(() => { toast.style.opacity = '0'; setTimeout(() => document.body.removeChild(toast), 300); }, 2000);
};
```
---

## ✅ **Conclusion**
This **Weather App fully meets the task requirements**, integrating **fetch API, dynamic UI updates, input validation, error handling, and toast notifications** for an enhanced user experience. 🚀

---