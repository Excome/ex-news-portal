<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <h2 style="text-align: center">Пользователь <span style="color: orange; font-weight: bold">${user.username}</span></h2>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4">
            <form action="/admin/ue/${user.id}" method="get" name="userForm">
                <div class="form-group">
                    <label for="email">Электронная почта</label>
                    <input type="email" name="email" class="form-control" value="${user.email}"  placeholder="name@example.com">
                </div>
                <div class="form-group">
                    <label for="username">Имя пользователя</label>
                    <input type="text" name="username" class="form-control" value="${user.username}">
                </div>
                <div class="form-group">
                    <label for="surname">Фамилия</label>
                    <input type="text" name="surname" class="form-control" value="${user.surname}">
                </div>
                <div class="form-group">
                    <label for="name">Имя</label>
                    <input type="text" name="name" class="form-control" value="${user.name}">
                </div>
                <div class="form-group">
                    <label for="patronymic">Отчество</label>
                    <input type="text" name="patronymic" class="form-control" value="${user.patronymic}">
                </div>
                <div class="form-group">
                    <label for="roles">Роли пользователя:</label>
                    <#list roles as role>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="${role}" value="${role.name}" ${user.roles?seq_contains(role)?string("checked", "")}>
                                ${role.name}
                            </label>
                        </div>
                    </#list>
                </div>
                <button type="submit" class="btn btn-primary" style="float: left">Сохранить</button>
            </form>
            <form action="/admin/ue/${user.id}/delete" method="post">
                <button type="submit" class="btn btn-danger" style="float: right">Удалить</button>
            </form>
        </div>
        <div class="col-3 ml-5">
            <form action="/admin/ue/${user.id}" method="post">
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">Подтверждение пароля</label>
                    <input type="password" name="passwordConfirm" class="form-control">
                </div>
                <div class="form-group">
                    <label for="adminPassword">Пароль администратора</label>
                    <input type="password" name="adminPassword" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Изменить пароль</button>
            </form>
        </div>
    </div>
</@cmn.page>