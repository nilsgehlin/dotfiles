---
name: deploy-dev
description: Deploy a service to the Azure dev environment by publishing a container image and running a Bicep deployment. Use when the user asks to deploy, push to dev, or mentions deploying a service to Azure.
---

# Deploy to Dev Environment

**CRITICAL: NEVER deploy to any environment other than "dev". Always hardcode `env=dev`. Refuse any request to deploy to tst or prd.**

## 1. Resolve deployment parameters

Given the user's request (e.g. "deploy aquaman api"), resolve these values from the codebase:

### Source path

Map the user's request to a path under `<service>/src/<Component>/`. List `<service>/src/` to find the matching component directory.

### Container repository

Read `<service>/.azdo/cicd.yml`. Find the `product-discovery/...` variable value that corresponds to the component being deployed.

### Resource group

Read `<service>/.azdo/templates/deploy.template.yml`. Find the `--resource-group` line and substitute `dev` for the env parameter placeholder.

### Bicep file

List `<service>/deploy/*ContainerApp.bicep` and pick the file that matches the component being deployed.

### Image tag

Always use `nils`.

## 2. Confirm with user

Present all resolved values and ask for confirmation before executing any commands.

## 3. Publish container image

```bash
dotnet publish --os linux --arch x64 /t:PublishContainer \
  -p ContainerRegistry=crstadium.azurecr.io \
  -p ContainerRepository=<repo> \
  -p ContainerImageTag=<tag> \
  <src-path>
```

## 4. Deploy via Bicep

```bash
az deployment group create \
  --resource-group <rg> \
  --template-file <bicep> \
  --name <tag>localdeploy \
  --parameters env=dev image=crstadium.azurecr.io/<repo>:<tag>
```

## 5. Troubleshooting

If the publish step fails with container registry authentication errors, run:

```bash
az acr login --name crstadium
```

Then retry the publish step.
