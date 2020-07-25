<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div>
            <h2>Редактирование поста</h2>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-10">
            <div class="shadow-box">
                <form action="/post/${post.id}/edit" method="post" name="postForm" id="post">
                    <div class="form-group">
                        <label for="topic">Заголовок</label>
                        <input type="text" name="topic" class="form-control" value="${post.topic}" required>
                        <small class="form-text text-muted">Введите заголовок поста</small>
                    </div>
                    <div class="form-group">
                        <label for="text">Текст</label>
                        <textarea id="mytextarea" name="text" cols="30" rows="30">
                            ${post.text}
                        </textarea>
                    </div>
                    <div class="form-group">
                        <label for="topic">Тэг</label>
                        <input type="text" name="tag" class="form-control" value="${post.tag}">
                    </div>
                    <input type="hidden" name="id" value="#{post.id}">
                    <button type="submit" class="btn btn-info btn-lg btn-block" form="post">Редактировать</button>
                </form>
            </div>
        </div>
    </div>
</@cmn.page>