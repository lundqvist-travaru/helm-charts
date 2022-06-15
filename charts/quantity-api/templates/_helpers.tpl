{{- define "database.migrate-node" }}
- name: migrate-knex
  image: mikaellarsson96/knex-tools:latest
  imagePullPolicy: Always
  command: ['sh', '-c', '/scripts/migrate.sh']
  env:
  - name: GITHUB_USERNAME
    value: {{ .Values.global.github.username }} 
  - name: GITHUB_ACCESS_TOKEN
    value: {{ .Values.global.github.access_token }}
  - name: PROJECT_REPOSITORY_NAME
    value: {{ .Values.service.repositoryName }}
  - name: PROJECT_LOCATION
    value: /src
  - name: DB_HOST 
    value: {{ .Release.Name }}-postgres-service
  - name: DB_PORT
    value: {{ .Values.global.database.port | quote }} 
  - name: DB_DATABASE
    value: {{ .Values.service.name | quote }} 
  - name: NODE_ENV
    value: "development" 
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-postgres-secrets
        key: password
  - name: DB_USER
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-postgres-secrets
        key: username 
  volumeMounts:
  - mountPath: /app
    name: build
{{- end }}