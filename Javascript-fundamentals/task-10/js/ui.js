// js/ui.js

import { formatCurrency,limitWords } from "./utils.js";
import { Cart } from "./cart.js";

// --- DOM Element References ---
const productListContainer = document.getElementById('product-list');
const categoryFiltersContainer = document.getElementById('category-filters');
const cartButton = document.getElementById('cart-button');
const cartCountElement = document.getElementById('cart-count');
const cartModal = document.getElementById('cart-modal');
const cartItemsContainer = document.getElementById('cart-items');
const cartSummaryContainer = document.getElementById('cart-summary');
const cartSubtotalElement = document.getElementById('cart-subtotal');
const cartTaxElement = document.getElementById('cart-tax');
const cartDiscountElement = document.getElementById('cart-discount');
const cartTotalElement = document.getElementById('cart-total');
const closeModalButton = cartModal.querySelector('.close-btn');
const loadingIndicator = document.querySelector('.loading-indicator');
const errorMessageElement = document.getElementById('error-message');

// UI update functions

/**
 * Displays products in the product grid.
 * @param {Array} products - Array of product objects to display.
 */

const displayProducts = (products) => {
    // Clear previous content
    productListContainer.innerHTML = '';
    errorMessageElement.style.display = 'none';

    if(!products || products.length === 0){
        productListContainer.innerHTML = '<p class="no-products">No products found.</p>';
        return;
    }

    const fragment = document.createDocumentFragment(); // Efficient for performance

    products.forEach(product => {
        const card = document.createElement('article');
        card.className = 'product-card';
        card.dataset.productId = product.id;

        const shortDescription = limitWords(product.description, 15);

        card.innerHTML = `
            <img src="${product.image}" alt="${product.title}" class="product-image">
            <div class="product-info">
                <h3 class="product-title" title="${product.title}">${product.title}</h3>
                <p class="product-description" title="${product.description}">${shortDescription}</p>
                <p class="product-price">${formatCurrency(product.price)}</p>
                <button class="add-to-cart-btn" data-product-id="${product.id}">
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </button>
            </div>
        `
        fragment.appendChild(card);
    })

    productListContainer.appendChild(fragment);
}

/**
 * Displays categories as filter buttons.
 * @param {Array<string>} categories - Array of available categories.
 */
const displayCategories = (categories) => {
    // Clear all buttons except all
    const existingButtons = categoryFiltersContainer.querySelectorAll('filter-btn:not([data-category="all"])');
    existingButtons.forEach(btn => btn.remove());

    const fragment = document.createDocumentFragment();
    categories.forEach(category => {
        const button = document.createElement('button');
        button.className = 'filter-btn';
        button.dataset.category = category;
        button.textContent = category;
        fragment.appendChild(button);
    })
    categoryFiltersContainer.appendChild(fragment);
}

/**
 * Updates the visual state of the "Add to Cart" button.
 * @param {number} productId - The ID of the product whose button to update.
 * @param {boolean} added - Whether the item was just added.
 */
const updateAddToCartButton = (productId, added) => {
    const button = productListContainer.querySelector(`.add-to-cart-btn[data-product-id="${productId}"]`);
    if(button) {
        if(added) {
            button.innerHTML = '<i class="fas fa-check"></i> Added!';
            button.classList.add('added');
            button.disabled = true;
            // Reset after a short delay
            setTimeout(() => {
                if(button.classList.contains('added')){
                    button.innerHTML = '<i class="fas fa-cart-plus"></i> Add to Cart';
                    button.classList.remove('added');
                    button.disabled = false;
                }
            }, 1500); //Resets after 1.5 seconds
        } else {
            button.innerHTML = '<i class="fas fa-cart-plus"></i> Add to Cart';
            button.classList.remove('added');
            button.disabled = false;
        }
    }
}

/**
 * Updates the cart item count display in the header.
 * @param {number} count - The total number of items in the cart.
 */
const updateCartIcon = (count) => {
    cartCountElement.textContent = count;
    cartCountElement.style.display = count > 0 ? 'inline-block' : 'none';
}

/**
 * Displays the items currently in the cart within the modal.
 */
const displayCartItems = () => {
    const items = Cart.getItems();
    cartItemsContainer.innerHTML = ''; // Clear previous items
    if(items.length === 0) {
        let emptyMessageElement = document.createElement('p');
        emptyMessageElement.textContent = "Your cart is empty.";
        emptyMessageElement.className = 'empty-cart-message';
        cartItemsContainer.appendChild(emptyMessageElement)
        cartSummaryContainer.style.display = 'none'; // Hide summary if cart is empty
        return;
    }

    cartSummaryContainer.style.display = 'block'; // Show summary

    const fragment = document.createDocumentFragment();
    items.forEach(item => {
        const itemElement = document.createElement('div');
        itemElement.className = 'cart-item';
        itemElement.dataset.productId = item.id;

        itemElement.innerHTML = `
            <img src="${item.image}" alt="${item.title}" class="cart-item-img">
            <div class="cart-item-info">
                <div class="cart-item-title">${item.title}</div>
                <div class="cart-item-price">${formatCurrency(item.price)} each</div>
            </div>
            <div class="cart-item-quantity">
                <label for="qty-${item.id}" class="sr-only">Quantity for ${item.title}</label> <!-- Accessibility -->
                <input type="number" id="qty-${item.id}" class="quantity-input" value="${item.quantity}" min="1" max="99" data-product-id="${item.id}" aria-label="Item quantity">
            </div>
            <div class="cart-item-total">
                ${formatCurrency(item.price * item.quantity)}
            </div>
            <button class="remove-item-btn" data-product-id="${item.id}" aria-label="Remove ${item.title} from cart">
                <i class="fas fa-trash-alt"></i>
            </button>
        `;
        fragment.appendChild(itemElement);
    });

    cartItemsContainer.appendChild(fragment);
    updateCartSummary();
}

