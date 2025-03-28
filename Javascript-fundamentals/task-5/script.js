import {quizData} from './data.js';

// Quiz state variables
let currentQuestionIndex = 0;
const userAnswers = new Array(quizData.questions.length).fill(null);
let quizCompleted = false;

// DOM Elements
const questionContainer = document.getElementById('question-container');
const optionsContainer = document.getElementById('options-container');

const prevBtn = document.getElementById('prev-btn');
const nextBtn = document.getElementById('next-btn');

const resultContainer = document.getElementById('result');
const feedbackContainer = document.getElementById('feedback');

// Load a question
function loadQuestion(index) {
  const question = quizData.questions[index];

  // Clear previous question and options
  questionContainer.innerHTML = '';
  optionsContainer.innerHTML = '';

  // Display question
  const questionElement = document.createElement('h2');
  questionElement.textContent = question.question;
  questionContainer.appendChild(questionElement);

  // Create options
  question.options.forEach((option, optionIndex) => {
    const optionElement = document.createElement('div');
    optionElement.classList.add('option');
    optionElement.textContent = option;
    optionElement.dataset.index = optionIndex;

    // Highlight previously selected answer, if any (in-case of clicking previous)
    if (userAnswers[index] === optionIndex) {
      optionElement.classList.add('selected');
    }

    // Handle option selection
    optionElement.addEventListener('click', () => selectOption(optionIndex));
    optionsContainer.appendChild(optionElement);
  });

  // Update navigation buttons
  updateNavigation();
}

// Select an option
function selectOption(optionIndex) {
  const options = optionsContainer.querySelectorAll('.option');

  // Remove previous selection
  options.forEach(opt => opt.classList.remove('selected'));

  // Mark selected option and save answer
  options[optionIndex].classList.add('selected');
  userAnswers[currentQuestionIndex] = optionIndex;
}

// Update navigation buttons
function updateNavigation() {
  // Show or hide the Previous button
  prevBtn.classList.toggle('hidden', currentQuestionIndex === 0);

  // Change Next button text to Submit on the last question
  nextBtn.textContent =
    currentQuestionIndex === quizData.questions.length - 1 ? 'Submit' : 'Next';
}

// Navigate to next question or submit quiz
function nextQuestion() {
  if (userAnswers[currentQuestionIndex] === null) {
    alert('Please select an answer before proceeding.');
    return;
  }

  if (currentQuestionIndex < quizData.questions.length - 1) {
    currentQuestionIndex++;
    loadQuestion(currentQuestionIndex);
  } else {
    submitQuiz();
  }
}

// Navigate to previous question
function previousQuestion() {
  if (currentQuestionIndex > 0) {
    currentQuestionIndex--;
    loadQuestion(currentQuestionIndex);
  }
}

// Submit quiz and calculate score
function submitQuiz() {
  if (quizCompleted) return;
  quizCompleted = true;

  // Hide the quiz interface and navigation buttons
  document.getElementById('quiz').classList.add('hidden');
  prevBtn.classList.add('hidden');
  nextBtn.classList.add('hidden');

  // Calculate score and build detailed feedback
  let score = 0;
  let feedback = '';

  quizData.questions.forEach((question, index) => {
    const userAnswerIndex = userAnswers[index];
    const isCorrect = userAnswerIndex === question.correctAnswer;
    if (isCorrect) score++;

    feedback += `
      <div style="margin-bottom: 20px;">
        <p><strong>Question ${index + 1}:</strong> ${question.question}</p>
        <p>Your answer: ${question.options[userAnswerIndex]}</p>
        <p>Correct answer: ${question.options[question.correctAnswer]}</p>
        <p>Explanation: ${question.explanation}</p>
      </div>
    `;
  });

  // Display result
  const percentage = (score / quizData.questions.length) * 100;
  resultContainer.textContent = `You scored ${score} out of ${quizData.questions.length} (${percentage.toFixed(2)}%)`;
  resultContainer.classList.remove('hidden');

  // Display detailed feedback
  feedbackContainer.innerHTML = feedback;
  feedbackContainer.classList.remove('hidden');
}

// Event Listeners
nextBtn.addEventListener('click', nextQuestion);
prevBtn.addEventListener('click', previousQuestion);

// Initialize quiz
loadQuestion(currentQuestionIndex);