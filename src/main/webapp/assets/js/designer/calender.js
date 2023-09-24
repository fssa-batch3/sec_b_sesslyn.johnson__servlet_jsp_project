const calendar = document.querySelector(".calendar"),
  date = document.querySelector(".date"),
  daysContainer = document.querySelector(".days"),
  prev = document.querySelector(".prev"),
  next = document.querySelector(".next"),
  todayBtn = document.querySelector(".today-btn"),
  gotoBtn = document.querySelector(".goto-btn"),
  dateInput = document.querySelector(".date-input"),
  eventDay = document.querySelector(".event-day"),
  eventDate = document.querySelector(".event-date"),
  eventsContainer = document.querySelector(".events"),
  addEventBtn = document.querySelector(".add-event"),
  addEventWrapper = document.querySelector(".add-event-wrapper"),
  addEventCloseBtn = document.querySelector(".close"),
  addEventTitle = document.querySelector(".event-name"),
  addEventFrom = document.querySelector(".event-time-from"),
  addEventTo = document.querySelector(".event-time-to"),
  addEventSubmit = document.querySelector(".add-event-btn ");
  dateValue = document.querySelector("#user_date");
let today = new Date();
let activeDay;
let month = today.getMonth();
let year = today.getFullYear();
let jsonData; 

(async () => {
  await fetchDataAndUpdatePage();
  initCalendar();
})();

async function fetchDataAndUpdatePage() {
  let response = null; 
  const root = window.location.origin + "/minimalweb";

  const urlParams = new URLSearchParams(window.location.search);
  const idParam = urlParams.get('id');
if(idParam <= 0){
  response = await fetch(`${root}/designer/appointment/new`);
}else{
	 response = await fetch(`${root}/designer/appointment/new?id=${String(idParam)}`);
}
  if (!response.ok) {
    console.log(`HTTP Error! Status: ${response.status}`);
    return;
  }

  const data = await response.json();
  jsonData = data.data;
  const userDetails = data.data.userDetails;
  let appointmentDetails = jsonData.appointmentDetails; 
  const designerDetails = data.data.designerDetails;
   const error = data.data.error;
 

  const userEmailElement = document.getElementById('user_email');
  const userPhoneElement = document.getElementById('user_phone');
  const designerIdElement = document.getElementById('designer_id');

  if (userDetails) {
    userEmailElement.value = userDetails.email; 
    userPhoneElement.value = userDetails.phoneNumber; 
    designerIdElement.value = designerDetails.id; 
  }
  initCalendar();
  console.log(appointmentDetails);
}
 
 
function formatDate(inputDate) {
  const dateParts = inputDate.split(" ");
  const day = dateParts[0].replace(/\D/g, "");
  const monthName = dateParts[1];
  const year = dateParts[2];

  const monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  const month = (monthNames.indexOf(monthName) + 1).toString().padStart(2, "0");
  const formattedDate = `${year}-${month}-${day}`;

  return formattedDate;
}


const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

