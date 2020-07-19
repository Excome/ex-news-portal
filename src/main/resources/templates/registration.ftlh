<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col-5">
            <form action="/registration" method="post" name="userForm">
                <div class="form-group">
                    <label for="email">Электронная почта</label>
                    <input type="email" name="email" class="form-control"  placeholder="name@example.com">
                </div>
                <div class="form-group">
                    <label for="username">Имя пользователя</label>
                    <input type="text" name="username" class="form-control">
                    <small id="emailHelp" class="form-text text-muted">Введите имя пользователя с помощью которого будет осуствляться вход в приложение</small>
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">Подтверждение пароля</label>
                    <input type="password" name="passwordConfirm" class="form-control">
                </div>
                <div class="form-group">
                    <label for="surname">Фамилия</label>
                    <input type="text" name="surname" class="form-control">
                </div>
                <div class="form-group">
                    <label for="name">Имя</label>
                    <input type="text" name="name" class="form-control">
                </div>
                <div class="form-group">
                    <label for="patronymic">Отчество</label>
                    <input type="text" name="patronymic" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Регистрация</button>
            </form>
        </div>
    </div>
</@cmn.page>