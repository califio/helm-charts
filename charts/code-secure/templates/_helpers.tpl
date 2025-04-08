{{/*
Expand the name of the chart.
*/}}
{{- define "code-secure.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "code-secure.fullname" -}}
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
{{- define "code-secure.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "code-secure.labels" -}}
helm.sh/chart: {{ include "code-secure.chart" . }}
{{ include "code-secure.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common selector labels
*/}}
{{- define "code-secure.selectorLabels" -}}
app.kubernetes.io/name: {{ include "code-secure.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Dashboard full name
*/}}
{{- define "code-secure.dashboardFullname" -}}
{{- printf "%s-dashboard" (include "code-secure.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the dashboard service account to use
*/}}
{{- define "code-secure.dashboardServiceAccountName" -}}
{{- if .Values.dashboard.serviceAccount.create }}
{{- default (include "code-secure.dashboardFullname" .) .Values.dashboard.serviceAccount.name }}
{{- else }}
{{- default "default-dashboard" .Values.dashboard.serviceAccount.name }}
{{- end }}
{{- end }}
