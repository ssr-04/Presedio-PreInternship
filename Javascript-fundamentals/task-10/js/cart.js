// js/cart.js

const CART_STORAGE_KEY = 'shoppingCart';
let cart = []; // In-Memory cart state

/**
 * Loads the cart from the localStorage
 */
const loadCart = () => {
    const storedCart = localStorage.getItem(CART_STORAGE_KEY);
    if(storedCart) {
        try {
            cart = JSON.parse(storedCart);
            // Basic Validation
            if(!Array.isArray(cart)){
                console.warn("Invalid cart data in localStorage. Resetting cart.");
                cart = [];
                saveCart();
            }
        } catch (error) {
            console.error("Error parsing cart from localStorage:", error);
            cart = []; 
        }
    } else {
        cart = []; // Initialize empty cart if not in local storage
    }
}

/**
 * Saves the current cart state to localStorage
 */
const saveCart = () => {
    try {
        localStorage.setItem(CART_STORAGE_KEY, JSON.stringify(cart));
    } catch (error) {
        console.error("Error saving cart to localStorage:", error);
    }
}

/**
 * Adds a product to the cart or increments the quantity
 * @param {object} product - The product object to add (must have id, title, price, image).
 * @returns {boolean} True if added/updated, false otherwise
 */
const addToCart = (product) => {
    if(!product || typeof product.id === 'undefined') {
        console.error("Invalid product object passed to addToCart:", product);
        return false;
    }

    const existingItemIndex = cart.findIndex(item => item.id === product.id);
    if(existingItemIndex > -1) {
        // Not -1, if exists
        cart[existingItemIndex].quantity += 1;
    } else{
        // Item does not exist, add new item with quantity 1
        cart.push({
            id: product.id,
            title: product.title,
            price: product.price,
            image: product.image,
            quantity: 1
        })
    }
    saveCart();
    return true;
}

/**
 * Updates the quantity of an item in the cart. Removes if the quantity <=0.
 * @param {number} productId - The ID of the product to update.
 * @param {number} quantity - The new quantity.
 * @returns {boolean} true if updated/removed, false otherwise.
 */
const updateQuantity = (productId, quantity) => {
    const itemIndex = cart.findIndex(item => item.id === productId);

    if(itemIndex > -1){
        if(quantity > 0) {
            cart[itemIndex].quantity = quantity;
        } else {
            //Remove the item from cart if quantity<=0
            cart.splice(itemIndex, 1);
        }
        saveCart();
        return true;
    }
    console.warn(`Product with ID ${productId} not found in cart for update.`);
    return false; // Item not found
}

/**
 * Removes an item completely from the cart.
 * @param {number} productId - The ID of the product to update.
 * @returns {boolean} True if removed, false otherwise.
 */
const removeFromCart = (productId) => {
    const itemIndex = cart.findIndex(item => item.id === productId);

    if(itemIndex > -1){
        //Remove the item from cart
        cart.splice(itemIndex, 1);
        
        saveCart();
        return true;
    }
    console.warn(`Product with ID ${productId} not found in cart for removal.`);
    return false; // Item not found
}

/**
 * Gets the current cart items.
 * @returns {Array} An array of cart item objects.
 */
const getCartItems = () => {
    // Return a copy to prevent direct modification of the internal state
    return [...cart];
}

/**
 * Calculates the total number of items in the cart (includes sum of quantity).
 * @returns {number} The total count of items.
 */
const getCartItemCount = () => {
    return cart.reduce((total, item) => total + item.quantity, 0);
}

/**
 * Calculates the subtotal of all items in the cart.
 * @returns {number} The cart subtotal.
 */
const calculateSubtotal = () => {
    return cart.reduce((total, item) => total + (item.price * item.quantity), 0);
}

/**
 * Calculates the tax amount based on the subtotal.
 * @param {number} subtotal - The cart subtotal.
 * @param {number} [taxRate=0.10] - The tax rate (e.g., 0.10 for 10%).
 * @returns {number} The calculated tax amount.
 */
const calculateTax = (subtotal, taxRate = 0.10) => {
    return subtotal * taxRate;
}

/**
 * Calculates the discount amount based on the subtotal (5% discount on subtotal over Rs.2000).
 * @param {number} subtotal - The cart subtotal.
 * @returns {number} The calculated discount amount.
 */
const calculateDiscount = (subtotal) => {
    if (subtotal > 2000) {
        return subtotal * 0.05; // 5% discount over Rs.2000
    }
    return 0;
}

/**
 * Calculates the final total (subtotal + tax - discount).
 * @returns {number} The final total amount.
 */
const calculateTotal = () => {
    const subtotal = calculateSubtotal();
    const tax = calculateTax(subtotal);
    const discount = calculateDiscount(subtotal);
    return subtotal + tax - discount;
}

/**
 * Clears all items from the cart and localStorage.
 */
function clearCart() {
    cart = [];
    saveCart();
}

// Initialize cart on load
loadCart();

// Export functions to be used by other modules
export const Cart = {
    load: loadCart,
    save: saveCart,
    add: addToCart,
    update: updateQuantity,
    remove: removeFromCart,
    getItems: getCartItems,
    getItemCount: getCartItemCount,
    getSubtotal: calculateSubtotal,
    getTax: calculateTax,
    getDiscount: calculateDiscount,
    getTotal: calculateTotal,
    clear: clearCart
};