{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.AppVersion  | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "app.image" -}}
{{- $registryNameApp := .Values.image.app.registry -}}
{{- $repositoryNameApp := .Values.image.app.repository -}}
{{- $tagApp := .Values.image.app.tag | toString -}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- printf "%s/%s:%s" .Values.global.imageRegistry $repositoryNameApp $tagApp -}}
    {{- else -}}
        {{- printf "%s/%s:%s" $registryNameApp $repositoryNameApp $tagApp -}}
    {{- end -}}
{{- else -}}
    {{- printf "%s/%s:%s" $registryNameApp $repositoryNameApp $tagApp -}}
{{- end -}}
{{- end -}}

{{- define "nginx.image" -}}
{{- $registryNameNginx := .Values.image.nginx.registry -}}
{{- $repositoryNameNginx := .Values.image.nginx.repository -}}
{{- $tagNginx := .Values.image.nginx.tag | toString -}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- printf "%s/%s:%s" .Values.global.imageRegistry $registryNameNginx $tagNginx -}}
    {{- else -}}
        {{- printf "%s/%s:%s" $registryNameNginx $repositoryNameNginx $tagNginx -}}
    {{- end -}}
{{- else -}}
    {{- printf "%s/%s:%s" $registryNameNginx $repositoryNameNginx $tagNginx -}}
{{- end -}}
{{- end -}}