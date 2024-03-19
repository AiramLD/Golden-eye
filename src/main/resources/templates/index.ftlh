<!DOCTYPE html>  
<html lang="en">  
<head>
    <meta charset="UTF-8">
    <title>Goldeneye</title>
</head>
<style>
    body, .container, .card, form, label, input, select, .btn-primary {
        font: 1.2rem Arial, sans-serif;
        color: #343a40;
    }

    body {
        background: #f8f9fa;
    }

    .container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 2rem;
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,.2);
        width: 30rem;
        margin: 2rem;
        padding: 1rem;
        background: #fff;
        border-radius: .5rem;
        border: 1px solid #ced4da;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-body {
        padding: 2rem;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin: 2rem 0;
    }

    label {
        margin: 1rem 0 .5rem;
        display: block;
        text-align: left;
        font-weight: bold;
    }

    input, select {
        margin: .5rem 0;
        padding: .5rem;
        border: 1px solid #ced4da;
        border-radius: .25rem;
        width: 100%;
        box-sizing: border-box;
        font-weight: bold;
        background: url('data:image/svg+xml;utf8,<svg fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path fill="#343a40" d="M15.2 6.3l-2.1-2.1c-.4-.4-1-.4-1.4 0L10 6.3 7.5 3.9c-.4-.4-1-.4-1.4 0l-2.1 2.1c-.4.4-.4 1 0 1.4L7.5 10l-2.4 2.5c-.4.4-.4 1 0 1.4l2.1 2.1c.4.4 1 .4 1.4 0L10 13.7l2.5 2.4c.4.4 1 .4 1.4 0l2.1-2.1c.4-.4.4-1 0-1.4L12.5 10l2.4-2.5c.4-.4.4-1 0-1.4z"/></svg>') no-repeat right .75rem center/8px 10px;
    }

    .btn-primary {
        background: #007bff;
        border-color: #007bff;
        color: #fff;
        font-weight: bold;
        padding: .5rem 1rem;
        border-radius: .25rem;
        margin-top: 1rem;
        width: 100%;
        box-sizing: border-box;
    }

    .btn-primary:hover {
        transform: none;
    }
</style>

    <body class="container" style="display: flex; justify-content: center; height: 100vh;">
        <div class="card" style="width: 30rem;">
            <div class="card-body" style="text-align: center;" >
                <h1>Email generator for Goldeneye</h1>
            <form action="/postEmail" method="post" onsubmit="return validateForm()" style="display: flex; flex-direction: column; align-items: center;">
                    <div>
                        <label for="name" class="form-label">First Name:</label>
                        <input class="form-control" type="text" name="name" id="name" required>
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
                    <div id="department_div" style="display: none;">
                        <label for="department" class="form-label">Department:</label>
                        <select name="department" id="department" class="form-select" required>
                        </select>
                    </div>
                    <div style="margin-top: 1rem;" >
                        <button type="submit" class="btn btn-primary">Generate</button>
                    </div>
                </form>
            </div>
        </div>

       <script>
        function validateForm() {
            var nameInput = document.getElementById('name').value;
            var surnameInput = document.getElementById('surname').value;
            var regex = /^[A-Za-z]+$/;

            if (!regex.test(nameInput) || !regex.test(surnameInput)) {
                alert("Solo se permiten letras en el nombre y el apellido.");
                return false; 
            }

            return true; // Permite que el formulario se envíe si la validación es exitosa
        }

        function validateInput(input) {
            var regex = /^[A-Za-z]+$/; 

            if (!regex.test(input.value)) {
                input.value = input.value.replace(/[^A-Za-z]/g, ''); 
            }
        }

    document.addEventListener('DOMContentLoaded', function() {
        const departments = {
            milan: ['Design', 'Business', 'Advertising'],
            spain: ['Research & development', 'Business'],
            newyork: ['Business', 'Advertising']
        };

        function updateDepartment() {
            const office = document.getElementById('office').value;
            const department = document.getElementById('department');
            const departmentDiv = document.getElementById('department_div');
            departmentDiv.style.display = 'block';

            department.innerHTML = '';
            departments[office]?.forEach(departmentName => {
                const option = new Option(departmentName, departmentName);
                department.add(option);
            });
        }

        document.getElementById('office').addEventListener('change', updateDepartment);
    });
</script>

    </body>
    </html>
