<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати категорію страв</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form action="/groups" method="post">
                <div class="form-group mb-2">
                    <label for="name">Назва:</label>
                    <input type="text" class="form-control" name="name" minlength="2" maxlength="30" required>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary mt-3">Додати</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Перелік категорій</h1>
        <ul class="list-group">
            <#list groups as group>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: block" class="col-6">
                            <i><b>Назва: </b></i>
                            <#if group.name??>${group.name}</#if>
                            <#if isAdmin>
                                <i><b>Додав: </b></i><strong><#if group.author??>${group.author.username}<#else>< none ></#if></strong>
                            </#if>
                        </div>
                        <div style="display: block; text-align: right" class="col-6">
                            <form method="get" action="groups/edit/${group.id}" class="mt-4">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                            <form method="post" action="groups/delete" class="mt-4">
                                    <input type="hidden" value="${group.id}" name="id">
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