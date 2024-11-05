
// app/javascript/application.js

// Import Turbo and Stimulus libraries
import "@hotwired/turbo-rails";
import "@hotwired/stimulus";
import "@hotwired/stimulus-loading";

// Import Bootstrap JavaScript
import "bootstrap";  // Ensure Bootstrap is imported here

// Import Dark Mode Toggle Script
import "./dark_mode_toggle";

// Ensure compatibility with Turbo for DELETE requests in links
document.addEventListener("turbo:load", () => {
    console.log("Turbo has loaded the page");
});