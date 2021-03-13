# elk-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/kpxtwhooli58ln6u/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/elk-formula/branch/master) |

SaltStack Formula for ELK (Elasticsearch, Logstash, Kibana) stack.


## Available states

| States | Descriptions |
| ------ | ------------ |
| `elk.config` | Configure ELK. |
| `elk.config.nginx` | Configure NGINX for Kibana HTTPS. |
| `elk.service.elasticsearch` | Deploy Elasticsearch pod. |
| `elk.service.logstash` | Deploy Logstash pod. |
| `elk.service.kibana` | Deploy Kibana pod. |
| `elk.service.elasticsearch.destroy` | Destroy Elasticsearch pod. |
| `elk.service.logstash.destroy` | Destroy Logstash pod. |
| `elk.service.kibana.destroy` | Destroy Kibana pod. |
