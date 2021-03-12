# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

kibana-image-present:
  cmd.run:
    - name: podman pull {{ ELK.kibana.image.name }}
    - retry:
        attempt: 10
        interval: 5
        until: true
    - runas: {{ ELK.hostuser.name }}

kibana-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - elk.service.kibana.destroy

kibana-containers-running:
  cmd.run:
    - name: podman play kube --network=elknet kibana-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
    - require:
      - cmd: kibana-image-present
      - module: kibana-pod-destroy-if-exists
