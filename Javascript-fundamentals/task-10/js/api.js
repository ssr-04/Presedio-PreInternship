// js/api.js

import {convertUSDToINR} from './utils.js';

const API_BASE_URL = 'https://fakestoreapi.com';

/** 
* Fetches all products from the API. 
* @returns {Promise<Array>} A promise that resolves with an array of products.
* @throws {Error} If the fetch operation fails.
*/
export const fetchProducts = async() => {
    try {
        const response = await fetch(`${API_BASE_URL}/products`);
        if (!response.ok) {
            throw new Error(`API error! status: ${response.status}`)
        }
        const products = await response.json();
        return products.map(product => ({...product, price: convertUSDToINR(product.price).toFixed(2)}))
    } catch (error) {
        console.error("Error fetching products:", error);
        throw error;
    }
}

/**
 * Fetches all product categories from the API.
 * @returns {Promise<Array>} A promise that resolves with an array of categories (Strings).
 * @throws {Error} if the fetch operation fails
 */
export const fetchCategories = async() => {
    try {
        const response = await fetch(`${API_BASE_URL}/products/categories`);
        if (!response.ok) {
            throw new Error(`API error! status: ${response.status}`);
        }
        const categories = await response.json();
        //Capitalize the categories
        return categories.map(cat => cat.charAt(0).toUpperCase() + cat.slice(1))
    } catch (error) {
        console.error("Error fetching categories:", error);
        throw error;
    }
}

// Unit testing
// const UnitTest = async() => {
//     console.log(await fetchProducts())
//     console.log(await fetchCategories())
// }

// UnitTest()
