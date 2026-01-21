{%- set fruits = ["apple", "banana", "cherry"] -%}

{%- for fruit in fruits %}


    {%- if fruit != "apple" %}
      {{ fruit }}

    {%- else %}

      This is an {{ fruit }}.

    {%- endif %}


{%- endfor %}
