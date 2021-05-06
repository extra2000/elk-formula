# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import ELK with context %}

{% if ELK.hostuser.name == 'root' %}
  {% set cni_path = '/etc/cni/net.d/' %}
{% else %}
  {% set cni_path = '/home/' + ELK.hostuser.name + '/.config/cni/net.d' %}
{% endif %}

/opt/elk:
  file.directory:
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}

{{ cni_path }}:
  file.directory:
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - makedirs: true

{{ cni_path }}/podman-network-elknet.conflist:
  file.managed:
    - source: salt://elk/files/podman-network-elknet.conflist.jinja
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      pod: {{ ELK.pod }}

/opt/elk/elasticsearch-pod.yaml:
  file.managed:
    - source: salt://elk/files/elasticsearch-pod.yaml
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      projectname: {{ ELK.projectname }}
      elasticsearch: {{ ELK.elasticsearch }}

/opt/elk/elasticsearch.yml:
  file.managed:
    - source: salt://elk/files/elasticsearch.yml.jinja
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      elasticsearch: {{ ELK.elasticsearch }}

/opt/elk/logstash-pod.yaml:
  file.managed:
    - source: salt://elk/files/logstash-pod.yaml
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      projectname: {{ ELK.projectname }}
      logstash: {{ ELK.logstash }}

/opt/elk/logstash.yml:
  file.managed:
    - source: salt://elk/files/logstash.yml.jinja
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      logstash: {{ ELK.logstash }}

/opt/elk/logstash.conf:
  file.managed:
    - source: salt://elk/files/logstash.conf.jinja
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      logstash: {{ ELK.logstash }}

/opt/elk/kibana-pod.yaml:
  file.managed:
    - source: salt://elk/files/kibana-pod.yaml
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      projectname: {{ ELK.projectname }}
      kibana: {{ ELK.kibana }}

/opt/elk/kibana.yml:
  file.managed:
    - source: salt://elk/files/kibana.yml.jinja
    - user: {{ ELK.hostuser.name }}
    - group: {{ ELK.hostuser.group }}
    - template: jinja
    - context:
      kibana: {{ ELK.kibana }}
