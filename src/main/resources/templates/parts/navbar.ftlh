<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-dark navbar-expand-lg bg-dark pl-5 pr-5">
      <a class="navbar-brand pl-5" href="/">Restaurant</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/analyse">Analyze <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/menu">Menu <span class="sr-only">(current)</span></a>
          </li>
          <#if isAdmin>
          <li class="nav-item active">
            <a class="nav-link" href="/admin">Admin <span class="sr-only">(current)</span></a>
          </li>
          </#if>
        </ul>
            <div class="navbar-text pr-5">${name}</div>
        <#if name != "unknown">
            <@l.logout />
        </#if>
      </div>
</nav>