<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #3E3E3E;">
    <a class="navbar-brand" href="/">EX Новости</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse container-xl">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
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
        </ul>
        <#if name != "Гость">
            <div class="btn-group">
                <button type="button" class="btn btn-outline-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${name}
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/user/${user.username}">Профиль</a>
                    <a class="dropdown-item" href="#">Посты</a>
                    <div class="dropdown-divider"></div>
                    <form action="/logout" method="post">
                        <button type="submit" class="dropdown-item">Выход</button>
                    </form>
                </div>
            </div>
        <#else>
            <button type="submit" class="btn btn-light mr-2"><a href="/login"  style="text-decoration: none; color: black">Войти</a></button>
            <button type="submit" class="btn btn-light"><a href="/registration"  style="text-decoration: none; color: black">Регистрация</a></button>
        </#if>
    </div>
</nav>