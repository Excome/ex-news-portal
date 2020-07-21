<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #3E3E3E;">
    <a class="navbar-brand" href="/">EX Новости</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse container-xl">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="/">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/posts">Новости</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/admin">Админ панель</a>
                </li>
            </#if>
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0 ml-2">
                    <input class="form-control mr-sm-2" type="search" placeholder="Ввод..">
                    <button class="btn btn-light my-2 my-sm-0" type="submit">Найти</button>
                </form>
            </li>
        </ul>
        <#if name != "Гость">
            <div class="navbar-text mr-3" style="color: white">
                ${name}
            </div>
            <form action="/logout" method="post">
                <button type="submit" class="btn btn-light">Выход</button>
            </form>
        <#else>
            <button type="submit" class="btn btn-light mr-2"><a href="/login"  style="text-decoration: none; color: black">Войти</a></button>
            <button type="submit" class="btn btn-light"><a href="/registration"  style="text-decoration: none; color: black">Регистрация</a></button>
        </#if>
    </div>
</nav>