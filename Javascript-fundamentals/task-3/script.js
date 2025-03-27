document.addEventListener("DOMContentLoaded", () => {
    const thumbnails = document.querySelectorAll('.thumbnail');
    const modalOverlay = document.querySelector('.modal-overlay');
    const modalImage = document.querySelector('.modal-image');
    const closeBtn = document.querySelector('.close-btn');
    const leftBtn = document.querySelector('.left-btn');
    const rightBtn = document.querySelector('.right-btn');
    const count = thumbnails.length;

    thumbnails.forEach((thumbnail, index) => {
        thumbnail.addEventListener('click', () => {
            const fullSizeSrc = thumbnail.dataset.fullsize;
            modalImage.src = fullSizeSrc;
            modalOverlay.idx = index; // To know the current src index to move right or left
            modalOverlay.classList.add('active');
        });
    });

    const closeModal = () => {
        modalOverlay.classList.remove('active');
    };

    const moveRight = () => {
        let newIdx = (modalOverlay.idx + 1) % count;
        modalOverlay.idx = newIdx;
        modalImage.src = thumbnails[newIdx].dataset.fullsize;
    }

    const moveLeft = () => {
        let newIdx = (modalOverlay.idx - 1);
        newIdx = newIdx < 0 ? count-1 : newIdx;
        modalOverlay.idx = newIdx;
        modalImage.src = thumbnails[newIdx].dataset.fullsize;
    }

    // When clicked anywhere other than on image then close modal
    modalOverlay.addEventListener('click', (e) => {
        if(e.target === modalOverlay) closeModal();
    });

    closeBtn.addEventListener('click', closeModal);
    leftBtn.addEventListener('click', moveLeft);
    rightBtn.addEventListener('click', moveRight);

    document.addEventListener('keydown', (e) => {
        if(e.key === 'Escape' && modalOverlay.classList.contains('active')){
            closeModal();
        }

        if(modalOverlay.classList.contains('active')){
            if(e.key === 'ArrowRight'){
                moveRight();
            } else if(e.key === 'ArrowLeft'){
                moveLeft();
            }
        }
    })
})