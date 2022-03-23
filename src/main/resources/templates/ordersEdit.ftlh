<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" style="margin-top:45px">
            <div class="panel-heading">
                <h3 class="panel-title mb-5">Редагувати замовлення</h3>
            </div>
            <div class="panel-body">
                <form action="/orders/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="group">ПІБ офіціанта:</label>
                        <select class="custom-select" name="idWaiter">
                          <option selected value="${orders.waiter.id_waiter}" >${orders.waiter.fullNameWaiter}</option>
                          <#list waiters as waiter>
                                  <option value="${waiter.id_waiter}">${waiter.fullNameWaiter}</option>
                          </#list>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="group">ПІБ гостя:</label>
                        <select class="custom-select" name="idGuest">
                          <option selected value="${orders.guest.id}">${orders.guest.fullName}</option>
                          <#list guests as guest>
                                  <option value="${guest.id}">${guest.fullName}</option>
                          </#list>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="group">Статус:</label>
                        <select class="custom-select" name="idStatus">
                          <option selected value="${orders.status.id}">${orders.status.name}</option>
                          <#list statuses as status>
                                  <option value="${status.id}">${status.name}</option>
                          </#list>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="group">Знижка:</label>
                        <select class="custom-select" name="idSale">
                          <option selected value="${orders.sale.id}">${orders.sale.name}</option>
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
                                   <label style="display: flex;"><input type="checkbox" class="mt-2" name="${dish.id}" ${orders.dishes?seq_contains(dish)?string("checked", "")}>${dish.name}</label>
                             </div>
                        </#list>
                    </#list>
                     </div>
                    <input type="hidden" value="${orders.id}" name="id">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success mb-5">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>