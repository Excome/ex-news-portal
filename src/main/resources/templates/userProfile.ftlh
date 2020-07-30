<#import "parts/common.ftlh" as cmn>
<#include "parts/security.ftlh">
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <h3>Пользователь <span>${userProfile.username}</span></h3>
            <div class="user-profile-avatar">
                <img src="#" alt="">
            </div>
            <div class="user-profile-info">
                <ul>
                    <li>
                        <h5>Фамилия</h5>
                        <span>${userProfile.surname}</span>
                    </li>
                    <li>
                        <h5>Имя</h5>
                        <span>${userProfile.name}</span>
                    </li>
                    <li>
                        <h5>Отчество</h5>
                        <span>${userProfile.patronymic}</span>
                    </li>
                    <li>
                        <h5>Дата рождения</h5>
                        <span>${userProfile.birthday}</span>
                    </li>
                    <li>
                        <h5>Дата регистрации</h5>
                        <span>${userProfile.regDate}</span>
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
                    <#if userProfile.username == name>
                        <th scope="col"></th>
                    </#if>
                </tr>
                </thead>
                <tbody>
                <#if posts?size != 0>
                    <#list posts as post>
                        <tr>
                            <td scope="row">${post.id}</td>
                            <td>${post.topic}</td>
                            <td><a href="/user/${post.author.username}">${post.author.username}</a></td>
                            <td>${post.createdDate}</td>
                            <#if userProfile.username == name>
                                <td><a class="btn btn-link" href="/post/${post.id}/edit">Изменить</a></td>
                            </#if>
                        </tr>
                    </#list>
                <#else>
                    <tr><td colspan="4">Постов нет(</td></tr>
                </#if>
                </tbody>
            </table>
        </div>
    </div>
</@cmn.page>