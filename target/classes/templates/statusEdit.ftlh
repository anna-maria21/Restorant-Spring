<#import "parts/common.ftlh" as c>

<@c.page>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default" style="margin-top:45px">
            <div class="panel-heading">
                <h3 class="panel-title">Редагувати статус</h3>
            </div>
            <div class="panel-body">
                <form action="/statuses/edit" method="post">
                    <div class="form-group mb-2">
                        <label for="name">Назва статусу:</label>
                        <input type="text" class="form-control" name="name" value="${statuses.name}" minlength="2" maxlength="30" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="name">Причина:</label>
                        <input type="text" class="form-control" name="reason" value="${statuses.reason}" minlength="5" maxlength="60" required>
                    </div>
                    <input type="hidden" value="${statuses.id}" name="id">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-success">Змінити запис</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@c.page>