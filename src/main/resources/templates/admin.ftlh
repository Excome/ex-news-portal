<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Ex News</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"1
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <script src="https://cdn.tiny.cloud/1/ehqa4ugadvzad8ldlb6ei5adw2qek0z2vqvgxaw2wp47riiu/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body>
<#include "parts/navbar.ftlh">
<div class="content container-fluid mt-5">
    <div class="row">
        <div class="col-6">
            <div class="admin-table">
                <h2 class="admin-table-title">Пользователи</h2>
                <form action="/admin/" method="get">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" name="username" placeholder="Username" value="${RequestParameters.username!}">
                        <button type="submit" class="btn btn-outline-info" style="margin-left: 1%">Найти</button>
                    </div>
                </form>
                <table class="table" style="text-align: center">
                    <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Роли</th>
                        <th scope="col">Фамилия</th>
                        <th scope="col">Имя</th>
                        <th scope="col">Отчество</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list userList as user>
                        <tr>
                            <td scope="row">${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td><#list user.roles as role>${role.name} <#sep>, </#list></td>
                            <th>${user.surname}</th>
                            <th>${user.name}</th>
                            <th>${user.patronymic}</th>
                            <td><a class="btn btn-link" href="/admin/ue/${user.id}">Изменить</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
            <div class="admin-table">
                <h2 class="admin-table-title">Посты</h2>
                <form action="/admin/" method="get">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" name="topic" placeholder="Заголовок" value="${RequestParameters.topic!}">
                        <button type="submit" class="btn btn-outline-info" style="margin-left: 1%">Найти</button>
                    </div>
                </form>
                <table class="table" style="text-align: center">
                    <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Заголовок</th>
                        <th scope="col">Автор</th>
                        <th scope="col">Дата создания</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list postList as post>
                        <tr>
                            <td scope="row">${post.id}</td>
                            <td>${post.topic}</td>
                            <td><a href="/user/${post.author.id}">${post.author.username}</a></td>
                            <th>${post.createdDate}</th>
                            <td><a class="btn btn-link" href="/post/${post.id}/edit">Изменить</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script>
    tinymce.init({
        selector: '#mytextarea',
        plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
        toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
        toolbar_mode: 'floating',
        tinycomments_mode: 'embedded',
        tinycomments_author: 'Author name',
    });
</script>
</body>
</html>