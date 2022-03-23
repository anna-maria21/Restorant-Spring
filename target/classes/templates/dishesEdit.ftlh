<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" style="margin-top:45px">
            <div class="panel-heading">
                <h3 class="panel-title">Редагувати страву</h3>
            </div>
            <div class="panel-body">
                <form action="/dishes/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="name">Назва страви:</label>
                        <input type="text" class="form-control" name="name" value="${dishes.name}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Вартість:</label>
                        <input type="number" class="form-control" name="price" value="${dishes.price}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Вага:</label>
                        <input type="number" class="form-control" name="weight" value="${dishes.weight}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Час приготування:</label>
                        <input type="number" class="form-control" name="timeForCooking" value="${dishes.timeForCooking}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="group">Категорія:</label>
                        <select class="custom-select" name="idGroup">
                          <option selected value="${dishes.group.id}">${dishes.group.name}</option>
                          <#list categories as category>
                                  <option value="${category.id}">${category.name}</option>
                          </#list>
                        </select>
                    </div>
                    <input type="hidden" value="${dishes.id}" name="id">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>