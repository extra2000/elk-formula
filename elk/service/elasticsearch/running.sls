# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

elasticsearch-containers-running:
  cmd.run:
    - name: podman play kube --network=elknet elasticsearch-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
