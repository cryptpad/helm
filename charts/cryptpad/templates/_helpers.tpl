{{/*
Expand the name of the chart.
*/}}
{{- define "cryptpad-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cryptpad-helm.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cryptpad-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cryptpad-helm.labels" -}}
helm.sh/chart: {{ include "cryptpad-helm.chart" . }}
{{ include "cryptpad-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cryptpad-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cryptpad-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cryptpad-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cryptpad-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define main domain. Or use first ingress host defined as main domain. 
*/}}
{{- define "cryptpad-helm.mainDomain" -}}
{{- if .Values.ingress.enabled }}
https://{{ (index .Values.ingress.hosts 0).host }}
{{- else if .Values.config.httpUnsafeOrigin }}  
{{- .Values.config.httpUnsafeOrigin }}
{{- else }}
http://localhost:3000
{{- end}}
{{- end }}

{{/*
Define sandbox subdomain. Or use first ingress host defined as main domain. 
*/}}
{{- define "cryptpad-helm.sandboxDomain" -}}
{{- if .Values.ingress.enabled }}
https://{{ (index .Values.ingress.hosts 0).host }}
{{- else if .Values.config.httpSafeOrigin }}  
{{- .Values.config.httpSafeOrigin }}
{{- else }}
http://localhost:3000
{{- end}}
{{- end }}
