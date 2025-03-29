import {botResponses, proactiveMessages} from './data.js';

document.addEventListener('DOMContentLoaded', () => {
    const chatMessages = document.getElementById('chat-messages');
    const messageInput = document.getElementById('message-input');
    const sendBtn = document.getElementById('send-btn');

    // Initial Message after a delay
    setTimeout(() => {
        addMessage("Welcome to the chat simulation! Type a message to get started..", "incoming")
    }, 1000);

    const addMessage = (text, type) => {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message', type);

        const currentTime = new Date();
        const hours = currentTime.getHours().toString().padStart(2, '0');
        const minutes = currentTime.getMinutes().toString().padStart(2, '0');
        const timeString = `${hours}:${minutes}`;

        messageDiv.innerHTML = `
            ${text}
            <div class="timestamp">${timeString}</div>
        `;

        chatMessages.appendChild(messageDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight
    }

    const sendMessage = () => {
        const messageText = messageInput.value.trim();
        if(messageText){
            addMessage(messageText, 'outgoing');
            messageInput.value = '';

            const typingTime = Math.floor(Math.random() * 3000) + 1000; // Random time between 1-4 seconds
            document.getElementById('user-status').innerHTML = "typing...";
            setTimeout(() => {
                const randomResponse = botResponses[Math.floor(Math.random() * botResponses.length)];
                addMessage(randomResponse, 'incoming')
                document.getElementById('user-status').innerHTML = "Online";
            }, typingTime);
        }
    }

    sendBtn.addEventListener('click',sendMessage);
            
    messageInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });

    // Simulate occasional messages from the bot
    setInterval(() => {
        // 20% chance of sending a message if there's been activity
        if (chatMessages.children.length > 1 && Math.random() < 0.2) {
            const randomMessage = proactiveMessages[Math.floor(Math.random() * proactiveMessages.length)];
            addMessage(randomMessage, 'incoming');
        }
    }, 20000); // Check every 20 seconds
});