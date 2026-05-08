---
name: deploy-dev
description: Deploy a service to the Azure dev or test environment by publishing a container image and running a Bicep deployment. Use when the user asks to deploy, push to dev, push to test, or mentions deploying a service to Azure.
---

# Deploy to Dev/Test Environment

**CRITICAL: Only deploy to "dev" or "tst". NEVER deploy to "prd". Refuse any request to deploy to production.**

If the user does not specify an environment, default to `dev`. If they say "test" or "tst", use `tst`.

## 1. Resolve deployment parameters

Given the user's request (e.g. "deploy aquaman api"), resolve these values from the codebase:

### Source path

Map the user's request to a path under `<service>/src/<Component>/`. List `<service>/src/` to find the matching component directory.

### Container repository

Read `<service>/.azdo/cicd.yml`. Find the `product-discovery/...` variable value that corresponds to the component being deployed.

### Resource group

Read `<service>/.azdo/templates/deploy.template.yml`. Find the `--resource-group` line and substitute the target environment (`dev` or `tst`) for the env parameter placeholder.

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
  --parameters env=<env> image=crstadium.azurecr.io/<repo>:<tag>
```

## 5. Troubleshooting

If the publish step fails with container registry authentication errors, run:

```bash
az acr login --name crstadium
```

Then retry the publish step.
