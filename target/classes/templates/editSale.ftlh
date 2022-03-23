<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" style="margin-top:45px">
            <div class="panel-heading">
                <h3 class="panel-title">Редагувати офіціанта</h3>
            </div>
            <div class="panel-body">
                <form action="/sales/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="name">Назва знажки:</label>
                        <input type="text" class="form-control" name="name" value="${sale.name}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Відсоток знижки:</label>
                        <input type="number" class="form-control" name="percentOfSale" value="${sale.percentOfSale}" minlength="1" maxlength="2" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Максимально можлива сума знижки:</label>
                        <input type="number" class="form-control" name="maxSumOfSale" value="${sale.maxSumOfSale}" required>
                    </div>
                    <input type="hidden" value="${sale.id}" name="id">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>