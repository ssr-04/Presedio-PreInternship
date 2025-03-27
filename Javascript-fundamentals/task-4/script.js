import { showToast } from './toast.js'; 

// localStorage.setItem(weatherApiKey, "Enter your api_key for first time")

let apiKey = localStorage.getItem('weatherApiKey');

/* By the documentation of 'OpenWeatherMap', getting weather by city name is decrepeated,
So it's recommended to use their Geoencoding api to get co-ordinates and use that for weather details */

const toastError = () => {
    showToast('Something went wrong.', 'error')
}


// Function to retrieve the co-ordinates based on city name (Geocoding API)
const getCoords = async(city) => {
    try {
        const response = await fetch(`http://api.openweathermap.org/geo/1.0/direct?q=${city},&limit=1&appid=${apiKey}`)
        
        if (!response.ok) {
            toastError()
            console.log("Something went wrong in getCoords:", response)
            return
        }

        const data = await response.json()
        console.log(data);
        if(data.length === 0){
            showToast("Can't get details for the city", "warning")
            console.log("Can't get details for the specified city") 
            return
        }
        return data[0]

    } catch (error) {
        toastError()
        console.log("Something went wrong in getCoords:", error)
    }
}

// Function to get the weather based on co-ordinates
const getWeather = async(lat, long) => {
    
    try {
        const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${apiKey}&units=metric`)
        if (!response.ok) {
            toastError()
            console.log('Something went wrong in getWeather:', response);
            return
        }

        const data = await response.json()
        return data
    } catch (error) {
        toastError()
        console.log('Something went wrong in getWeather:',error);
    }
}


const searchInput = document.getElementById('city-input');
const searchBtn = document.getElementById('search-btn');

const validateInput = (city) => {
    if(city.trim() && /^[A-Za-z ]+$/.test(city) && city.length>=3){
        return true
    } else {
        showToast('Invalid Input', 'error')
        return false
    }
}

const search = async() => {
    let city = searchInput.value;
    const results = document.getElementById('results');

    results.classList.remove('active');

    if(!validateInput(city)) return;

    const response = await getCoords(city);

    if(!response){
        searchInput.value = '';
        return;
    }
    try {
        const {lat, lon} = response;
        console.log(response, lat, lon)
        const data = await getWeather(lat, lon);
        console.log(data);
        displayResults(data)
    } catch (error) {
        toastError();
        console.log(error);
    }

}

const displayResults = (data) => {
    try {
        const {lat, lon} = data['coord'];
        const {main, description} = data['weather'][0];
        const {temp, feels_like, temp_min, temp_max, pressure, humidity} = data['main'];
        const {speed} = data['wind'];
        const {name, visibility} = data;

        const results = document.getElementById('results');
        const cityName = document.getElementById('city-name');
        const weatherDescription = document.getElementById('weather-description');
        const bgImage = document.getElementById('bg-overlay');

        bgImage.src = `./assets/${main}.gif`;

        const card1 = document.getElementById('card1');
        const card2 = document.getElementById('card2');
        const card3 = document.getElementById('card3');

        cityName.innerHTML = name;
        weatherDescription.innerHTML = 'it feels like ' + description;

        // Clear existing content
        card1.innerHTML = '';
        card2.innerHTML = '';
        card3.innerHTML = '';

        // Card details
        const card1Content = [
            {parameter: 'Latitude', value: lat},
            {parameter: 'Longitude', value: lon}
        ]
        const card2Content = [
            {parameter: 'Real temp', value: temp},
            {parameter: 'Feels like', value: feels_like},
            {parameter: 'Minimum', value: temp_min},
            {parameter: 'Maximum', value: temp_max},
        ]
        const card3Content = [
            {parameter: 'Pressure', value: pressure},
            {parameter: 'Humidity', value: humidity},
            {parameter: 'Wind', value: speed},
            {parameter: 'Visibility', value: visibility},
        ]
        const details = [
            {card:card1, title:'Co-ordinates', content:card1Content},
            {card:card2, title:'Temperature', content:card2Content},
            {card:card3, title:'Others', content:card3Content}
        ]

        // Loop through each card and append it's content
        details.forEach((detail) => {
            let cardElement = detail.card;
            let titleElement = document.createElement('h3');
            titleElement.innerHTML = detail.title;
            cardElement.appendChild(titleElement);
            detail.content.forEach((cardContent) => {
                let contentElement = document.createElement('p');
                contentElement.textContent = `${cardContent.parameter}: ${cardContent.value}`
                cardElement.appendChild(contentElement)
            })
        })

        results.classList.add('active');

    } catch (error) {
        toastError()
        console.log(error);
    }
}


searchBtn.addEventListener('click', search);