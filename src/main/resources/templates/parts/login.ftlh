<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group mt-3">
        <label class="col-sm-2 col-form-label">Ім'я користувача: </label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="Введіть логін" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 col-form-label">Пароль: </label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Введіть пароль"  />
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="row ml-3">
        <#if !isRegisterForm><a href="/registration">Створити обліковий запис</a></#if>
    </div>

    <div class="row ml-3 mt-3">
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Створити<#else>Ввійти</#if></button>
    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-outline-light">Вийти</button>
</form>
</#macro>