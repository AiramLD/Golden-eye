<!DOCTYPE html>  
<html lang="en">  
<head>
    <meta charset="UTF-8">
    <title>Error</title>
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
    div {
        text-align: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }
</style>
<body class="container">
  <div style="text-align: center;">
    <h1>Error: ${errorStatus}</h1>
    <#if errorMessage??>
        <p>Message: ${errorMessage}</p>
    </#if>
    <p><a href="/">Back to Home</a></p>
  </div>
</body>
</html>
