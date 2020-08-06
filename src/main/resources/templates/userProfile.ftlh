<#import "parts/common.ftlh" as cmn>
<#include "parts/security.ftlh">
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <h3>Пользователь <span style="color: orange">${userProfile.username}</span></h3>
            <#if name == userProfile.username>
                <div><h4><a href="/auth/settings/profile">Редактировать профиль</a></h4></div>
            </#if>
            <div class="user-profile-avatar">
                <img src="#" alt="">
            </div>
            <div class="user-profile-info">
                <ul class="user-profile-list">
                    <li class="user-profile-list-item">
                        <h3 class="user-profile-list-item-head">Фамилия</h3>
                        <span class="user-profile-list-item-content">${userProfile.surname}</span>
                    </li>
                    <li class="user-profile-list-item">
                        <h3 class="user-profile-list-item-head">Имя</h3>
                        <span class="user-profile-list-item-content">${userProfile.name}</span>
                    </li>
                    <li class="user-profile-list-item">
                        <h3 class="user-profile-list-item-head">Отчество</h3>
                        <span class="user-profile-list-item-content">${userProfile.patronymic}</span>
                    </li>
                    <#if userProfile.birthday??>
                        <li class="user-profile-list-item">
                            <h3 class="user-profile-list-item-head">Дата рождения</h3>
                            <span class="user-profile-list-item-content">${userProfile.birthday?string('dd MMMM yyyy г.')}</span>
                        </li>
                    </#if>
                    <li class="user-profile-list-item">
                        <h3 class="user-profile-list-item-head">Дата регистрации</h3>
                        <span class="user-profile-list-item-content">${userProfile.regDate?string('dd MMMM yyyy г.')}</span>
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
                </tr>
                </thead>
                <tbody>
                <#if posts?size != 0>
                    <#list posts as post>
                        <tr>
                            <td>${post.id}</td>
                            <td><a href="/post/${post.id}">${post.topic}</a></td>
                            <td><a href="/user/${post.author.username}">${post.author.username}</a></td>
                            <td>${post.createdDate?string('dd MMMM yyyy в hh:mm')}</td>
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