{{- define "code-secure.db.config" -}}
{{- $dbServer := .Values.postgresql.enabled | ternary (printf "%s-%s" (include "code-secure.fullname" .) "postgresql") .Values.dashboard.config.data.DB_SERVER }}
{{- $dbPort := .Values.postgresql.enabled | ternary "5432" .Values.dashboard.config.data.DB_PORT }}
{{- $dbDatabase := .Values.postgresql.enabled | ternary .Values.postgresql.global.postgresql.auth.database .Values.dashboard.config.data.DB_NAME }}
{{- if $dbServer }}
DB_SERVER: {{ $dbServer }}
{{- end }}
{{- if $dbPort }}
DB_PORT: {{ $dbPort | toString | quote }}
{{- end }}
{{- if $dbDatabase }}
DB_NAME: {{ $dbDatabase | quote }}
{{- end }}
{{- end }}
