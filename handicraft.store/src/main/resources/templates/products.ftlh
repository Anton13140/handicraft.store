<!DOCTYPE  html>
<html>
<head>
    <title>handcraft.store</title>
</head>
<body>
<h1>handicraft.store</h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <from action="/login" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </from>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<hr>
<h4>Товары </h4>
<from action="/" method="get">
    Поиск по названию продукта: <input type="text" name="name"><br>
    <input type="submit" value="Поиск"/>
</from>
<#list products as product>
    <div>
        <p><b>${product.name}</b> ${product.prise} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Создать новый товар</h3>
    <from action="/product/create" method="post" enctype="multipart/from-data">
        Название товара: <input type="text", name="name"/><br><br>
        Описание: <input type="text", name="description"/><br><br>
        Цена: <input type="number", name="prise"/><br><br>
        Количество: <input type="number", name="quantity"/><br><br>
        Фото один: <input type="file", name="file1"/><br><br>
        Фото два: <input type="file", name="file2"/><br><br>
        Фото три: <input type="file", name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар"/>
    </from>
</#if>
</body>
</html>
