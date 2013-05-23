<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEGATRON FAILURE</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1 onmouseover="style.color='red'" onmouseout="style.color='yellow'">TRANSFORMERS ERROR</h1>
        <p>${failure.stackTrace}</p>
    </body>
</html>
