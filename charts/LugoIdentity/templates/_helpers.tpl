
{{- define "database.migrate-ef" }}
- name: migrate-ef
  image: mikaellarsson96/ef-tools:5.0
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
  - name: DB_NAME
    value: {{ .Values.service.name | quote }} 
  - name: DB_USER
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-postgres-secrets
        key: username 
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-postgres-secrets
        key: password
  - name: ConnectionStrings__DefaultConnection 
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-postgres-secrets
        key: connectionString
{{- end }}