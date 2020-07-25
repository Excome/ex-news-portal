<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <h3>Пользователь <span>${user.username}</span></h3>
            <div class="user-profile-avatar">
                <img src="#" alt="">
            </div>
            <div class="user-profile-info">
                <ul>
                    <li>
                        <h5>Фамилия</h5>
                        <span>${user.surname}</span>
                    </li>
                    <li>
                        <h5>Имя</h5>
                        <span>${user.name}</span>
                    </li>
                    <li>
                        <h5>Отчество</h5>
                        <span>${user.patronymic}</span>
                    </li>
                    <li>
                        <h5>Дата рождения</h5>
                        <span>${user.birthday}</span>
                    </li>
                    <li>
                        <h5>Дата регистрации</h5>
                        <span>${user.regDate}</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-6">
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
                <#list posts as post>
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
</@cmn.page>