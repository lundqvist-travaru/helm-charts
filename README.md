## Adding a service to production
1. Create a dockerfile in the root of the project that only copies the binaries and does not build from source.
2. Create a tiltfile that builds, migrate db and deploys the application to kubernetes.
3. Create a helm chart for the service in [helm-charts/charts](https://github.com/lundqvist-travaru/helm-charts/tree/master/charts)
4. Create default kubernetes values in [helm-charts](https://github.com/lundqvist-travaru/helm-charts/tree/master/umbrella/lugo-umbrella) repo both in .values.yaml and .values.prod.yaml
5. Add configuration for API in [lugo-kubernetes/Tiltfile-example.yaml](https://github.com/lundqvist-travaru/lugo-kubernetes/master/Tiltfile-example)