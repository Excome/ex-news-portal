<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div class="col">
            <span><a href="/user/${post.author.id}" style="text-decoration: none">${post.author.username}</a></span><br>
            <sp>Дата: ${post.createdDate}</sp>
        </div>
    </div>
    <div class="row justify-content-center">
        <h1>${post.topic}</h1>
    </div>
    <div class="row justify-content-center">
        <#noautoesc>
            ${post.text}
        </#noautoesc>
    </div>
</@cmn.page>