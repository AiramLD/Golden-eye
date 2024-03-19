<!DOCTYPE html>  
<html lang="en">  
    <head>
        <meta charset="UTF-8">
        <title>Your e-mail</title>
    </head>
   <style>
    .container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 2rem;
        background: #f8f9fa;
        font: 1.2rem Arial, sans-serif;
        color: #343a40;
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
        flex-direction: column;
        padding: 2rem;
        background: #f8f9fa;
        font: 1.2rem Arial, sans-serif;
        color: #343a40;
        
    }

    h1 {
        color: #343a40;
        font: 1.5rem Arial, sans-serif;
        margin-bottom: 1rem;
        text-align: center;
        font-weight: bold;
    }

    p {
        color: #343a40;
        font: 1.2rem Arial, sans-serif;
        margin-bottom: 1rem;
        text-align: center;
        font-weight: bold;
    }
</style>
    <body>
        <div class="container" style="text-align: center;">
            <div class="card" >
                <h1>Your e-mail for Goldeneye</h1>
                <p>${email}</p>
            </div>
        </div>

    </body>
</html>