let display = document.getElementById('display');
// Initialization
let firstOperand = null;
let operator = null;
let secondOperand = null;
let shouldResetDisplay = false;

function appendToDisplay(value) {
    // Prevent multiple decimals in a number
    if (value === '.' && display.textContent.includes('.')) return;

    // if operator is choosen
    if (shouldResetDisplay) {
        display.textContent = value;
        shouldResetDisplay = false;
    } else {
        display.textContent = display.textContent === '0' ? value : display.textContent + value;
    }
}

function clearDisplay() {
    // Reset states
    display.textContent = '0';
    firstOperand = null;
    operator = null;
    secondOperand = null;
    shouldResetDisplay = false;
}

function setOperator(op) {
    if (firstOperand === null) {
        firstOperand = parseFloat(display.textContent);
    } else if (operator) {
        // Perform calculation before setting new operator
        calculate();
        firstOperand = parseFloat(display.textContent);
    }
    operator = op;
    shouldResetDisplay = true;
}

function calculate() {
    if (firstOperand !== null && operator) {
        secondOperand = parseFloat(display.textContent);
        let result;

        switch (operator) {
            case '+':
                result = firstOperand + secondOperand;
                break;
            case '-':
                result = firstOperand - secondOperand;
                break;
            case '*':
                result = firstOperand * secondOperand;
                break;
            case '/':
                result = secondOperand === 0 ? 'Error' : firstOperand / secondOperand;
                break;
            default:
                return;
        }

        display.textContent = result;

        // Ensure further calculations are possible after `=`
        firstOperand = isNaN(result) ? null : result;
        operator = null;
        shouldResetDisplay = true;
    }
}
