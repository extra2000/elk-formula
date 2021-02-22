# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

/etc/nginx/conf.d/https.conf:
  file.managed:
    - source: salt://elk/files/nginx-https.conf.jinja
    - template: jinja
    - context:
      kibana: {{ ELK.kibana }}

elk-nginx-service-stop:
  service.dead:
    - name: nginx.service

elk-nginx-service-running:
  service.running:
    - name: nginx.service
