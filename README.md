## Pushing chart to Github Packages
Since the repository is private you will need an [access token](https://github.com/settings/tokens) that has Github Packages permissions set. 

1. Login to the registry.  
`helm registry login -u <USERNAME> --password-stdin https://ghcr.io`

2. Package the helm chart  
`helm package path/to/chart`

3. The result of `helm package` is a zipped tar archive (*.tgz). Push the archive to Github Packages  
`helm push mychart.tgz oci://ghcr.io/myorg/mychart`



