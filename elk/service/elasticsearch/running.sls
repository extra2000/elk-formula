# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

elasticsearch-image-present:
  cmd.run:
    - name: podman pull {{ ELK.elasticsearch.image.name }}
    - retry:
        attempts: 10
        interval: 5
        until: true
    - runas: {{ ELK.hostuser.name }}

elasticsearch-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - elk.service.elasticsearch.destroy

elasticsearch-pod-running:
  cmd.run:
    - name: podman play kube --network=elknet elasticsearch-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
    - require:
      - cmd: elasticsearch-image-present
      - module: elasticsearch-pod-destroy-if-exists
