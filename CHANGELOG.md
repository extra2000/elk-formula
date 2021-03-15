# Changelog

## [2.1.0](https://github.com/extra2000/elk-formula/compare/v2.0.0...v2.1.0) (2021-03-15)


### Features

* **elasticsearch:** Upgrade from version `7.10.1` to `7.11.2` ([ce8d82a](https://github.com/extra2000/elk-formula/commit/ce8d82a05d8a1dec782ab4e194e566dfcc647c6c))
* **kibana:** Upgrade from version `7.10.1` to `7.11.2` ([fd8f093](https://github.com/extra2000/elk-formula/commit/fd8f09305ff732c05476f85a0bec7653ef963564))
* **logstash:** Upgrade from version `7.10.1` to `7.11.2` ([51cffef](https://github.com/extra2000/elk-formula/commit/51cffef787d4481ceb58c651353edfdc23dd05c0))

## [2.0.0](https://github.com/extra2000/elk-formula/compare/v1.1.1...v2.0.0) (2021-03-14)


### ⚠ BREAKING CHANGES

* **config/nginx.sls:** `elk-formula` now expects NGINX to be deployed via Podman for HTTPS

### Fixes

* **config/nginx.sls:** Fix for NGINX deployments via Podman ([84aff16](https://github.com/extra2000/elk-formula/commit/84aff16aeacc7f9455db0c329a68f36c547a4897))

### [1.1.1](https://github.com/extra2000/elk-formula/compare/v1.1.0...v1.1.1) (2021-03-13)


### Fixes

* **elknet:** Make `bridge` customizable to prevent pod networking conflicts ([9868089](https://github.com/extra2000/elk-formula/commit/98680898677d65a4c6068795922f87feeed94363))

## [1.1.0](https://github.com/extra2000/elk-formula/compare/v1.0.0...v1.1.0) (2021-03-13)


### Features

* **service.elasticsearch:** Implement `elk.service.elasticsearch.destroy` state to destroy Elasticsearch pod ([2d4d244](https://github.com/extra2000/elk-formula/commit/2d4d244c7928ba35c753cba6497d9b98255f6121))
* **service.kibana:** Implement `elk.service.kibana.destroy` state to destroy Kibana pod ([8de3cdb](https://github.com/extra2000/elk-formula/commit/8de3cdb06e815cc94b87143b9c8b81d6acfc5acf))
* **service.logstash:** Implement `elk.service.logstash.destroy` state to destroy Logstash pod ([c435e39](https://github.com/extra2000/elk-formula/commit/c435e3935804f3e44d99e18562c814049344c028))


### Code Refactoring

* **pods:** Add `labels:` ([2a442b2](https://github.com/extra2000/elk-formula/commit/2a442b2a64e6f6bd7f02a4124c1c1d68fa8bd92b))
* **pods:** Explicitly define capabilities and set `allowPrivilegeEscalation: false` ([d2eeec7](https://github.com/extra2000/elk-formula/commit/d2eeec70ab83ea290a6d90dd05a29870b1168287))


### Fixes

* **defaults.yaml,pillar.example:** Improve security by using non `elastic` user privileges ([9bd75ea](https://github.com/extra2000/elk-formula/commit/9bd75ea33e50ac29958b5bdd6b675b853cf58ed3))
* **service.elasticsearch:** Fix `running` state failed when existing Elasticsearch pod exists. This will destroy existing Elasticsearch pod before creating a new Elasticsearch pod. ([007a4b0](https://github.com/extra2000/elk-formula/commit/007a4b0b7ea613a5845463724c0efe7c958925fe))
* **service.kibana:** Fix `running` state failed when existing Kibana pod exists. This will destroy existing Kibana pod before creating a new Kibana pod. ([44becf7](https://github.com/extra2000/elk-formula/commit/44becf71bc12fac482e5e2698dece68ad8389656))
* **service.logstash:** Fix `running` state failed when existing Logstash pod exists. This will destroy existing Logstash pod before creating a new Logstash pod. ([b294757](https://github.com/extra2000/elk-formula/commit/b2947572a47d6bcbee22528d6200679a35604835))


### Documentations

* **README:** Add `destroy` states into every `elk.service` states ([26f7a50](https://github.com/extra2000/elk-formula/commit/26f7a503015925e7ca8cff6d56a37d0f45f4e459))
* **README:** Add state `elk.config.nginx` to configure NGINX for Kibana HTTPS ([05a0ef4](https://github.com/extra2000/elk-formula/commit/05a0ef42572d7d716be8289de155ff4ca8bdb128))

## 1.0.0 (2021-03-07)


### Features

* **salt:** Add implementations for `elk/` states ([a05dca0](https://github.com/extra2000/elk-formula/commit/a05dca01033dd3cbcf5cd9b3574e33cc45749c76))


### Documentations

* **pillar:** Add `pillar.example` ([96f9fa7](https://github.com/extra2000/elk-formula/commit/96f9fa756f94edd3b7744992b422b89bed9b0fa5))
* **README:** Update `README.md` ([e759460](https://github.com/extra2000/elk-formula/commit/e7594606a72213f619f8b21cad2f48cac8812f99))


### Continuous Integrations

* Add AppVeyor with `semantic-release` bot ([b9fe37e](https://github.com/extra2000/elk-formula/commit/b9fe37eb359e44c9526d01b830d28133263f7388))
