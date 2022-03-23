<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати нового гостя</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        <form action="/guests" method="post">
            <div class="form-group mb-2">
                <label for="name">ПІБ:</label>
                <input type="text" class="form-control" name="fullName" value="${tempGuest?if_exists.fullName?if_exists}" minlength="2" maxlength="50" required>
            </div>
            <div class="form-group mt-3">
                <#if message??>
                    <p style="color: red;">Гість з таким номером існує!</p>
                </#if>
            </div>
            <div class="form-group mb-2">
                <label for="name">Телефон:</label>
                <input type="tel" pattern="^\+380\d{9}$" class="form-control" name="phoneNumber" value="${tempGuest?if_exists.phoneNumber?if_exists}" placeholder="+380" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary mt-3">Додати</button>
        </form>
        </div>
        </div>
    <div class="form-row form-inline mt-5 mb-3">
    <div class="col-md-1"></div>
        <div class="form-group col-md-10">
            <form method="get" action="/guests">
                <input type="text" class="form-control" placeholder="Телефон" name="filter" value="${filter?if_exists}">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-info ml-3">Знайти</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center mt-3">Список гостей</h1>
        <ul class="list-group">
            <#if emptyMessage??><h5 style="color: red;" class="mt-5">Немає гостя з введеним номером!</h5></#if>
                <#list guests as guest>
                    <li class="list-group-item mt-2">
                        <div class="wrapper" style="display: flex">
                            <div style="display: block" class="col-6">
                                <i><b>ПІБ: </b></i>${guest.fullName}<br/>
                                <i><b>Кількість замовлень: </b></i>${guest.numberOfOrders}<br/>
                                <i><b>Телефон: </b></i><#if guest.phoneNumber??>${guest.phoneNumber}</#if><br/>
                                <#if isAdmin>
                                    <i><b>Додав: </b></i><strong><#if guest.author??>${guest.author.username}<#else>< none ></#if></strong>
                                </#if>
                            </div>
                            <div style="display: block; text-align: right" class="col-6">
                                <form method="get" action="/guests/edit/${guest.id}" class="mt-4">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-success">Змінити</button>
                                </form>
                                <form method="post" action="/guests/delete" class="mt-4">
                                    <input type="hidden" value="${guest.id}" name="id">
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