// js/main.js
import { fetchProducts, fetchCategories } from './api.js';
import { Cart } from './cart.js';
import { UI } from './ui.js';
import { debounce } from './utils.js';

let allProducts = []; // Store all fetched products
let currentProducts = []; // Store currently displayed products (filtered/searched)

const searchInput = document.getElementById('search-input');

// --- Initialization ---
async function initializeShop() {
    console.log("Initializing Shop...");
    UI.showLoading(); // Show loading indicator
    Cart.load(); // Load cart from localStorage first
    UI.updateCartIcon(Cart.getItemCount()); // Update icon based on loaded cart

    try {
        // Fetch products and categories in parallel
        const [products, categories] = await Promise.all([
            fetchProducts(),
            fetchCategories()
        ]);

        allProducts = products; // Store all products
        currentProducts = products; // Initially current = all products

        UI.hideLoading();
        UI.displayProducts(currentProducts);
        UI.displayCategories(categories);
        UI.setActiveFilterButton('all'); // Set 'All' as active initially

        console.log("Shop initialized successfully.");

    } catch (error) {
        console.error("Initialization failed:", error);
        UI.showError(error.message || 'Failed to load shop data.');
    }

    // Setup event listeners after initial data load
    setupAppEventListeners();
}

// --- Event Handlers ---

function handleAddToCart(productId) {
    const productToAdd = allProducts.find(p => p.id === productId);
    if (productToAdd) {
        if (Cart.add(productToAdd)) {
            console.log(`Added product ${productId} to cart.`);
            UI.updateCartIcon(Cart.getItemCount());
            //  Refresh cart modal if it's open
            if (document.getElementById('cart-modal').style.display === 'block') {
                UI.displayCartItems();
            }
        } else {
             console.warn(`Failed to add product ${productId} to cart.`);
        }
    } else {
        console.error(`Product with ID ${productId} not found.`);
    }
}

function handleRemoveFromCart(productId) {
     if (Cart.remove(productId)) {
        console.log(`Removed product ${productId} from cart.`);
        UI.updateCartIcon(Cart.getItemCount());
        UI.displayCartItems(); // Refresh cart display immediately
     } else {
         console.warn(`Failed to remove product ${productId} from cart.`);
     }
}

function handleUpdateQuantity(productId, quantity) {
    if (quantity === 0) {
        handleRemoveFromCart(productId);
    } else if (Cart.update(productId, quantity)) {
         console.log(`Updated quantity for product ${productId} to ${quantity}.`);
         UI.updateCartIcon(Cart.getItemCount());
         UI.displayCartItems(); 
    } else {
        console.warn(`Failed to update quantity for product ${productId}.`);
    }
}


function filterAndSearchProducts(category = 'all', searchTerm = '') {
    searchTerm = searchTerm.toLowerCase().trim();

    let filtered = allProducts;

    // 1. Filter by Category
    if (category !== 'all') {

        const lowerCaseCategory = category.toLowerCase();
        filtered = filtered.filter(product => product.category.toLowerCase() === lowerCaseCategory);
    }

    // 2. Filter by Search Term (on title and potentially description)
    if (searchTerm) {
        filtered = filtered.filter(product =>
            product.title.toLowerCase().includes(searchTerm) ||
            product.description.toLowerCase().includes(searchTerm)
        );
    }

    currentProducts = filtered;
    UI.displayProducts(currentProducts); // Update the UI
}


function handleCategoryFilter(category) {
    console.log("Filtering by category:", category);
    const currentSearchTerm = searchInput.value;
    filterAndSearchProducts(category, currentSearchTerm);
}


// Debounced search handler
const handleSearch = debounce(() => {
    const searchTerm = searchInput.value;
    const activeButton = document.querySelector('#category-filters .filter-btn.active');
    const currentCategory = activeButton ? activeButton.dataset.category : 'all';
    console.log("Searching for:", searchTerm);
    filterAndSearchProducts(currentCategory, searchTerm);
}, 300); // 300ms delay


// --- Setup App-Level Event Listeners ---
function setupAppEventListeners() {
     // Pass handler functions to UI setup
    UI.setupEventListeners({
        onAddToCart: handleAddToCart,
        onRemoveFromCart: handleRemoveFromCart,
        onUpdateQuantity: handleUpdateQuantity,
        onCategoryFilter: handleCategoryFilter,
        onSearch: handleSearch // Although search is handled directly below
    });

     // Direct listener for search input
     searchInput.addEventListener('input', handleSearch);
}

// --- Start the app ---
document.addEventListener('DOMContentLoaded', initializeShop);