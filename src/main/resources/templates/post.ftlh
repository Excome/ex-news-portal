<#import "parts/common.ftlh" as cmn>
<#include "parts/security.ftlh">
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="row justify-content-center">
                <div class="col">
                    <h1>${post.topic}</h1>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col">
                    <#noautoesc>
                        ${post.text}
                    </#noautoesc>
                </div>
            </div>
        </div>
        <div class="col ml-5">
            <div class="post-info">
                <header class="post-info-header">
                    <h2>Информация</h2>
                    <hr>
                </header>
                <#if name == post.author.username || isAdmin>
                    <div class="post-info-button">
                        <a class="btn btn-outline-info" href="/post/${post.id}/edit">Редактировать</a>
                        <form action="/post/${post.id}/delete" method="post" onsubmit="return deleteCheck()">
                            <input type="hidden" name="postId" value="${post.id}">
                            <button class="btn btn-danger" type="submit">Удалить</button>
                        </form>
                        <script>
                            function deleteCheck() {
                                var result = confirm("Вы действительно хотите удалить данный пост?")
                                if(result){
                                    return true;
                                }else {
                                    return false;
                                }
                            }
                        </script>
                    </div>
                </#if>
                <ul class="post-info-list">
                    <li class="post-info-list-item">
                        <h3>Автор</h3>
                        <a class="user-nickname" href="/user/${post.author.username}"><span>${post.author.username}</span></a>
                    </li>
                    <li class="post-info-list-item">
                        <h3>Дата создания</h3>
                        <span>${post.createdDate}</span>
                    </li>
                    <#if post.createdDate != post.lastUpdatedDate>
                        <li class="post-info-list-item">
                            <h3>Дата изменения</h3>
                            <span>${post.lastUpdatedDate}</span>
                        </li>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</@cmn.page>