/**
 * Updates the cart summary section (subtotal, tax, total).
 */
const updateCartSummary = () => {
    const subtotal = Cart.getSubtotal();
    const tax = Cart.getTax(subtotal);
    const discount = Cart.getDiscount(subtotal);
    const total = Cart.getTotal();

    cartSubtotalElement.textContent = formatCurrency(subtotal);
    cartTaxElement.textContent = formatCurrency(tax);
    cartDiscountElement.textContent = formatCurrency(discount);
    cartTotalElement.textContent = formatCurrency(total);

    const hasItems = Cart.getItemCount() > 0;
    cartSummaryContainer.style.display = hasItems ? "block" : "none";
}

// --- Modal Handling ---
const showCartModal = () => {
    displayCartItems(); // Refresh on opening every time
    cartModal.style.display = 'block';
}

const hideCartModal = () => {
    cartModal.style.display = 'none';
}

// --- Loading & Error States ---

const showLoading = () => {
    productListContainer.innerHTML = '';
    if(loadingIndicator) loadingIndicator.style.display = 'block';
    errorMessageElement.style.display = 'none';
}

function hideLoading() {
    if (loadingIndicator) loadingIndicator.style.display = 'none';
}

function showError(message) {
    hideLoading(); 
    productListContainer.innerHTML = ''; 
    errorMessageElement.textContent = `Error: ${message}. Please try refreshing the page.`;
    errorMessageElement.style.display = 'block';
}

// --- Filter Button Active State ---
function setActiveFilterButton(category) {
    const buttons = categoryFiltersContainer.querySelectorAll('.filter-btn');
    buttons.forEach(button => {
        if (button.dataset.category === category) {
            button.classList.add('active');
        } else {
            button.classList.remove('active');
        }
    });
}

// --- Event Listener Setup (to be called from main.js) ---

const setupEventListeners = (options) => {
    const {
        onAddToCart,
        onRemoveFromCart,
        onUpdateQuantity,
        onCategoryFilter,
        onSearch
     } = options;

    // Event Delegation for Add to Cart buttons
    productListContainer.addEventListener('click', (event) => {
        const button = event.target.closest('.add-to-cart-btn');
        if (button && !button.disabled) { // Check if it's the button and not disabled
            const productId = parseInt(button.dataset.productId, 10);
            onAddToCart(productId);
            updateAddToCartButton(productId, true); // Provide visual feedback
        }
    });

    // Event Delegation for Cart Item interactions (Remove/Quantity)
    cartItemsContainer.addEventListener('click', (event) => {
        const removeButton = event.target.closest('.remove-item-btn');
        if (removeButton) {
            const productId = parseInt(removeButton.dataset.productId, 10);
            onRemoveFromCart(productId);
             // UI update (removing the item visually) will happen in displayCartItems
        }
    });

     cartItemsContainer.addEventListener('change', (event) => {
         const quantityInput = event.target.closest('.quantity-input');
         if (quantityInput) {
             const productId = parseInt(quantityInput.dataset.productId, 10);
             let quantity = parseInt(quantityInput.value, 10);

             // Basic validation
             if (isNaN(quantity) || quantity < 0) {
                 quantity = 1; // Reset to 1 if invalid
                 quantityInput.value = quantity; // Update input visually
             }
              if (quantity > 99) { // Enforce max
                 quantity = 99;
                 quantityInput.value = quantity;
             }

             onUpdateQuantity(productId, quantity); // Update cart logic
             // Note: displayCartItems will be called again to refresh the view
         }
     });


    // Cart Modal listeners
    cartButton.addEventListener('click', showCartModal);
    closeModalButton.addEventListener('click', hideCartModal);
    // Close modal if clicking outside the content
    cartModal.addEventListener('click', (event) => {
        if (event.target === cartModal) {
            hideCartModal();
        }
    });

    // Category Filter listeners (Event Delegation)
    categoryFiltersContainer.addEventListener('click', (event) => {
        const button = event.target.closest('.filter-btn');
        if (button && !button.classList.contains('active')) {
            const category = button.dataset.category;
            setActiveFilterButton(category); // Update visual state
            onCategoryFilter(category);
        }
    });

    // Search listener (handled in main.js with debouncing)

}


// Export UI functions and setup method
export const UI = {
    displayProducts,
    displayCategories,
    updateCartIcon,
    displayCartItems,
    updateCartSummary,
    showCartModal,
    hideCartModal,
    showLoading,
    hideLoading,
    showError,
    setActiveFilterButton,
    setupEventListeners
};