# cryptpad

CryptPad is a collaboration office suite that is end-to-end-encrypted and open-source.

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2026.10.1](https://img.shields.io/badge/AppVersion-2026.10.1-informational?style=flat-square)

## Installing the Chart

Install via OCI Registry:
```bash
helm install cryptpad oci://ghcr.io/cryptpad/helm/cryptpad --version 0.2.0
```

Install via Repository:

```bash
helm repo add cryptpad-github https://cryptpad.github.io/helm
helm install cryptpad cryptpad-github/cryptpad --version 0.2.0
```
cd
## Signing

Example of how verify signature of helm:

```bash
  # Download and convert key from ASCII armor format to binary.
  curl https://xwiki-contrib.github.io/xwiki-helm/helm-charts.asc | gpg --dearmor > helm-charts.gpg
  # Verify thatthe signed chart:
  helm fetch --verify cryptpad-github/cryptpad --version 0.2.0 --keyring helm-charts.gpg
```

### Configure and Customization

Values example of how customize your intance:

```yaml
# https://docs.cryptpad.org/en/admin_guide/installation.html#configure-cryptpad
config:
  adminKeys: [
    "[cryptpad-user1@my.awesome.website/YZgXQxKR0Rcb6r6CmxHPdAGLVludrAF2lEnkbx1vVOo=]",
  ]

# https://docs.cryptpad.org/en/admin_guide/customization.html#application-config
application_config:
  availableLanguages: [ 'en', 'de', 'fr', 'pt-br' ]
  availablePadTypes: [ 'drive', 'teams', 'sheet', 'doc', 'presentation', 'pad', 'kanban', 'code', 'form', 'poll', 'whiteboard',
                                'file', 'contacts', 'slide', 'convert', 'diagram' ]
  privacy: |
    {
      "default": 'https://example.com/privacy.html',
      "en": 'https://example.com/privacy.en.html', // in case English is not your default language
      "de": 'https://example.com/privacy.de.html', // you get the idea?
    }
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Values for the Affinity |
| application_config | string | `nil` | Configuration of the [application](https://docs.cryptpad.org/en/admin_guide/customization.html#application-config) |
| autoscaling.enabled | bool | `false` | Enable the Autoscaling |
| autoscaling.maxReplicas | int | `1` | Maximum numbers of replicas TODO: does cryptpad support HA? |
| autoscaling.minReplicas | int | `1` | Minimal numbers of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Percentage of the targeted CPU Utilization |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Percentage of the targeted Memory Utilization |
| config.adminKeys | list | `[]` | Public signing key of users to give admin panel access |
| config.archivePath | string | `"./data/archive"` | Directory to archive data for a configurable period before deleting it. |
| config.blobPath | string | `"./blob"` | Directory to store encrypted files that was uploaded. |
| config.blobStagingPath | string | `"./data/blobstage"` | Directory to store incomplete blobs in a 'staging' area until they are fully uploaded. |
| config.blockPath | string | `"./block"` | Directory to store authenticated blocks. |
| config.decreePath | string | `"./data/decrees"` | TODO |
| config.filePath | string | `"./datastore/"` | Directory where files/documents should be stored. |
| config.installMethod | string | `"helm-docker"` |  |
| config.logFeedback | bool | `false` | Enable feedback log, but requires feedback on log level to work. |
| config.logLevel | string | `"info"` | Change log level from this list below by order of importance: (silly, verbose, debug, feedback, info, warn, error). |
| config.logPath | string | `"./data/logs"` | Directory to store logging events. |
| config.logToStdout | bool | `false` | Log activity to stdout, this may be useful for debugging |
| config.maxUploadSize | int | `20971520` | Maximum upload size in bytes. |
| config.pinPath | string | `"./data/pins"` | Directory to store documents that was pinned to to be stored by the server indefinitely. |
| config.taskPath | string | `"./data/tasks"` | Directory to store a list of scheduled tasks. |
| config.verbose | bool | `false` | Enable verbose logging |
| deployment | object | `{}` | Ability to annotate the Deployment/Statefullset with annotations like a configmap reloader deployment:   annotations:     reloader.stakater.com/auto: "true" |
| enableEmbedding | bool | `false` | Allow documents and media be embedded on other websites. This will add an "Embed" option on the Share menu. |
| extraConfigFiles | object | `{}` | Additional config files rendered verbatim into the ConfigMap and mounted in /cryptpad/config (e.g. `sso.js` for the SSO plugin). Keys are file names, values are file contents (plain text). Reserved names: config.js, infra.js, application_config.js. |
| extraContainers | list | `[]` | Additional sidecar containers. Rendered into `.spec.template.spec.containers` after the main container. |
| extraEnv | list | `[]` | Additional environment variables for the main container (raw env entries, supports valueFrom). |
| extraInitContainers | list | `[]` | Additional init containers (e.g. clone a plugin into a shared volume). Rendered into `.spec.template.spec.initContainers` after the built-in init container. |
| extraVolumeMounts | list | `[]` | Additional volume mounts for the main container. |
| extraVolumes | list | `[]` | Additional volumes for the pod. Rendered into `.spec.template.spec.volumes`. |
| fullnameOverride | string | `""` |  |
| httpRoute.annotations | object | `{}` |  |
| httpRoute.enabled | bool | `false` |  |
| httpRoute.parentRefs | list | `[]` |  |
| httpRoute.timeouts | object | `{}` | requires cluster enabled default gateway (here envoy as example) - name: default-gateway  namespace: infrastructure-envoy-gateway-default  sectionName: default |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cryptpad/cryptpad"` |  |
| image.tag | string | `"version-2026.10.1"` |  |
| imagePullSecrets | list | `[]` |  |
| infra | object | `{"core":[{"host":"localhost","port":3020}],"front":[{"host":"localhost","port":3010}],"public":{"httpHost":"0.0.0.0","httpPort":3000},"storage":[{"host":"localhost","port":3030,"wsPort":3040}]}` | Infra configuration for the new CryptPad server (2026.10+), serialized into infra.js. `public.origin` / `public.sandboxOrigin` are always derived from mainDomain/sandboxDomain (same source as the ingress/httpRoute host rules) and cannot be set here. Schema reference: https://github.com/cryptpad/cryptpad/blob/main/config/infra.example.js |
| infra.core | list | `[{"host":"localhost","port":3020}]` | Core nodes are MANDATORY: internal websocket between all nodes. One entry is enough for a single-container deployment. |
| infra.front | list | `[{"host":"localhost","port":3010}]` | Front nodes are MANDATORY: the HTTP node proxies /api requests and websocket upgrades to them. One entry is enough for a single-container deployment. |
| infra.public.httpHost | string | `"0.0.0.0"` | Address of the nodejs HTTP server inside the container. |
| infra.public.httpPort | int | `3000` | Port of the nodejs HTTP server inside the container. Serves the client app and proxies /api requests and websocket upgrades to the `front` nodes (there is no separate websocket port since CryptPad 2026.10). Also serves the sandbox origin when no separate sandbox listener is configured. |
| infra.storage | list | `[{"host":"localhost","port":3030,"wsPort":3040}]` | Storage nodes are MANDATORY: they serve blob/block/datastore channels. One entry is enough for a single-container deployment. |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.tls | list | `[]` |  |
| mainDomain | string | `""` | Primary hostname for CryptPad (no scheme). Single source of truth for the instance origins (config.js httpUnsafeOrigin / infra.js public.origin), CPAD_MAIN_DOMAIN, and ingress/httpRoute host rules. Example: cryptpad.example.org |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Values for the Node Selector |
| office.enabled | bool | `false` | Install the office suite (EuroOffice, based on OnlyOffice) at container start via install-office.sh. Required for the office apps with the 2026.10+ images — the image does not bundle it. Adds startup time; consider raising probes.startup.failureThreshold. |
| persistence.cryptpad.blob.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.cryptpad.blob.annotations | object | `{}` |  |
| persistence.cryptpad.blob.dataSource | object | `{}` |  |
| persistence.cryptpad.blob.existingClaim | string | `""` |  |
| persistence.cryptpad.blob.labels | object | `{}` |  |
| persistence.cryptpad.blob.selector | object | `{}` |  |
| persistence.cryptpad.blob.size | string | `"100Mi"` |  |
| persistence.cryptpad.blob.storageClass | string | `""` |  |
| persistence.cryptpad.block.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.cryptpad.block.annotations | object | `{}` |  |
| persistence.cryptpad.block.dataSource | object | `{}` |  |
| persistence.cryptpad.block.existingClaim | string | `""` |  |
| persistence.cryptpad.block.labels | object | `{}` |  |
| persistence.cryptpad.block.selector | object | `{}` |  |
| persistence.cryptpad.block.size | string | `"100Mi"` |  |
| persistence.cryptpad.block.storageClass | string | `""` |  |
| persistence.cryptpad.data.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.cryptpad.data.annotations | object | `{}` |  |
| persistence.cryptpad.data.dataSource | object | `{}` |  |
| persistence.cryptpad.data.existingClaim | string | `""` |  |
| persistence.cryptpad.data.labels | object | `{}` |  |
| persistence.cryptpad.data.selector | object | `{}` |  |
| persistence.cryptpad.data.size | string | `"100Mi"` |  |
| persistence.cryptpad.data.storageClass | string | `""` |  |
| persistence.cryptpad.datastore.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.cryptpad.datastore.annotations | object | `{}` |  |
| persistence.cryptpad.datastore.dataSource | object | `{}` |  |
| persistence.cryptpad.datastore.existingClaim | string | `""` |  |
| persistence.cryptpad.datastore.labels | object | `{}` |  |
| persistence.cryptpad.datastore.selector | object | `{}` |  |
| persistence.cryptpad.datastore.size | string | `"100Mi"` |  |
| persistence.cryptpad.datastore.storageClass | string | `""` |  |
| persistence.enabled | bool | `true` | Enable the persistence |
| podAnnotations | object | `{}` | Annotations for the Pod |
| podSecurityContext | object | `{"fsGroup":4001}` | Security context for the Pod |
| priorityClassName | string | `""` | Name for the Priority Class |
| probes.liveness.enabled | bool | `true` | Enable liveness probe |
| probes.liveness.failureThreshold | int | `5` | Failure threshold for liveness probe |
| probes.liveness.httpGet.enabled | bool | `true` | If enabled uses httpGet to check, if false uses tcpSocket checking. |
| probes.liveness.httpGet.path | string | `"/"` | Path to be tested with HTTP GET request |
| probes.liveness.initialDelaySeconds | int | `0` | Initial delay seconds for liveness probe |
| probes.liveness.periodSeconds | int | `10` | Period seconds for liveness probe |
| probes.liveness.successThreshold | int | `1` | Success threshold for liveness probe |
| probes.liveness.timeoutSeconds | int | `1` | Timeout seconds for liveness probe |
| probes.readiness.enabled | bool | `true` | Enable readiness probe |
| probes.readiness.failureThreshold | int | `5` | Failure threshold for readiness probe |
| probes.readiness.httpGet.enabled | bool | `true` | If enabled uses httpGet to check, if false uses tcpSocket checking. |
| probes.readiness.httpGet.path | string | `"/"` | Path to be tested with HTTP GET request |
| probes.readiness.initialDelaySeconds | int | `0` | Initial delay seconds for readiness probe |
| probes.readiness.periodSeconds | int | `10` | Period seconds for readiness probe |
| probes.readiness.successThreshold | int | `1` | Success threshold for readiness probe |
| probes.readiness.timeoutSeconds | int | `1` | Timeout seconds for readiness probe |
| probes.startup.enabled | bool | `true` | Enable startup probe |
| probes.startup.failureThreshold | int | `5` | Failure threshold for startup probe |
| probes.startup.httpGet.enabled | bool | `false` | If enabled uses httpGet to check, if false uses tcpSocket checking. |
| probes.startup.httpGet.path | string | `"/"` | Path to be tested with HTTP GET request |
| probes.startup.initialDelaySeconds | int | `0` | Initial delay seconds for startup probe |
| probes.startup.periodSeconds | int | `10` | Period seconds for startup probe |
| probes.startup.successThreshold | int | `1` | Success threshold for startup probe |
| probes.startup.timeoutSeconds | int | `1` | Timeout seconds for startup probe |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` | Specify default resources. We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. |
| restrictRegistration | bool | `false` | Restrict registration to only users with admin keys |
| sandboxDomain | string | `""` | Sandbox hostname for CryptPad security isolation (no scheme). Used for the sandbox origin (config.js httpSafeOrigin / infra.js public.sandboxOrigin), CPAD_SANDBOX_DOMAIN, and ingress/httpRoute host rules. Must be a *different* domain or subdomain from mainDomain. If empty, mainDomain is reused (insecure). Example: sandbox.cryptpad.example.org |
| securityContext | object | `{}` | Security context |
| service.containerPort | int | `3000` |  |
| service.externalIPs | list | `[]` |  |
| service.externalPort | int | `80` |  |
| service.internalPort | string | `"http"` |  |
| service.name | string | `"http"` |  |
| service.portName | string | `"node"` |  |
| service.sessionAffinity | string | `"ClientIP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Values for the Tolerations |
| workloadStateful | bool | `true` | Enable to choose witch kind of workload will be used: (true) StatefulSet or (false) for Deployment |

## Upgrading to 0.2.0 / CryptPad 2026.10 notes

This chart version targets **CryptPad 2026.10.x** (new server architecture). Compared to
older chart versions, the following **breaking values changes** apply:

* **`mainDomain` / `sandboxDomain`** are the single source of truth for the instance
  origins (config.js `httpUnsafeOrigin`/`httpSafeOrigin`, infra.js `public.origin`/
  `public.sandboxOrigin`), the ingress/httpRoute host rules, and the TLS hosts.
  The legacy `config.httpUnsafeOrigin` / `config.httpSafeOrigin` keys are no longer used.
* **`infra`** (new, required with the 2026.10+ image): rendered into `/cryptpad/config/infra.js`.
  `infra.front`, `infra.core` and `infra.storage` are all **mandatory** (the new server
  requires at least one node of each — a single `{host, port}` entry per type is fine for
  a single-container deployment; the HTTP node proxies `/api` requests and websocket
  upgrades to the front nodes). Since 2026.10 the HTTP server also serves
  `/cryptpad_websocket` on the main port — **there is no separate websocket port or route
  anymore**: `service.websocket`, the second container port (3003) and the service port 83
  were removed, and the dedicated `/cryptpad_websocket` ingress/HTTPRoute path rules were
  dropped (realtime traffic is covered by the catch-all `/` rule). If your ingress
  controller needs special proxy timeouts for long-lived websocket connections, apply
  them via `ingress.annotations`.
* **`office.enabled`** (new, default `false`): the image does not bundle the office suite
  (EuroOffice). Set it to `true` to install at container start via `install-office.sh`
  (env `CPAD_INSTALL_OFFICE=yes`). This adds startup time — consider raising
  `probes.startup.failureThreshold`.
* **`extraConfigFiles`** (new): additional config files rendered verbatim into the
  ConfigMap and mounted in `/cryptpad/config` — e.g. `sso.js` for the
  [SSO plugin](https://github.com/cryptpad/sso) (use plugin version >= 1.0.0 with
  CryptPad 2026.10+; the `cryptpad-sodium-plugin` is no longer needed):
  ```yaml
  extraConfigFiles:
    sso.js: |
      module.exports = {
        ...
      };
  ```
* **`config` values are JSON-serialized**: use plain numbers/strings/booleans/lists/maps
  only — no JavaScript expressions or comments. `config.maxUploadSize` must be a plain
  number (e.g. `20971520`), and `config.httpAddress` was removed (use
  `infra.public.httpHost`).
* **`cpadConfig`** was removed: the generated ConfigMap is mounted as a whole at the
  hardcoded `/cryptpad/config` (and `application_config.js` still goes to
  `/cryptpad/customize/application_config.js`).

After deploying, review the instance's `/checkup/` page to ensure all tests pass.

## Backup

Important volumes or paths (in case different solution like empty/sidecar backup tools) to be considered:

* **cryptpad-blob** volume, or **/cryptpad/blob**
* **cryptpad-block** volume, or **/cryptpad/block**
* **cryptpad-data** volume, or **/cryptpad/data**
* **cryptpad-datastore** volume, or **/cryptpad/datastore**

And configuration file or command line with preferences used to install Helm release.

There are some tools that can manage the backups on k8s workloads. We can suggest [Velero](https://velero.io/), as we already used on some internal clusters.

There is specific product documentation on: https://docs.cryptpad.org/en/admin_guide/maintenance.html#backup-and-migration

## Logging

Current logging resources are standard [Kubernetes logging](https://kubernetes.io/docs/concepts/cluster-administration/logging/).

Example of how change log levels from instance:

```yaml
config:
  verbose: false
  logToStdout: false
  logLevel: 'info'
  logFeedback: false
```

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
