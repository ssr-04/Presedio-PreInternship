import {getRandomImage} from './dummyApi.js';


const contentGrid = document.getElementById('content-grid');
const loadingIndicator = document.getElementById('loading');
let isLoading = false;

const loadMoreContent = async() => {
    isLoading = true;
    loadingIndicator.style.display = 'block';

    try {
        const newImage = await getRandomImage();
        // console.log(newImage);
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `
        <img src="${newImage.imageUrl}" class="card-image" alt="Random image">`;
        contentGrid.appendChild(card);
    } catch(error) {
        console.log('Error loading content:', error);
    } finally {
        isLoading = false;
        loadingIndicator.style.display = 'none';
    }
}

const handleScroll = () => {
    const {scrollTop, clientHeight, scrollHeight} = document.documentElement;
    if(scrollTop + clientHeight >= scrollHeight - 100 && !isLoading) {
        loadMoreContent()
    }
}

// Initial Load
for(let i=0; i<8; i++) {
    loadMoreContent();
}

window.addEventListener('scroll', handleScroll);