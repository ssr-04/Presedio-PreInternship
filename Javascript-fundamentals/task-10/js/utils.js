// js/utils.js

/**
 * Converts the currency value from USD to INR
 * @param {number} amountInUSD - Value in USD
 * @returns {number} Value in INR
 */

export const convertUSDToINR = (amountInUSD) => {
    const conversionRate = 85.53; // Conversion as on April 1, 2025
    return amountInUSD * conversionRate;
}

/**
 * Formats a number as currency (INR).
 * @param {number} amount - The amount to format.
 * @returns {string} Formatted currency string.
 */
export const formatCurrency = (amountInINR) => {
    const formatter = new Intl.NumberFormat('en-IN', {
        style: 'currency',
        currency: 'INR',
      });
    return formatter.format(amountInINR);
}

/**
 * Basic debounce function (using closures).
 * Limits the rate at which a function can fire.
 * @param {Function} func - The function to debounce.
 * @param {number} delay - The delay in milliseconds.
 * @returns {Function} The debounced function.
 */
export const debounce = (func, delay) => {
    let timeoutId;
    return function(...args){
        clearTimeout(timeoutId);
        timeoutId = setTimeout(() => {
            func.apply(this, args);
        }, delay);
    };
}

/**
 * Limits the number of words in a string and adds ellipsis.
 * @param {string} text - Input string.
 * @param {number} limit - Maximum number of words.
 * @returns {string} The truncated string.
 */
export const limitWords = (text = '', limit=20) => {
    const words = text.split(' ');
    if(words.length > limit) {
        return words.slice(0, limit).join(' ') + '...';
    }
    return text
}

// // Unit Testing
// export const UnitTests = async() => {
//     console.log(formatCurrency(convertUSDToINR(0.6)))
//     console.log(formatCurrency(convertUSDToINR(5)))
//     console.log(formatCurrency(convertUSDToINR(25.23)))
    
//     function test(text){
//         console.log(text)
//     }
//     const debouncedTest = debounce(test,2000)
//     debouncedTest("hello 1")
//     await new Promise(r => setTimeout(r, 2000))
//     debouncedTest("hello 2")
//     debouncedTest("hello 3")

//     console.log(limitWords("hello world"))
//     console.log(limitWords("This is some random text for test",3))
// }

// UnitTests()