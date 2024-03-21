<!DOCTYPE  html>
<html>
<head>
    <title>handcraft.store</title>
</head>
<body>
<h1>handicraft.store</h1><hr>
<h4>Понель администратора</h4>
<table>
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    <#list users as user>
        <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}<#sep>, </#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
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
