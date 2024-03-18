<!DOCTYPE html>  
<html lang="en">  
<head>
    <meta charset="UTF-8">
    <title>GoldenEye</title>
</head>
<body>
    <h1>Form for employees</h1>
    <form action="#" method="post">
        <div class="container">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="surname">Surname:</label><br>
            <input type="text" id="surname" name="surname" required><br><br>

            <div class="form-group">
                <label for="office">Office:</label><br>
                <select class="form-control" id="office" name="office" required>
                    <option selected hidden disabled value="">Choose one of our offices</option>
                    <option value="milan">Milán</option>
                    <option value="spain">Spain</option>
                    <option value="newyork">New York</option>
                </select>
            </div>
            <br>

            <div class="form-group" id="department" style="display: none;">
                <label for="department">Department:</label><br>
                <select class="form-control" id="departmentSelect" name="department" required>
                    <option selected hidden disabled value="">Choose a department</option>
                    <option value="Design">Design</option>
                    <option value="Business">Business</option>
                    <option value="Advertising">Advertising</option>
                    <option value="Research & Development">Research & Development</option>
                </select>
            </div>

            <input type="submit" value="Send">
        </div>
    </form>
    <script>
        // Función para mostrar los departamentos basados en la selección de la oficina
        function showDepartments() {
            let selectOffice = document.getElementById("office");
            let selectDepartment = document.getElementById("department");
            let departmentSelect = document.getElementById("departmentSelect");

            let selectedOffice = selectOffice.value;

            departmentSelect.innerHTML = "";

            if (selectedOffice) {
                let departments = {
                    milan: ["Design", "Business", "Advertising"],
                    spain: ["Research & Development", "Business"],
                    newyork: ["Business", "Advertising"]
                };

                departments[selectedOffice].forEach(function(departmentName) {
                    let option = document.createElement("option");
                    option.value = departmentName.toLowerCase().replace(/\s+/g, ''); 
                    option.text = departmentName;
                    departmentSelect.add(option);
                });

                selectDepartment.style.display = "block"; // Mostrar el elemento de selección de departamento
            } else {
                selectDepartment.style.display = "none"; // Ocultar el elemento de selección de departamento si no se selecciona una ciudad
            }
        }

        // Ejecutar la función showDepartments al cargar la página y al cambiar la selección de la oficina
        window.onload = function() {
            showDepartments();
            document.getElementById("office").addEventListener("change", showDepartments);
        };
    </script>
</body>
</html>
