{{- define "code-secure.db.credentials" -}}
{{- $dbUsername := .Values.dashboard.secret.data.DB_USERNAME }}
{{- $dbPassword := .Values.dashboard.secret.data.DB_PASSWORD }}
{{- if and $dbUsername $dbPassword }}
DB_USERNAME: {{ $dbUsername | b64enc | quote }}
DB_PASSWORD: {{ $dbPassword | b64enc | quote }}
{{- else if .Values.postgresql.enabled }}
  {{- if empty .Values.postgresql.global.postgresql.auth.username }}
DB_USERNAME: {{ print "postgres" | b64enc | quote }}
DB_PASSWORD: {{ .Values.postgresql.global.postgresql.auth.postgresPassword | b64enc | quote }}
  {{- else }}
DB_USERNAME: {{ .Values.postgresql.global.postgresql.auth.username | b64enc | quote }}
DB_PASSWORD: {{ .Values.postgresql.global.postgresql.auth.password | b64enc | quote }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "code-secure.dashboard.credentials" -}}
{{- if .Values.dashboard.secret.data.SYSTEM_PASSWORD }}
SYSTEM_PASSWORD: {{ .Values.dashboard.secret.data.SYSTEM_PASSWORD | b64enc | quote }}
{{- end }}
{{- if .Values.dashboard.secret.data.ACCESS_TOKEN_KEY }}
ACCESS_TOKEN_KEY: {{ .Values.dashboard.secret.data.ACCESS_TOKEN_KEY | b64enc | quote }}
{{- end }}
{{- if .Values.dashboard.secret.data.REFRESH_TOKEN_KEY }}
REFRESH_TOKEN_KEY: {{ .Values.dashboard.secret.data.REFRESH_TOKEN_KEY | b64enc | quote }}
{{- end }}
{{- end }}
