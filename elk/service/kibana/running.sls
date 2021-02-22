# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

kibana-containers-running:
  cmd.run:
    - name: podman play kube --network=elknet kibana-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
