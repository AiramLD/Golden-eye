<!DOCTYPE html>  
<html lang="en">  
    <head>
        <meta charset="UTF-8">
        <title>GoldenEye</title>
    </head>
    <body>
        <h1>Form for employees</h1>
         <form action="#" method="post" onsubmit="showDepartments()">
                 <div class="container">
                     <label for="name">Name:</label><br>
                     <input type="text" id="name" name="name" required><br><br>

                     <label for="Surname">Surname:</label><br>
                     <input type="text" id="Surname" name="Surname" required><br><br>

                     <div class="form-group">
                         <label for="office">Office:</label><br>
                         <select class="form-control" id="office" name="office" required onchange="showDepartments()">
                             <option selected hidden disabled value="">Choose one of our offices</option>
                             <option value="milan">Milán</option>
                             <option value="spain">Spain</option>
                             <option value="newYork">New York</option>
                         </select>
                     </div>
                        <br>

                     <div class="form-group" id="Department">
                         <label for="department">Department:</label><br>
                         <select class="form-control" id="department" name="department" required>
                             <option selected hidden disabled value="">Choose a Department</option>
                             <option value="design">Design</option>
                             <option value="business">Business</option>
                             <option value="advertising">Advertising</option>
                             <option value="Research&andDevelopment"> Research & development </option>

                         </select>
                     </div>

                     <input type="submit" value="Send">
                 </div>
             </form>
    </body>
</html>
<script>
        
        let selectOffice = document.getElementById("office");
        let selectDepartment = document.getElementById("department");
        let hideDepartment = document.getElementById("hideSelect");

        selectOffice.addEventListener("change", function() {

            hideDepartment.classList.remove('d-none');
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

            selectDepartment.disabled = false;
        });

        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("emailForm").addEventListener("submit", function(event) {
            event.preventDefault(); 
        
            let xhr = new XMLHttpRequest();
        
            xhr.open("POST", "/generate", true);
        
            xhr.onload = function() {
                let errorDiv = document.getElementById("errorMessage");
                let emailDiv = document.getElementById("generatedEmail");
                if (xhr.status === 200) {
                    errorDiv.classList.add('d-none');
                    emailDiv.innerHTML = xhr.responseText.toLowerCase();
                } else {
                    emailDiv.innerHTML = "";
                    errorDiv.classList.remove('d-none');
                    errorDiv.innerHTML = "Error: " + xhr.status;
                }
            };
        
            xhr.send(new FormData(this));
            });
        });
</script>

  