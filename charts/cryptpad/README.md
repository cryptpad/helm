# cryptpad

CryptPad is a collaboration office suite that is end-to-end-encrypted and open-source.

![Version: 0.0.19](https://img.shields.io/badge/Version-0.0.19-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

## Installing the Chart

Install via OCI Registry:
```bash
helm install cryptpad oci://ghcr.io/cryptpad/helm/cryptpad --version 0.0.19
```

Install via Repository:

```bash
helm repo add cryptpad-github https://cryptpad.github.io/helm
helm install cryptpad cryptpad-github/cryptpad --version 0.0.19
```
cd
## Signing

Example of how verify signature of helm:

```bash
  # Download and convert key from ASCII armor format to binary.
  curl https://extensions.xwiki.org/xwiki/bin/download/Extension/XWikiHelm/WebHome/helm-charts.asc | gpg --dearmor > helm-charts.gpg
  # Verify thatthe signed chart:
  helm fetch --verify cryptpad-github/cryptpad --version 0.0.19 --keyring helm-charts.gpg
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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.9.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Values for the Affinity |
| application_config | string | `nil` | Configuration of the [application](https://docs.cryptpad.org/en/admin_guide/customization.html#application-config) |
| autoscaling.enabled | bool | `false` | Enable the Autoscaling |
| autoscaling.maxReplicas | int | `100` | Maximum numbers of replicas |
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
| config.httpAddress | string | `"0.0.0.0"` | httpAddress specifies the address on which the nodejs server should be accessible. |
| config.installMethod | string | `"helm-docker"` |  |
| config.logFeedback | bool | `false` | Enable feedback log, but requires feedback on log level to work. |
| config.logLevel | string | `"info"` | Change log level from this list below by order of importance: (silly, verbose, debug, feedback, info, warn, error). |
| config.logPath | string | `"./data/logs"` | Directory to store logging events. |
| config.logToStdout | bool | `false` | Log activity to stdout, this may be useful for debugging |
| config.pinPath | string | `"./data/pins"` | Directory to store documents that was pinned to to be stored by the server indefinitely. |
| config.taskPath | string | `"./data/tasks"` | Directory to store a list of scheduled tasks. |
| config.verbose | bool | `false` | Enable verbose logging |
| cpadConfig | string | `"/cryptpad/config/config.js"` | File to mount for the CPAD Configuration (`CPAD_CONF`) |
| enableEmbedding | bool | `false` | Allow documents and media be embedded on other websites. This will add an "Embed" option on the Share menu. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"cryptpad/cryptpad"` |  |
| image.tag | string | `"version-5.7.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"localhost"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Values for the Node Selector |
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
| securityContext | object | `{}` | Security context |
| service.containerPort | int | `3000` |  |
| service.externalIPs | list | `[]` |  |
| service.externalPort | int | `80` |  |
| service.internalPort | string | `"http"` |  |
| service.name | string | `"http"` |  |
| service.portName | string | `"node"` |  |
| service.sessionAffinity | string | `"ClientIP"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.websocket.containerPort | int | `3003` |  |
| service.websocket.externalPort | int | `83` |  |
| service.websocket.internalPort | string | `"ws"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Values for the Tolerations |
| workloadStateful | bool | `true` | Enable to choose witch kind of workload will be used: (true) StatefulSet or (false) for Deployment |

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
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
