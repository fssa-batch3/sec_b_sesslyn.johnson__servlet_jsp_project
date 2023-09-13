let profile_id = JSON.parse(localStorage.getItem("profile_id"));
let markDesigner = JSON.parse(localStorage.getItem("markDesigner")) || [];
const markUser = markDesigner.filter((e) => e.user_email === profile_id);
if (markUser.length > 0) {
  alert("You already took the test.");
  window.location.href="../homepage.html"
}
else{
/// dom references ///
let $question = document.getElementById("question");
let $score = document.getElementById("score");
let $feedback = document.getElementById("feedback");
let $start = document.getElementById("button");
let $form = document.getElementById("answer");
let $timer = document.getElementById("timer");

/// creating html elements inside section divs ///
function update(element, content, klass) {
  let p = element.firstChild || document.createElement("p");
  p.textContent = content;
  element.appendChild(p);
  if (klass) {
    p.className = klass;
  }
}

// declaring quiz as a multidimensional array
let quiz = {
  name: "Quiz for Designers",
  description: "Take this quiz to see how much you know about interior design!",
  questions: [
    { question: "What is the role of lighting in interior design?", answer: "Ambiance" },
    { question: "What is the purpose of space planning?", answer: "Efficiency" },
    { question: "What do interior designers focus on?", answer: "Harmony" },
    { question: "What do interior designers improve?", answer: "Layout" },
    { question: "What software do interior designers use? Give the short form", answer: "CAD" }
  ],
};

let score = 0; // initialize score
update($score, score);

// Event listeners
$start.addEventListener(
  "click",
  function () {
    play(quiz);
  },
  false
);

function hide(element) {
  element.style.display = "none";
}

function show(element) {
  element.style.display = "block";
}

// hide the form at the start of the game
hide($form);
let $interval;

function play(quiz) {
  // initialize timer and set up an interval that counts down
  let time = 150;
  update($timer, time);
  $interval = window.setInterval(countDown, 1000);

  // this is called every second and decreases the time
  function countDown() {
    // decrease time by 1
    time--;
    // update the time displayed
    update($timer, time);
    // the game is over if the timer has reached 0
    if (time <= 0) {
      updateFinalAns();
    }
  }

  // hide button and show form
  hide($start);
  show($form);

  $form.addEventListener(
    "submit",
    function (event) {
      event.preventDefault();
      check($form[0].value, quiz.questions[i].answer);
    },
    false
  );

  chooseQuestion();
}

let i = 0;
function chooseQuestion() {
  let question = quiz.questions[i].question;
  ask(question);
}

// ask question function
function ask(question) {
  update($question, question);
  $form[0].value = "";
  $form[0].focus();
}

// check answer function
// check answer function
function check(answer, expected_ans) {
  if (answer.toLowerCase() === expected_ans.toLowerCase()) {
    // increase score by 1
    score++;
    update($score, score);
  }
  i++;
  if (i === quiz.questions.length) {
    updateFinalAns();
  } else {
    chooseQuestion();
  }
}

function updateFinalAns() {
  // store the score in localStorage
  let profile_id = JSON.parse(localStorage.getItem("profile_id"));
  let markDesigner = JSON.parse(localStorage.getItem("markDesigner")) || [];
  markDesigner.push({
    user_email: profile_id,
    score
  });
  localStorage.setItem("markDesigner", JSON.stringify(markDesigner));

  // hide form, start button, and feedback
  hide($form);
  hide($start);
  hide($feedback);

  // stop the countdown interval
  window.clearInterval($interval);

  // show a thank you message
  alert("Thank you for attending the quiz.  Our team will be in touch with you soon.");
  window.location.href="../homepage.html"
}
};
