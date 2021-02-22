# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

logstash-container-running:
  cmd.run:
    - name: podman play kube --network=elknet logstash-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
