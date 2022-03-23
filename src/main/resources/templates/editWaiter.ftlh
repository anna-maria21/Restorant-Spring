<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" style="margin-top:45px">
            <div class="panel-heading">
                <h3 class="panel-title">Edit waiter</h3>
            </div>
            <div class="panel-body">
                <form action="/waiters/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="name">ПІБ:</label>
                        <input type="text" class="form-control" name="fullNameWaiter" value="${waiter.fullNameWaiter}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mt-3">
                        <#if message??>
                            <p style="color: red;">Офіціант з таким номером існує!</p>
                        </#if>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Телефон:</label>
                        <input type="tel" pattern="^\+380\d{9}$" class="form-control" name="phoneNumber" value="${waiter.phoneNumber}" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Досвід:</label>
                        <input type="number" class="form-control" name="experience" value="${waiter.experience}" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Зарплата:</label>
                        <input type="number" class="form-control" name="salary" value="${waiter.salary}" required>
                    </div>
                    <input type="hidden" value="${waiter.id_waiter}" name="id_waiter">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>