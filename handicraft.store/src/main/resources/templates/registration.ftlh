<!DOCTYPE  html>
<html>
<head>
    <title>handcraft.store</title>
</head>
<body>
<h4>Регистрация</h4>
<from action="/registration" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Почта: <input type="email" name="email"><br><br>
    Пароль: <input type="text" name="phoneNumber"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    Пароль: <input type="submit" value="Зарегистрироваться"/>
</from>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>