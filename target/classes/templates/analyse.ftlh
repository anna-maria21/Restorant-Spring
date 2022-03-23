<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>

    <h3 class="text-center mb-5">Страви в діапазоні цін</h3>
        <form action="/analyse/between" method="get">
            <div class="form-group mb-2">
                <label for="name">Від:</label>
                <input type="number" class="form-control" name="price1" required>
            </div>
            <div class="form-group mb-2">
                <label for="name">До:</label>
                <input type="number" class="form-control" name="price2"  required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Знайти</button>
        </form>
        <table class="table mt-5">
             <thead class="thead-dark">
                   <tr>
                      <th scope="col">Назва</th>
                      <th scope="col" class="text-center">Вага</th>
                      <th scope="col" class="text-center">Ціна</th>
                   </tr>
             </thead>
             <tbody>
                  <#if dishesBetween??>
                  <#list dishesBetween as dish>
                       <tr">
                            <td>${dish.name}</td>
                            <td class="text-center">${dish.weight}</td>
                            <td class="text-center">${dish.price}</td>
                       </tr>
                  </#list>
                  </#if>
             </tbody>
        </table>

    <h3 class="text-center mb-5 mt-5">Кількість страв в діапазоні часу</h3>
        <form action="/analyse/time" method="get">
            <div class="form-group mb-2">
                <select class="custom-select" name="time1">
                  <option selected value="${time1?if_exists}">${time1?if_exists}</option>
                  <#list ["10:00:00","12:00:00","16:00:00","18:00:00","20:00:00", "22:00:00","23:59:59"] as x>
                  <#if time1?? && x != time1><option>${x}</option></#if>
                  </#list>
                </select>
            </div>
            <div class="form-group mb-2">
                <select class="custom-select" name="time2">
                  <option selected value="${time2?if_exists}">${time2?if_exists}</option>
                  <#list ["10:00:00","12:00:00","16:00:00","18:00:00","20:00:00","22:00:00","23:59:59"] as x>
                  <#if time2?? && x != time2><option>${x}</option></#if>
                  </#list>
                </select>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Знайти</button>
        </form>
        <table class="table mt-5">
             <thead class="thead-dark">
                   <tr>
                      <th scope="col">Назва</th>
                      <th scope="col" class="text-center">Кількість</th>
                   </tr>
             </thead>
             <tbody>
                  <#if dishes??>
                  <#list dishes as dish>
                       <tr>
                            <td>${dish.name}</td>
                            <td class="text-center">${dish.counter}</td>
                       </tr>
                  </#list>
                  </#if>
             </tbody>
        </table>

<h3 class="text-center mb-5">Кількість замовлених страв</h3>
        <table class="table mt-5 mb-5">
             <thead class="thead-dark">
                   <tr>
                      <th scope="col">Назва</th>
                      <th scope="col" class="text-center">Ціна, грн</th>
                      <th scope="col" class="text-center">Кількість позицій</th>
                      <th scope="col" class="text-center">Сумарний прибуток, грн</th>
                   </tr>
             </thead>
             <tbody>
                  <#list rows as row>
                       <tr>
                            <td>${row.name}</td>
                            <td class="text-center">${row.price}</td>
                            <td class="text-center">${row.counter}</td>
                            <td class="text-center">${row.counter * row.price}</td>
                       </tr>
                  </#list>
             </tbody>
        </table>

<h3 class="text-center mb-5">Кількість обслуговувань офіціантів</h3>
        <table class="table mt-5 mb-5">
             <thead class="thead-dark">
                   <tr>
                      <th scope="col">ПІБ офіціанта</th>
                      <th scope="col" class="text-center">Кількість</th>
                   </tr>
             </thead>
             <tbody>
                  <#list forWaitersStatistics as forWaitersStatistic>
                       <tr>
                            <td>${forWaitersStatistic.name}</td>
                            <td class="text-center">${forWaitersStatistic.counter}</td>
                       </tr>
                  </#list>
             </tbody>
        </table>

<h3 class="text-center mb-5">Кількість замовлень гостей</h3>
        <table class="table mt-5 mb-5">
             <thead class="thead-dark">
                   <tr>
                      <th scope="col">ПІБ гостя</th>
                      <th scope="col" class="text-center">Кількість</th>
                      <th scope="col" class="text-center">Загальна сума, грн</th>
                   </tr>
             </thead>
             <tbody>
                  <#list forGuestStatistics as forGuestStatistic>
                       <tr>
                            <td>${forGuestStatistic.name}</td>
                            <td class="text-center">${forGuestStatistic.counter}</td>
                            <td class="text-center"><#if forGuestStatistic.price??>${forGuestStatistic.price}<#else>0</#if></td>
                       </tr>
                  </#list>
             </tbody>
        </table>
</@c.page>