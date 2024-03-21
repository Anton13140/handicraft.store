<!DOCTYPE  html>
<html>
<head>
    <title>handcraft.store</title>
</head>
<body>
<h4>Авторизация</h4>
<from action="/login" method="post">
    Почта: <input type="email" name="username"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    Пароль: <input type="submit" value="Вход"/>
</from>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>