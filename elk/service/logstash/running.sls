# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

logstash-image-present:
  cmd.run:
    - name: podman pull {{ ELK.logstash.image.name }}
    - retry:
        attempts: 10
        interval: 5
        until: true
    - runas: {{ ELK.hostuser.name }}

logstash-pod-destroy-if-exists:
  module.run:
    - state.sls:
      - mods:
        - elk.service.logstash.destroy

logstash-container-running:
  cmd.run:
    - name: podman play kube --network=elknet logstash-pod.yaml
    - cwd: /opt/elk
    - runas: {{ ELK.hostuser.name }}
    - require:
      - cmd: logstash-image-present
      - module: logstash-pod-destroy-if-exists
