<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<h2 class="ml-3">Створення нового облікового запису</h2>
${message?if_exists}
<@l.login "/registration" true/>
</@c.page>