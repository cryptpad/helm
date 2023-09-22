# cryptpad

![Version: 0.0.9](https://img.shields.io/badge/Version-0.0.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

CryptPad is a collaboration suite that is end-to-end-encrypted and open-source.

**Homepage:** <https://cryptpad.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Guilherme Sautner | <guilherme.sautner@xwiki.com> |  |
| Arsène Fougerouse | <arsene.fougerouse@xwiki.com> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.9.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Values for the Affinity |
| apiDomain | string | `""` | CryptPad API subdomain FQDN |
| application_config | string | `nil` | Configuration of the [application](https://docs.cryptpad.org/en/admin_guide/customization.html#application-config) |
| autoscaling.enabled | bool | `false` | Enable the Autoscaling |
| autoscaling.maxReplicas | int | `100` | Maximum numbers of replicas |
| autoscaling.minReplicas | int | `1` | Minimal numbers of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Percentage of the targeted CPU Utilization |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Percentage of the targeted Memory Utilization |
| config | object | `{"adminKeys":[],"archivePath":"./data/archive","blobPath":"./blob","blobStagingPath":"./data/blobstage","blockPath":"./block","decreePath":"./data/decrees","filePath":"./datastore/","httpAddress":"0.0.0.0","installMethod":"helm-docker","logFeedback":false,"logLevel":"info","logPath":"./data/logs","logToStdout":false,"pinPath":"./data/pins","taskPath":"./data/tasks","verbose":false}` | [Configuration of Cryptpad](https://docs.cryptpad.org/en/admin_guide/installation.html#admin-cryptpad-config) |
| cpadConfig | string | `"/cryptpad/config/config.js"` | File to mount for the CPAD Configuration (`CPAD_CONF`) |
| filesDomain | string | `""` | CryptPad files subdomain FQDN |
| fullnameOverride | string | `""` |  |
| http2Disable | string | `""` | Disable HTTP2 |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"cryptpad/cryptpad","tag":"version-5.4.0"}` | Parameters for the Cryptpad image used |
| imagePullSecrets | list | `[]` |  |
| ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"localhost","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]}` | Values for the ingress |
| ingress.enabled | bool | `false` | Enable the ingress |
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
| realIpHeader | string | `""` | Header to get client IP from (`X-Real-IP` or `X-Forwarded-For`) |
| realIpRecursive | string | `""` | Instruct Nginx to perform a recursive search to find client's real IP (`on`/`off`) (see [ngx_http_realip_module](https://nginx.org/en/docs/http/ngx_http_realip_module.html)) |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` | Specify default resources. We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. |
| securityContext | object | `{}` | Security context |
| service | object | `{"externalIPs":[],"externalPort":80,"internalPort":"http","name":"http","portName":"node","sessionAffinity":"ClientIP","type":"ClusterIP"}` | Values for the service |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tlsCert | string | `""` | Path to TLS certificate file |
| tlsDhParam | string | `""` | Path to Diffie-Hellman parameters file |
| tlsKey | string | `""` | Path to TLS private key file |
| tolerations | list | `[]` | Values for the Tolerations |
| trustedProxy | string | `""` | Trusted proxy address or CIDR |
| workloadStateful | bool | `true` | Enable to choose witch kind of workload will be used: (true) StatefulSet or (false) for Deployment |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.2](https://github.com/norwoodj/helm-docs/releases/v1.11.2)
