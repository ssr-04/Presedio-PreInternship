// State Management

const appState = {
    counter: 0
};

//DOM elements
const pages = document.querySelectorAll(".page");
const navLinks = document.querySelectorAll(".nav-link");
const counterValue = document.getElementById('counter-value');
const incrementBtn = document.getElementById("increment-btn");
const decrementBtn = document.getElementById('decrement-btn');

const navigateToPage = (hash) => {
    
    const targetId = hash.substring(1) || 'home';

    pages.forEach(page => {
        page.classList.remove('active');
    })

    const targetPage = document.getElementById(targetId);
    if(targetPage){
        targetPage.classList.add('active');
    }

    navLinks.forEach(link => {
        link.classList.remove('active');
        if(link.getAttribute('href') === hash || (hash === '' && link.getAttribute('href') === '#home')) {
            link.classList.add('active');
        }
    })
}

// Init app function
const initApp = () => {
    // Set up counter
    updateCounterDisplay();

    incrementBtn.addEventListener('click', () => {
        appState.counter++;
        updateCounterDisplay();
    })

    decrementBtn.addEventListener('click', () => {
        appState.counter--;
        updateCounterDisplay();
    })

    // When hash changes
    window.addEventListener('hashchange', () => {
        navigateToPage(window.location.hash);
    })

    navigateToPage(window.location.hash);
}

const updateCounterDisplay = () => {
    counterValue.textContent = appState.counter;
}

document.addEventListener('DOMContentLoaded', initApp)