document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();

    // Fetch form data
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    // Validate form data
    if (name && email && message) {
        alert('Thank you for your message, ' + name + '!');
        // Here you can add more functionality such as sending the form data to your server
    } else {
        alert('Please fill in all fields.');
    }
});
