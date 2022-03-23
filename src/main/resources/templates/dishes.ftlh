<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати страву</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        <form action="/dishes" method="post">
            <div class="form-group mb-2">
                <label for="name">Назва:</label>
                <input type="text" class="form-control" name="name" minlength="2" maxlength="100" required>
            </div>
            <div class="form-group mb-2">
                <label for="price">Вартість:</label>
                <input type="number" class="form-control" name="price" minlength="1" maxlength="7" required>
            </div>
            <div class="form-group mb-2">
                <label for="weight">Вага:</label>
                <input type="number" class="form-control" name="weight" required>
            </div>
            <div class="form-group mb-2">
                <label for="timeForCooking">Час приготування:</label>
                <input type="number" class="form-control" name="timeForCooking" required>
            </div>
            <div class="form-group mb-2">
                <label for="group">Категорія:</label>
                <select class="custom-select" name="idGroup">
                  <option selected>Оберіть категорію зі списку</option>
                  <#list categories as category>
                  <option value="${category.id}">${category.name}</option>
                  </#list>
                </select>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary mt-3">Додати</button>
        </form>
        </div>
        </div>
    <div class="form-row form-inline mt-5 mb-3">
    <div class="col-md-1"></div>
        <div class="form-group col-md-10">
            <form method="get" action="/dishes">
                <input type="text" class="form-control" placeholder="Назва страви" name="filter" value="${filter?ifExists}">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-info ml-3">Знайти</button>
            </form>
        </div>
    </div>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-md-offset-1 mb-5">
        <h1 class="text-center">Перелік страв</h1>
        <ul class="list-group">
            <#list dishes as dish>
                <li class="list-group-item mt-2">
                    <div class="wrapper" style="display: flex">
                        <div style="display: block" class="col-6">
                            <i><b>Назва: </b></i>${dish.name}<br/>
                            <i><b>Вартість: </b></i>${dish.price}<br/>
                            <i><b>Вага: </b></i>${dish.weight}<br/>
                            <i><b>Час приготування: </b></i>${dish.timeForCooking}<br/>
                            <i><b>Категорія: </b></i>${dish.group.name}<br/>
                            <#if isAdmin>
                                <i><b>Додав: </b></i><strong><#if dish.author??>${dish.author.username}<#else>< none ></#if></strong>
                            </#if>
                        </div>
                        <div style="display: block; text-align: right" class="col-6">
                            <form method="get" action="/dishes/edit/${dish.id}" class="mt-4">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-success">Змінити</button>
                            </form>
                            <form method="post" action="/dishes/delete" class="mt-4">
                                <input type="hidden" value="${dish.id}" name="id">
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