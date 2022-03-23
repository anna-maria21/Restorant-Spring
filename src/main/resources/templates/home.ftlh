<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>

<div class="jumbotron text-center">
  <h1 class="display-3">Hello, ${name}!</h1>
  <p class="lead">Це стратова сторінка застосунку!</p>
  <hr class="my-4">
  <p>Тут Ви зможете ознайомитися з аналізом роботи закладуб меню та іншими характеристиками</p>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="/analyse" role="button">Переглянути аналітику</a>
  </p>
</div>

</@c.page>