// Function to add days in days with class day and prev-date next-date on previous month and next month days and active on today
function initCalendar() {
	let appointmentDetails = jsonData.appointmentDetails; 
  const firstDay = new Date(year, month, 1);
  const lastDay = new Date(year, month + 1, 0);
  const prevLastDay = new Date(year, month, 0);
  const prevDays = prevLastDay.getDate();
  const lastDate = lastDay.getDate();
  const day = firstDay.getDay();
  const nextDays = 7 - lastDay.getDay() - 1;

  date.innerHTML = months[month] + " " + year;

  let days = "";

  for (let x = day; x > 0; x--) {
    days += `<div class="day prev-date">${prevDays - x + 1}</div>`;
  }

  for (let i = 1; i <= lastDate; i++) {
    // Check if an event is present on that day
    let event = false;
   
    appointmentDetails.forEach((appointment) => {
      const appointmentDate = new Date(appointment.date);
      const appointmentDay = appointmentDate.getDate();
      const appointmentMonth = appointmentDate.getMonth();
      const appointmentYear = appointmentDate.getFullYear();
      if (
	
        appointmentDay === i &&
        appointmentMonth === month &&
        appointmentYear === year
      ) {
        event = true;
      }
    });

    if (
      i === new Date().getDate() &&
      year === new Date().getFullYear() &&
      month === new Date().getMonth()
    ) {
      activeDay = date;
      getActiveDay(i);
      updateEvents(i,year,month);
      if (event) {
        days += `<div class="day today active event">${i}</div>`;
      } else {
        days += `<div class="day today active">${i}</div>`;
      }
    } else {
      if (event) {
        days += `<div class="day event">${i}</div>`;
      } else {
        days += `<div class="day">${i}</div>`;
      }
    }
  }

  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="day next-date">${j}</div>`;
  }
  daysContainer.innerHTML = days;
  addListener();
}

function prevMonth() {
  month--;
  if (month < 0) {
    month = 11;
    year--;
  }
  initCalendar();
}

function nextMonth() {
  month++;
  if (month > 11) {
    month = 0;
    year++;
  }
  initCalendar();
}

prev.addEventListener("click", prevMonth);
next.addEventListener("click", nextMonth);

function  addListener(){
let appointmentDetails = jsonData.appointmentDetails; 
  const days = document.querySelectorAll(".day");
  days.forEach((day) => {
    day.addEventListener("click", (e) => {
      getActiveDay(e.target.innerHTML);
      updateEvents(Number(e.target.innerHTML),year,month);
      activeDay = Number(e.target.innerHTML);
   
      days.forEach((day) => {
        day.classList.remove("active");
      });
      // If clicked prev-date or next-date, switch to that month
      if (e.target.classList.contains("prev-date")) {
        prevMonth();
        // Add active to clicked day after the month is changed
        setTimeout(() => {
          // Add active where no prev-date or next-date
          const days = document.querySelectorAll(".day");
          days.forEach((day) => {
            if (
              !day.classList.contains("prev-date") &&
              day.innerHTML === e.target.innerHTML
            ) {
              day.classList.add("active");
            }
          });
        }, 100);
      } else if (e.target.classList.contains("next-date")) {
        nextMonth();
        // Add active to clicked day after the month is changed
        setTimeout(() => {
          const days = document.querySelectorAll(".day");
          days.forEach((day) => {
            if (
              !day.classList.contains("next-date") &&
              day.innerHTML === e.target.innerHTML
            ) {
              day.classList.add("active");
            }
          });
        }, 100);
      } else {
        e.target.classList.add("active");
      }
    });
  });
}

todayBtn.addEventListener("click", () => {
  today = new Date();
  month = today.getMonth();
  year = today.getFullYear();
  initCalendar();
});

dateInput.addEventListener("input", (e) => {
  dateInput.value = dateInput.value.replace(/[^0-9/]/g, "");
  if (dateInput.value.length === 2) {
    dateInput.value += "/";
  }
  if (dateInput.value.length > 7) {
    dateInput.value = dateInput.value.slice(0, 7);
  }
  if (e.inputType === "deleteContentBackward") {
    if (dateInput.value.length === 3) {
      dateInput.value = dateInput.value.slice(0, 2);
    }
  }
});

gotoBtn.addEventListener("click", gotoDate);

function gotoDate() {
  console.log("here");
  const dateArr = dateInput.value.split("/");
  if (dateArr.length === 2) {
    if (dateArr[0] > 0 && dateArr[0] < 13 && dateArr[1].length === 4) {
      month = dateArr[0] - 1;
      year = dateArr[1];
      initCalendar(jsonData.data.appointmentDetails);
      return;
    }
  }
  alert("Invalid Date");
}

function getActiveDay(date) {
  const day = new Date(year, month, date);
  const dayName = day.toString().split(" ")[0];
  eventDay.innerHTML = dayName;
  eventDate.innerHTML = date + " " + months[month] + " " + year;

  dateValue.value = dayName;
  dateValue.value = formatDate(date + " " + months[month] + " " + year);
}

function updateEvents(date, year, month) {
	let appointmentDetails = jsonData.appointmentDetails; 
  const events = [];

  // Loop through the appointmentDetails and filter events for the given date
  appointmentDetails.forEach((appointment) => {
    const appointmentDate = new Date(appointment.date);

    if (
      appointmentDate.getDate() === date &&
      appointmentDate.getMonth() === month &&
      appointmentDate.getFullYear() === year
    ) {
      events.push(appointment);
    }
  });

  // Clear existing events
  eventsContainer.innerHTML = '';

  if (events.length === 0) {
    eventsContainer.innerHTML = `<div class="no-event">
      <h3>No Events</h3>
    </div>`;
  } else {
    events.forEach((appointment) => {
      const formattedTime = convertTime(appointment.time);

      // Create an event div for each appointment
      const eventDiv = document.createElement('div');
      eventDiv.classList.add('event');
      eventDiv.innerHTML = `
        <div class="title">
          <i class="fas fa-circle"></i>
          <h3 class="event-title">Appointment</h3>
        </div>
        <div class="event-time">
          <span class="event-time">${formattedTime}</span>
        </div>`;

      eventsContainer.appendChild(eventDiv);
    });
  }
}

addEventBtn.addEventListener("click", () => {
  addEventWrapper.classList.toggle("active");
});

addEventCloseBtn.addEventListener("click", () => {
  addEventWrapper.classList.remove("active");
});

document.addEventListener("click", (e) => {
  if (e.target !== addEventBtn && !addEventWrapper.contains(e.target)) {
    addEventWrapper.classList.remove("active");
  }
});

addEventSubmit.addEventListener("click", () => {
  const eventTitle = addEventTitle.value;
  const eventTimeFrom = addEventFrom.value;
  const eventTimeTo = addEventTo.value;
  if (eventTitle === "" || eventTimeFrom === "" || eventTimeTo === "") {
    alert("Please fill all the fields");
    return;
  }

  //check correct time format 24 hour
  const timeFromArr = eventTimeFrom.split(":");
  const timeToArr = eventTimeTo.split(":");
  if (
    timeFromArr.length !== 2 ||
    timeToArr.length !== 2 ||
    timeFromArr[0] > 23 ||
    timeFromArr[1] > 59 ||
    timeToArr[0] > 23 ||
    timeToArr[1] > 59
  ) {
    alert("Invalid Time Format");
    return;
  }
  });
  
// Helper function to convert time to a more readable format
function convertTime(time) {
  const [hours, minutes] = time.split(":");
  const ampm = hours >= 12 ? "PM" : "AM";
  const formattedHours = hours % 12 || 12;
  return `${formattedHours}:${minutes} ${ampm}`;
}

function closeAlert() {
	fetchDataAndUpdatePage();
  var alertDiv = document.getElementById("popup1");
  alertDiv.style.display = "none";
  
}