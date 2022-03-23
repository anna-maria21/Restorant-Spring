<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати новий статус</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form action="/statuses" method="post">
                <div class="form-group mb-2">
                    <label for="name">Назва:</label>
                    <input type="text" class="form-control" name="name" minlength="2" maxlength="30" required>
                </div>
                <div class="form-group mb-2">
                    <label for="name">Причина:</label>
                    <input type="text" class="form-control" name="reason" minlength="5" maxlength="60" required>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary mt-3">Додати</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Перелік статусів замовлення</h1>
        <ul class="list-group">
            <#list statuses as status>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: block" class="col-6">
                            <i><b>Назва: </b></i>
                            <#if status.name??>${status.name}</#if>
                            <br/>
                            <i><b>Причина: </b></i>${status.reason}<br/>
                            <#if isAdmin>
                                <i><b>Додав: </b></i><strong><#if status.author??>${status.author.username}<#else>< none ></#if></strong>
                            </#if>
                        </div>
                        <div style="display: block; text-align: right" class="col-6">
                            <form method="get" action="statuses/edit/${status.id}" class="mt-4">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                            <form method="post" action="statuses/delete" class="mt-4">
                                    <input type="hidden" value="${status.id}" name="id">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-danger">Видалити</button>
                            </form>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>
    </div>
</div>

</@c.page>