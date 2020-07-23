<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <h2 style="float: left">Последние новости</h2>
            <div class="col">
                <button type="submit" class="btn btn-info"><a href="/post/new" style="text-decoration: none; color: white">Создать пост</a></button>
            </div>
        </div>
    </div>
    <#list posts as post>
        <div class="post-box row justify-content-center">
            <div class="col">
                <header class="post-box-meta">
                    <a href="user/${post.author.id}">${post.author.username}</a>
                    <span>${post.createdDate}</span>
                </header>
                <div class="post-box-tittle">
                    <h2>${post.topic}</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col"
                        <#noautoesc>
                            ${post.text}
                        </#noautoesc>
                        <a href="/post/${post.id}" class="button-link btn btn-outline-info">Читать дальше →</a>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </#list>
</@cmn.page>