console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=03739854bd818e374da405d52ab7f9b9",
  success(data) {
    console.log("Here is the weather today!")
    console.log(data);
  },
  error() {
    console.error("Error; could not retrieve weather from the interwebs.");
  },
});
// Add another console log here, outside your AJAX request
console.log("End log");
