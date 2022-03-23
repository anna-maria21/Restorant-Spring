<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати офіціанта</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        <form action="/waiters" method="post">
            <div class="form-group mb-2">
                <label for="name">ПІБ:</label>
                <input type="text" class="form-control" name="fullNameWaiter" value="${tempWaiter?if_exists.fullNameWaiter?if_exists}" minlength="2" maxlength="30" required>
            </div>
            <div class="form-group mt-3">
                <#if message??>
                    <p style="color: red;">Офіціант з таким номером існує!</p>
                </#if>
            </div>
            <div class="form-group mb-2">
                <label for="name">Телефон:</label>
                <input type="tel" pattern="^\+380\d{9}$" class="form-control" name="phoneNumber" value="${tempWaiter?if_exists.phoneNumber?if_exists}" placeholder="+380" required>
            </div>
            <div class="form-group mb-2">
                <label for="name">Досвід роботи:</label>
                <input type="number" class="form-control" value="${tempWaiter?if_exists.experience?if_exists}" name="experience" required>
            </div>
            <div class="form-group mb-2">
                <label for="name">Зарплата:</label>
                <input type="number" class="form-control" value="${tempWaiter?if_exists.salary?if_exists}" name="salary" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary mt-3">Додати</button>
        </form>
        </div>
        </div>
    <div class="form-row form-inline mt-5 mb-3">
    <div class="col-md-1"></div>
        <div class="form-group col-md-10">
            <form method="get" action="/waiters">
                <input type="text" class="form-control" placeholder="ПІБ офіціанта" name="filter" value="${filter?if_exists}">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-info ml-3">Знайти</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Список офіціантів</h1>
        <#if emptyMessage??>Немає офіціанта з введеним ПІБ</#if>
        <ul class="list-group">
            <#list waiters as waiter>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: block" class="col-6">
                            <i><b>ПІБ: </b></i>${waiter.fullNameWaiter}<br/>
                            <i><b>Телефон: </b></i>${waiter.phoneNumber}<br/>
                            <i><b>Досвід роботи: </b></i>${waiter.experience}<br/>
                            <i><b>Зарплата: </b></i>${waiter.salary}<br/>
                            <#if isAdmin>
                                <i><b>Додав: </b></i><strong><#if waiter.author??>${waiter.author.username}<#else>< none ></#if></strong>
                            </#if>
                        </div>
                        <div style="display: block; text-align: right" class="col-6">
                            <form method="get" action="/waiters/edit/${waiter.id_waiter}" class="mt-4">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                            <form method="post" action="/waiters/delete" class="mt-4">
                                <input type="hidden" value="${waiter.id_waiter}" name="id_waiter">
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