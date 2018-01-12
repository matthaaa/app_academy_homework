window.setTimeout(function () {
  alert('HAMMER TIME!');
}, 5000);

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
