<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row mb-3">
        <div class="col">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="/auth/settings/profile">Профиль</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/auth/settings/account">Аккаунт</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">В разработке</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div>Данные аккаунта</div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-8">
            <form action="/auth/settings/account/editPass" method="post" name="passForm">
                <div class="form-group">
                    <label for="currentPassword">Текущий пароль</label>
                    <input type="password" name="currentPassword" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Новый пароль</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">Новый пароль еще раз</label>
                    <input type="password" name="passwordConfirm" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Изменить пароль</button>
            </form>
        </div>
    </div>
</@cmn.page>