---
layout: curso
title: 'Guía de Clases'
curso: 'cartografia-digital'
order: 2
---

{% for clase in site.cartografia-digital %}
{% if clase.clase and clase.curso == page.curso %}
## Clase {{ clase.clase }}
[{{ clase.title }}]({{ clase.url }})
{% endif %}
{% endfor %}
