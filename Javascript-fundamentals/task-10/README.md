# <i class="fas fa-store"></i> Modern Shop - Full-featured eCommerce Cart Simulation

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![FakeStoreAPI](https://img.shields.io/badge/API-FakeStoreAPI-orange?style=for-the-badge)

A comprehensive eCommerce shopping cart simulation built entirely with Vanilla JavaScript (ES6 Modules), HTML, and CSS. This project demonstrates dynamic product loading, interactive shopping cart functionality, state management with `localStorage`, dynamic price calculations (including taxes and discounts), product filtering/searching, and a modern, responsive dark-themed UI with gradient effects.

Demo live @ [GitHub Pages](https://ssr-04.github.io/Presedio-PreInternship/Javascript-fundamentals/task-10/index.html)

## Objective

To build a comprehensive eCommerce simulation that includes product listings, a shopping cart, and dynamic price calculations using only front-end technologies (HTML, CSS, Vanilla JS) and a public API for product data.

## Features

This project successfully implements all the requirements outlined in the objective:

1.  **Product Listing:**
    *   Dynamically fetches product data (images, descriptions, prices) from the [FakeStoreAPI](https://fakestoreapi.com/).
    *   Prices fetched in USD are converted to **INR (₹)** using a predefined conversion rate (`utils.js`) and displayed accordingly.
    *   Products are displayed in a responsive grid layout.
    *   Product descriptions are truncated using `limitWords` utility for a cleaner look on cards.

2.  **Shopping Cart:**
    *   **Add to Cart:** Users can add products to the cart directly from the product listing. Buttons provide visual feedback ("Added!") upon successful addition.
    *   **View Cart:** A modal window displays the current contents of the shopping cart.
    *   **Quantity Adjustment:** Users can change the quantity of items directly within the cart modal. Input validation prevents non-numeric/negative values and enforces a maximum limit (99). Setting quantity to 0 removes the item.
    *   **Remove Item:** Users can remove individual items from the cart using a dedicated button.
    *   **Empty Cart Handling:** Displays a user-friendly message when the cart is empty.

3.  **State Management:**
    *   The shopping cart's state is managed using Vanilla JavaScript arrays and objects.
    *   The cart data is persisted across browser sessions using the browser's `localStorage` API (`cart.js`).

4.  **Price Calculations:**
    *   **Subtotal:** Dynamically calculated based on item prices and quantities in the cart.
    *   **Tax:** A fixed 10% tax is calculated on the subtotal.
    *   **Discount:** A 5% discount is applied if the subtotal exceeds ₹2000.
    *   **Total:** The final payable amount (Subtotal + Tax - Discount) is calculated and displayed.
    *   All monetary values are formatted as **INR (₹)** using the `Intl.NumberFormat` API (`utils.js`).

5.  **Product Filtering & Search:**
    *   **Category Filtering:** Categories are dynamically fetched from the API and displayed as filter buttons. Users can filter products by clicking these buttons.
    *   **Keyword Search:** A search bar allows users to filter products based on keywords matching product titles or descriptions. Search input is debounced (`utils.js`) for performance optimization.
    *   Filtering and searching can be used concurrently.

6.  **Responsive UI:**
    *   The user interface is fully responsive and adapts to various screen sizes (desktops, tablets, mobiles) using CSS Flexbox, Grid, and media queries.
    *   Features a modern **dark theme** with gradient effects for buttons and headings, defined using CSS variables for easy customization.

7.  **Advanced Concepts:**
    *   **Modular JavaScript:** Code is organized into ES6 modules (`main.js`, `api.js`, `cart.js`, `ui.js`, `utils.js`) for better structure, maintainability, and reusability.
    *   **Asynchronous Operations:** Uses `async/await` with the `fetch` API for handling asynchronous API calls. `Promise.all` is used for parallel data fetching (products & categories).
    *   **Error Handling:** Includes basic error handling for API fetch failures, displaying informative messages to the user. Handles potential errors during `localStorage` parsing.
    *   **Efficient DOM Manipulation:** Utilizes techniques like `DocumentFragment` for batch DOM updates (displaying products, categories, cart items) and event delegation for handling events on dynamic elements, improving performance.
    *   **Utility Functions:** Centralized helper functions (`formatCurrency`, `debounce`, `limitWords`, `convertUSDToINR`) in `utils.js`.

## Technologies Used

*   **HTML5:** Semantic structure for the web page.
*   **CSS3:** Styling the application, implementing the dark theme, gradients, layout (Flexbox/Grid), and responsiveness (Media Queries).
*   **Vanilla JavaScript (ES6+):** Core application logic, DOM manipulation, state management, event handling, API interaction, modules (`import`/`export`), `async/await`.
*   **FakeStoreAPI:** Public REST API used as the data source for products and categories.
*   **Font Awesome:** (Optional) Used for icons in the UI.

## Code Structure Breakdown

*   **`main.js`**: Initializes the application (`initializeShop`), fetches initial data via `api.js`, sets up global state (`allProducts`, `currentProducts`), coordinates interactions between `ui.js` and `cart.js`, and sets up primary event listeners (delegating some setup to `ui.js`). Handles filtering/search logic.
*   **`api.js`**: Responsible for all communication with the `FakeStoreAPI`. Fetches products and categories. Includes logic to convert USD prices to INR immediately after fetching. Contains basic error handling for fetch requests.
*   **`cart.js`**: Encapsulates all logic related to the shopping cart. Manages the `cart` array, provides functions to add, remove, update items, calculate subtotal, tax, discount, and total. Handles loading from and saving to `localStorage`.
*   **`ui.js`**: Manages all direct interactions with the DOM. Contains functions to display products, categories, cart items, update UI elements (cart icon, summary), handle modal visibility, show loading/error states, and set up specific event listeners delegated from `main.js`.
*   **`utils.js`**: A collection of reusable helper functions used across different modules, including currency conversion (`convertUSDToINR`), currency formatting (`formatCurrency` for INR), input debouncing (`debounce`), and text truncation (`limitWords`).
---