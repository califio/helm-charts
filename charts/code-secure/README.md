# Code Secure Helm Chart

A Helm chart for deploying Califio Code Secure, a security-focused application for code analysis and protection.

## Features

- PostgreSQL database integration (optional)
- Configurable deployment settings
- Kubernetes-native deployment

## Requirements

- Kubernetes 1.16+
- Helm 3.0+

## Installation

```bash
# Add the repository
helm repo add califio https://califio.github.io/helm-charts

# Install the chart
helm install code-secure califio/code-secure
```

## Configuration

For more configuration options, please refer to the `values.yaml` file.

## Upgrading

To upgrade the chart:

```bash
helm upgrade code-secure califio/code-secure
```

## Uninstalling

To uninstall/delete the chart:

```bash
helm uninstall code-secure
```

## Troubleshooting

If you encounter any issues:
1. Check the Kubernetes events for the deployment
2. Verify the logs of the pods
3. Ensure all required configurations are set correctly

## Support

For support, please open an issue in the main repository or contact the Calif team. 