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
                <form action="/guests/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="name">ПІБ:</label>
                        <input type="text" class="form-control" name="fullName" value="${guests.fullName}" minlength="2" maxlength="50" required>
                    </div>
                    <div class="form-group mt-3">
                        <#if message??>
                            <p style="color: red;">Гість з таким номером існує!</p>
                        </#if>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Телефон:</label>
                        <input type="tel" pattern="^\+380\d{9}$" class="form-control" name="phoneNumber" value="${guests.phoneNumber}" placeholder="+380" required>
                    </div>
                    <input type="hidden" value="${guests.id}" name="id">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success mt-3">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>