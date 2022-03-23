<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div class="row">
        <div class="card col-3" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/10/10542.png" class="card-img-top mt-2" >
          <div class="card-body text-center">
                <a href="/waiters" class="btn btn-secondary" role="button">Waiters</a>
          </div>
        </div>
        <div class="col-md-1"></div>
        <div class="card col-3" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/2660/2660636.png" class="card-img-top" >
          <div class="card-body text-center">
                <a href="/dishes" class="btn btn-secondary" role="button">Dishes</a>
          </div>
        </div>
        <div class="col-md-1"></div>
        <div class="card col-3 text-center" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/2645/2645851.png" class="card-img-top mt-2">
          <div class="card-body">
                <a href="/sales" class="btn btn-secondary" role="button">Sales</a>
          </div>
        </div>
    </div>
    <div class="row mt-5 text-center">
        <div class="card col-3" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/66/66936.png" class="card-img-top mt-2" >
          <div class="card-body">
                <a href="/statuses" class="btn btn-secondary" role="button">Statuses</a>
          </div>
        </div>
        <div class="col-md-1"></div>
        <div class="card col-3" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/65/65667.png" class="card-img-top mt-2" >
          <div class="card-body">
                <a href="/groups" class="btn btn-secondary" role="button">Groups</a>
          </div>
        </div>
        <div class="col-md-1"></div>
        <div class="card col-3" style="width: 18rem;">
          <img src="https://image.flaticon.com/icons/png/512/47/47962.png" class="card-img-top mt-2" >
          <div class="card-body">
                <a href="/guests" class="btn btn-secondary" role="button">Guests</a>
          </div>
        </div>
    </div>
    <div class="row mt-5 text-center mb-5">
        <div class="card col-3" style="width: 18rem;">
          <img src="https://freesvg.org/img/abstract-user-flat-1.png" class="card-img-top mt-2" >
          <div class="card-body">
                <a href="/user" class="btn btn-secondary" role="button">Users</a>
          </div>
        </div>
        <div class="col-md-1"></div>
        <div class="card col-3" style="width: 18rem;">
          <img src="https://cdn-icons-png.flaticon.com/512/1413/1413925.png" class="card-img-top" mt-2>
          <div class="card-body">
                <a href="/orders" class="btn btn-secondary" role="button">Orders</a>
          </div>
        </div>

    </div>
</@c.page>