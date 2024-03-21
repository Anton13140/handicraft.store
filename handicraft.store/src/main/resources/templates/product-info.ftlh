<!DOCTYPE  html>
<html>
<head>
    <title>handcraft.store</title>
</head>
<body>
<h1>handicraft.store</h1><hr>
<h4>Подробная информация о товаре </h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b> Название товара: </b>${product.name}<br>
<b> Описание: </b>${product.description}<br>
<b> Цена: </b>${product.prise}<br>
<b> Количество: </b>${product.quantity}<br>
</body>
</html>