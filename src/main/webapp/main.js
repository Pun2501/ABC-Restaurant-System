function fetchMenuItems() {
    fetch('/getMenuItems')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log('Menu Items:', data);
            // Process the data
        })
        .catch(error => {
            console.error('Error fetching menu items:', error);
        });
}

// Call fetchMenuItems on page load or as needed
window.onload = fetchMenuItems;
