<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center">Додати замовлення</h1>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        <form action="/orders" method="post">
            <div class="form-group mb-2">
                <label for="group">ПІБ офіціанта:</label>
                <select class="custom-select" name="idWaiter">
                  <option selected>Оберіть зі списку</option>
                  <#list waiters as waiter>
                  <option value="${waiter.id_waiter}">${waiter.fullNameWaiter}</option>
                  </#list>
                </select>
            </div>
            <div class="form-group mb-2">
                <label for="group">ПІБ гостя:</label>
                <select class="custom-select" name="idGuest">
                  <option selected>Оберіть зі списку</option>
                  <#list guests as guest>
                  <option value="${guest.id}">${guest.fullName}</option>
                  </#list>
                </select>
            </div>
            <div class="form-group mb-2">
                <label for="group">Статус замовлення:</label>
                <select class="custom-select" name="idStatus" required>
                  <option selected>Оберіть зі списку</option>
                  <#list statuses as status>
                  <option value="${status.id}">${status.name}</option>
                  </#list>
                </select>
            </div>
            <div class="form-group mb-2">
                <label for="group">Знижка:</label>
                <select class="custom-select" name="idSale" required>
                  <option selected>Оберіть зі списку</option>
                  <#list sales as sale>
                  <option value="${sale.id}">${sale.name}</option>
                  </#list>
                </select>
            </div>
            <div class="form-group mb-2">
            <#list categories as category>
            <h5 class="mt-2 mb-2">${category.name}</h5>
            <#list category.dishes as dish>
                <div class="form-group mb-2 ml-5">
                    <label style="display: flex;"><input type="checkbox" name="${dish.id}" class="mt-2"><p class="ml-3">${dish.name}</p></label>
                </div>
            </#list>
            </#list>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary mt-3">Додати</button>
        </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 col-md-offset-1 mb-5">
            <h1 class="text-center">Перелік замовлень</h1>
            <ul class="list-group">
                <#list orders as order>
                    <li class="list-group-item mt-2">
                        <div class="wrapper" style="display: flex">
                            <div style="display: block" class="col-9">
                                <i><b>Дата замовлення: </b></i>${order.date}<br/>
                                <i><b>Час замовлення: </b></i>${order.time}<br/>
                                <i><b>Price: </b></i>${order.price}<br/>
                                <i><b>ПІБ гостя: </b></i>${order.guest.fullName}<br/>
                                <i><b>ПІБ офіціанта: </b></i>${order.waiter.fullNameWaiter}<br/>
                                <i><b>Статус: </b></i>${order.status.name}<br/>
                                <i><b>Знижка: </b></i><#if order.sale??>${order.sale.name}<#else>< none ></#if><br/>
                                <i><b>Страви: </b></i><#list order.dishes as dish><br> ${dish.name}</#list>
                                <br/>
                                <#if isAdmin>
                                    <i><b>Додав: </b></i><strong><#if order.author??>${order.author.username}<#else>< none ></#if></strong>
                                </#if>
                            </div>
                            <div style="display: block; text-align: right" class="col-3">
                                <form method="get" action="/orders/edit/${order.id}" class="mt-4">
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