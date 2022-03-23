<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h1 class="text-center mb-5">Меню</h1>
        <form action="/menu/category" method="get">
            <div class="form-group mb-2">
                <label for="group">Категорія:</label>
                <select class="custom-select" name="idGroup">
                  <option selected value="${nameCategory.id?if_exists}">${nameCategory.name?if_exists}</option>
                  <#list categories as category>
                  <#if nameCategory?? && nameCategory?if_exists.name?if_exists != category.name><option value="${category.id}">${category.name}</option></#if>
                  </#list>
                </select>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Знайти</button>
        </form>
        <table class="table mt-5">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Назва</th>
              <th scope="col" class="text-center">Час приготування, хв</th>
              <th scope="col" class="text-center">Вага, г</th>
              <th scope="col" class="text-center">Ціна, грн</th>
            </tr>
          </thead>
          <tbody>
                <#list menu as dish>
                            <tr>
                                <td>${dish.name}</td>
                                <td class="text-center">${dish.timeForCooking}</td>
                                <td class="text-center">${dish.weight}</td>
                                <td class="text-center">${dish.price}</td>
                            </tr>
                </#list>
          </tbody>
        </table>


</@c.page>