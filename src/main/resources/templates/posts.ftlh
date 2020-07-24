<#import "parts/common.ftlh" as cmn>
<#include "parts/security.ftlh">
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col" style="margin-bottom: 4%">
            <h1 class="posts-header">Последние новости</h1>
            <#if isAdmin><a class="posts-header-button btn btn-info" href="/post/new">Создать пост</a></#if>
        </div>
    </div>
    <#list posts as post>
        <div class="post-box row justify-content-center">
            <div class="col">
                <header class="post-box-meta">
                    <a class="user-nickname" href="user/${post.author.id}" title="Автор публикации">${post.author.username}</a>
                    <span class="post-time">${post.createdDate}</span>
                </header>
                <div class="post-box-tittle">
                    <h2>${post.topic}</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col"
                        <#noautoesc>
                            ${post.shortText}
                        </#noautoesc>
                    <p><a href="/post/${post.id}" class="button-link btn btn-outline-info">Читать дальше →</a></p>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </#list>
</@cmn.page>