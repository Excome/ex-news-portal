<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row mb-3">
        <div class="col">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="/auth/settings/profile">Профиль</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/auth/settings/account">Аккаунт</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">В разработке</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div>Данные профиля</div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-8">
            <form action="/auth/settings/profile" method="get" name="profile">
                <div class="form-row">
                    <div class="form-group col-6">
                        <label for="username">Никнейм</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">@</div>
                            </div>
                            <input type="text" class="form-control" value="${user.username}" placeholder="Username" readonly>
                        </div>
                    </div>
                    <div class="form-group col-6">
                        <label for="email">Email</label>
                        <input class="form-control" type="email" value="${user.email}" placeholder="email@example.com" readonly>
                    </div>
                </div>
                <div class="form-row mt-3">
                    <div class="form-group col-md-4">
                        <label for="surname">Фамилия</label>
                        <input type="text" name="surname" class="form-control" value="${user.surname}" placeholder="Фамилия">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="name">Имя</label>
                        <input type="text" name="name" class="form-control" value="${user.name}" placeholder="Имя">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="patronymic">Отчество</label>
                        <input type="text" name="patronymic" class="form-control" value="${user.patronymic}" placeholder="Отчество">
                    </div>
                    <small class="form-text text-muted">Укажите ваши фамилию, имя и отчество, чтобы другие пользователи смогли узнать, как вас зовут</small>
                </div>
                <div class="form-row mt-3">
                    <div class="form-group col-8">
                        <label for="patronymic">Дата рождения</label>
                        <input type="date" name="birthday" class="form-control" value="<#if user.birthday??>${user.birthday?string('yyyy-MM-dd')}</#if>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="float: left">Сохранить</button>
            </form>
        </div>
    </div>
</@cmn.page>