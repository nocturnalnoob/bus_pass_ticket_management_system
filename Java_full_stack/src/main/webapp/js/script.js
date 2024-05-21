/**
 * 
 */
/**
 * 
 */
function confirmDelete() {
    return confirm("Are you sure you want to delete this animal?");
}

// Example: Validate the input fields before submitting the form
function validateForm() {
    var name = document.getElementById("name").value;
    var species = document.getElementById("species").value;
    var age = document.getElementById("age").value;

    if (name == "" || species == "" || age == "") {
        alert("All fields are required!");
        return false;
    }

    // Additional validation logic if needed

    return true;
}