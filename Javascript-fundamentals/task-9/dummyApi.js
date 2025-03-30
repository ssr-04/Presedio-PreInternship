 export const getRandomImage = () => {
    return new Promise((resolve) => {
        setTimeout(() => {
            const url = `https://picsum.photos/400/300?random=${Math.random()}`;
            resolve({
                imageUrl: url
            });
        }, 1000);
    });
 }