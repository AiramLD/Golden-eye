<!DOCTYPE html>  
<html lang="en">  
<head>
    <meta charset="UTF-8">
    <title>GoldenEye</title>
</head>
<body>
    <h1>Form for employees</h1>
    <form action="#" method="post" onsubmit="showDepartments(event)">
        <div class="container">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="surname">surname:</label><br>
            <input type="text" id="surname" name="surname" required><br><br>

            <div class="form-group">
                <label for="office">Office:</label><br>
                <select class="form-control" id="office" name="office" required onchange="showDepartments()">
                    <option selected hidden disabled value="">Choose one of our offices</option>
                    <option value="milan">Milán</option>
                    <option value="spain">Spain</option>
                    <option value="newyork">New York</option>
                </select>
            </div>
            <br>

            <div class="form-group" id="department">
                <label for="department">department:</label><br>
                <select class="form-control" id="departmentSelect" name="department" required>
                    <option selected hidden disabled value="">Choose a department</option>
                    <option value="design">Design</option>
                    <option value="business">Business</option>
                    <option value="advertising">Advertising</option>
                    <option value="research&development">Research & development</option>
                </select>
            </div>

            <input type="submit" value="Send">
        </div>
    </form>
    <script>
        function showDepartments(event) {
            event.preventDefault(); 
            let selectOffice = document.getElementById("office");
            let selectDepartment = document.getElementById("departmentSelect");

            let selectedOffice = selectOffice.value;

            selectDepartment.innerHTML = "";

            let option1 = document.createElement("option");
            option1.value = "design";
            option1.text = "Design";

            let option2 = document.createElement("option");
            option2.value = "business";
            option2.text = "Business";

            let option3 = document.createElement("option");
            option3.value = "advertising";
            option3.text = "Advertising";

            let option4 = document.createElement("option");
            option4.value = "research&development";
            option4.text = "Research & development";

            switch (selectedOffice) {
                case "milan":
                    selectDepartment.add(option1);
                    selectDepartment.add(option2);
                    selectDepartment.add(option3);
                    break;
                case "spain":
                    selectDepartment.add(option4);
                    selectDepartment.add(option2);
                    break;
                case "newyork":
                    selectDepartment.add(option2);
                    selectDepartment.add(option3);
                    break;
                default:
                    break;
            }
        }
    </script>
</body>
</html>

  