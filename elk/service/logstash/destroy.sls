# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

logstash-pod-destroy:
  cmd.run:
    - name: podman pod rm --force {{ ELK.projectname }}-logstash-pod
    - runas: {{ ELK.hostuser.name }}
