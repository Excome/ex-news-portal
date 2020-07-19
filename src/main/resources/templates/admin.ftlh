<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row">
        <div class="col-4">
            <table class="table" style="text-align: center">
                <thead class="thead-dark">
                <tr>
                    <th>id</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Роли</th>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Отчество</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <#list userList as user>
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td><#list user.roles as role>${role.name} <#sep>, </#list></td>
                        <th>${user.surname}</th>
                        <th>${user.name}</th>
                        <th>${user.patronymic}</th>
                        <td><button type="button" class="btn btn-warning"><a style="color: white; text-decoration: none" href="/admin/ue/${user.id}">Изменить</a></button></td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</@cmn.page>