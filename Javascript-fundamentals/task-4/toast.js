export const showToast = (message, type = 'success') => {
    // Create the toast element
    const toast = document.createElement('div');
    toast.textContent = message;
  
    // Apply styles to toast
    toast.style.position = 'fixed';
    toast.style.fontSize = '2rem';
    toast.style.border = "2px solid black";
    toast.style.top = '20px';
    toast.style.left = '50%'; // Moves edge to center
    toast.style.transform = 'translateX(-50%)'; // Positions content center
    toast.style.padding = '15px 20px';
    toast.style.borderRadius = '5px';
    toast.style.zIndex = '9999'; 
    toast.style.transition = 'opacity 0.3s ease-in-out';
    toast.style.opacity = '0'; 
  
    if (type === 'success') {
      toast.style.backgroundColor = '#4CAF50'; // Green for success
      toast.style.color = 'white';
    } else if (type === 'error') {
      toast.style.backgroundColor = '#f44336'; // Red for error
      toast.style.color = 'white';
    } else if (type === 'warning') {
      toast.style.backgroundColor = '#ff9800'; // Orange for warning
      toast.style.color = 'white';
    } else if(type === 'info'){
        toast.style.backgroundColor = '#2196F3'; // Blue for info
        toast.style.color = 'white';
    }
  
    // Append the toast to the body
    document.body.appendChild(toast);
  
    // Fade in the toast
    setTimeout(() => {
      toast.style.opacity = '1';
    }, 10);
  
    // Fade out and remove the toast after 2 seconds
    setTimeout(() => {
      toast.style.opacity = '0';
      setTimeout(() => {
        document.body.removeChild(toast);
      }, 300); // Wait for the fade out transition
    }, 2000); // 2000 milliseconds (2 seconds)
  }
  