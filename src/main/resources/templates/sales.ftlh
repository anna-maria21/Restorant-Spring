<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати нову знижку</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form action="/sales" method="post">
                <div class="form-group mb-2">
                    <label for="name">Назва:</label>
                    <input type="text" class="form-control" name="name" minlength="2" maxlength="30" required>
                </div>
                <div class="form-group mb-2">
                    <label for="name">Відсоток знижки:</label>
                    <input type="number" class="form-control" name="percentOfSale" minlength="1" maxlength="2" required>
                </div>
                <div class="form-group mb-2">
                    <label for="name">Максимально можлива сума знижки:</label>
                    <input type="number" class="form-control" name="maxSumOfSale" required>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary mt-3">Додати</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Перелік знижок</h1>
        <ul class="list-group">
            <#list sales as sale>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: block" class="col-6">
                            <i><b>Назва: </b></i>${sale.name}<br/>
                            <i><b>Відсоток знижки: </b></i>${sale.percentOfSale}<br/>
                            <i><b>Максимально можлива сума знижки: </b></i>${sale.maxSumOfSale}<br/>
                            <#if isAdmin>
                                <i><b>Додав: </b></i><strong><#if sale.author??>${sale.author.username}<#else>< none ></#if></strong>
                            </#if>
                        </div>
                        <div style="display: block; text-align: right" class="col-6">
                            <form method="get" action="sales/edit/${sale.id}" class="mt-4">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                            <form method="post" action="sales/delete" class="mt-4">
                                    <input type="hidden" value="${sale.id}" name="id">
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