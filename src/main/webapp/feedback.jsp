<!DOCTYPE html>
<html>
<head>
    <title>Student Feedback</title>
    <meta charset="UTF-8">
</head>
<body>

    <h1>Student Feedback Form</h1>

    <form action="feedback" method="post">

        <label>Name:</label><br>
        <input type="text" name="name" required>
        <br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required>
        <br><br>

        <label>Feedback:</label><br>
        <textarea name="feedback" rows="5" cols="40" required></textarea>
        <br><br>

        <label>Rating:</label><br>
        <select name="rating">
            <option value="5">5 - Excellent</option>
            <option value="4">4 - Very Good</option>
            <option value="3">3 - Good</option>
            <option value="2">2 - Average</option>
            <option value="1">1 - Poor</option>
        </select>
        <br><br>

        <button type="submit">Submit Feedback</button>

    </form>

    <br>

    <a href="index.jsp">Back to Home</a>

</body>
</html>


