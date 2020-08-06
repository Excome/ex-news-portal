<#import "parts/common.ftlh" as cmn>
<#include "parts/security.ftlh">
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col" style="margin-bottom: 4%">
            <h3 class="posts-header">Последние новости</h3>
            <#if isAdmin><a class="posts-header-button btn btn-info" href="/post/new">Создать пост</a></#if>
        </div>
    </div>
    <#list posts as post>
        <div class="post-box row justify-content-center">
            <div class="col">
                <header class="post-box-meta">
                    <a class="user-nickname" href="user/${post.author.username}" title="Автор публикации">${post.author.username}</a>
                    <span class="post-time">${post.createdDate}</span>
                </header>
                <div class="post-box-tittle">
                    <h1><a href="/post/${post.id}" title="${post.topic}" class="post-box-title-link">${post.topic}</a></h1>
                </div>
                <div class="post-box-tag">
                    <span>${post.tag}</span>
                </div>
                <div class="row justify-content-center">
                    <div class="col">
                        <#noautoesc>
                            ${post.text}
                        </#noautoesc>
                        <p><a href="/post/${post.id}" class="button-link btn btn-outline-info">Читать дальше →</a></p>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </#list>
</@cmn.page>