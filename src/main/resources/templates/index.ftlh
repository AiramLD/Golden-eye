<!DOCTYPE html>  
<html lang="en">  
<head>
    <meta charset="UTF-8">
    <title>Goldeneye</title>
</head>
<body class="container">
    <div>
        <div >
            <h1>Goldeneye</h1>
            <p></p>
            <form action="/getEmail">
                <div>
                    <label for="firstName" class="form-label">First Name:</label>
                    <input class="form-control" type="text" name="firstName" id="firstName" required>
                </div>
                <div>
                    <label for="surname" class="form-label">Surname:</label>
                    <input class="form-control" type="text" name="surname" id="surname" required>
                </div>
                <div>
                    <label for="office" class="form-label">Office:</label>
                    <select name="office" id="office" class="form-select" onchange="updateDepartment()" required>
                        <option value="" selected disabled>Select an office</option>
                        <option value="milan">Milan</option>
                        <option value="spain">Spain</option>
                        <option value="newyork">New York</option>
                    </select>
                </div>
                <div id="dept" hidden>
                    <label for="department" class="form-label">Department:</label>
                    <select name="department" id="department" class="form-select" required></select>
                </div>
                <div class="row justify-content-center mt-2">
                    <button type="submit" class="btn btn-primary">Generate</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const departments = {
            milan: ['Design', 'Business', 'Advertising'],
            spain: ['Research & development', 'Business'],
            newyork: ['Business', 'Advertising']
        };

        function updateDepartment() {
            const office = document.getElementById('office');
            const department = document.getElementById('department');
            const dept = document.getElementById('dept');
            dept.hidden = false;
            const selectedOffice = office.value;

            department.innerHTML = '';

            departments[selectedOffice].forEach(dept => {
                const option = new Option(dept, dept);
                department.add(option);
            });
        }
    </script>
</body>
</html>
