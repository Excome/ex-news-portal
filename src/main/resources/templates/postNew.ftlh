<#import "parts/common.ftlh" as cmn>
<@cmn.page>
    <div class="row justify-content-center">
        <div>
            <h2>Создание поста</h2>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-10">
            <div class="shadow-box">
                <form action="/post/new" method="post" name="postForm" id="post">
                    <div class="form-group">
                        <label for="topic">Заголовок</label>
                        <input type="text" name="topic" class="form-control" required>
                        <small class="form-text text-muted">Введите заголовок поста</small>
                    </div>
                    <div class="form-group">
                        <label for="text">Текст</label>
                        <textarea id="mytextarea" name="text" cols="30" rows="30"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="topic">Тэг</label>
                        <input type="text" name="tag" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-info btn-lg btn-block" form="post">Создать</button>
                </form>
            </div>
        </div>
    </div>
</@cmn.page>