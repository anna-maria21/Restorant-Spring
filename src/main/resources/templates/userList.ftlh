<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Список користувачів</h1>
        <ul class="list-group">
            <#list users as user>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: inline-block" class="col-3">
                            <i><b>Логін: </b></i>${user.username}<br/>
                        </div>
                        <div style="display: inline-block" class="col-3">
                            <i><b>Пароль: </b></i>${user.password}<br/>
                        </div>
                        <div style="display: inline-block" class="col-3">
                            <i><b>Роль: </b></i><#list user.roles as role>${role}<#sep>, </#list><br/>
                        </div>
                        <div style="text-align: right" class="col-3">
                            <form method="get" action="/user/${user.id}" class="mt-4">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>
    </div>
</div>
</@c.page>