# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

/opt/nginx/conf.d/{{ ELK.projectname }}-kibana.conf:
  file.managed:
    - source: salt://elk/files/nginx/kibana.conf
    - template: jinja
    - context:
      port: {{ ELK.kibana.port }}
