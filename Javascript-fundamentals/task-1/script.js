const taskInput = document.getElementById("task-input");
const addButton = document.getElementById("addTask");
const taskList = document.getElementById("taskList");

// Retrieve tasks from localStorage or initialize an empty array
let tasks = JSON.parse(localStorage.getItem('tasks')) || [];

// Function to add a new task
function addItem(){
    const taskText = taskInput.value.trim(); // Trim to avoid empty spaces being stored
    if(taskText){
        tasks.unshift({text: taskText, completed: false}); // Add task to the beginning of the array
    }
    taskInput.value = ""; // Clear input field after adding task
    renderTasks();
    saveTasks();
}

// Function to render tasks dynamically in the UI
function renderTasks(){
    taskList.innerHTML = ''; // Clear existing task list before re-rendering

    tasks.forEach((task, index) => {
        const listItem = document.createElement('li');
        listItem.innerHTML = task.text;
        listItem.classList.add('task');
        
        // If the task is marked as completed, apply the 'completed' class
        if(task.completed){
            listItem.classList.add('completed');
        }
        
        // Toggle completion status on click
        listItem.addEventListener('click', ()=> {
            task.completed = !task.completed;
            renderTasks();
            saveTasks();
        });

        // Create a delete button for removing tasks
        const deleteButton = document.createElement('button');
        deleteButton.innerHTML = 'X';
        deleteButton.classList.add('deleteButton');
        
        // Remove task from the array and update UI
        deleteButton.addEventListener('click', () => {
            tasks.splice(index, 1);
            renderTasks();
            saveTasks();
        });

        listItem.appendChild(deleteButton);
        taskList.appendChild(listItem);
    });
}

// Function to save tasks in localStorage for persistence
function saveTasks() {
    localStorage.setItem('tasks', JSON.stringify(tasks));
}

// Event listener for adding a task via button click
addButton.addEventListener('click', () => {
    addItem();
});

// Event listener for adding a task via Enter key press
taskInput.addEventListener('keypress', function(event){
    if(event.key == "Enter"){
        addItem();
    }
});

// Initial rendering of stored tasks
renderTasks();
