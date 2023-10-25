<!DOCTYPE html>
<html>
<head>
    <title>Fraud Detection Users</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<h2>Fraud Detection Database</h2>

<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$dbname = "fraud_detection";

// Create a database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Perform a query to retrieve data from the 'Users' table
$sql = "SELECT * FROM Users";
$result = $conn->query($sql);

// Display data in an HTML table
if ($result->num_rows > 0) {
    echo "<table>";
    echo "<tr><th>User ID</th><th>Username</th><th>Role ID</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["UserID"] . "</td><td>" . $row["Username"] . "</td><td>" . $row["RoleID"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "No data found.";
}

// Close the database connection
$conn->close();
?>

</body>
</html>
