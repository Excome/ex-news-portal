<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col-5">
            <form action="/login" method="post" >
                <div class="form-group">
                    <label for="exampleInputEmail1">Имя пользователя</label>
                    <input type="text" name="username" class="form-control">
                    <small id="emailHelp" class="form-text text-muted">Введите имя пользователя указанное при регистрации</small>
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Войти</button>
                <button type="button" class="btn btn-outline-info"><a href="/registration" style="">Регистрация</a></button>
            </form>
        </div>
    </div>
</@cmn.page>