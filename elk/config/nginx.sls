# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

/opt/nginx/https.conf:
  file.managed:
    - source: salt://elk/files/nginx-https.conf.jinja
    - template: jinja
    - context:
      kibana: {{ ELK.kibana }}
