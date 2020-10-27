# terraform-devsecops-sandbox

Terraform module that configures a DevSecOps Sandbox with user accounts and instructional lessons

## Introduction

### Purpose

The purpose of this module is to configure a new DevSecOps "sandbox" that has been deployed to a kubernetes cluster. It is intended to be a "turn-key" module, so it includes (almost) everything needed to have the sandbox tools configured

### High-level design

#### Resources provisioned

- [x] Configurable number of GitLab user accounts, whose usernames and passwords are provided as an output
- [x] A GitLab group with a configurable name
- [x] Configuration of the user accounts such that they are members of the new group with the "developer" level of permissions

## Usage

### Prerequisites

1. Terraform v0.13+ - Uses the new way to pull down 3rd party providers.
1. \*nix operating system - Windows not supported. If you need to use this on Windows you can run it from a Docker container.
1. (?) Since this series of modules uses `local-exec`, the following tools also need to be installed on the machine using this module:
   1. [kubectl][kubectl]
   1. [helm][helm]
   1. [helmfile][helmfile]
   1. [helm-diff plugin][helm-diff]

### Instructions

#### Complete Example

For convenience, a Taskfile has been provided, to be used with [go-task][go-task]

```
task applyExample
task destroyExample
```

Here's a minimal example:

```hcl
provider "gitlab" {
  token = "some-token"
  base_url = "https://gitlab.example.com/api/v4/"
}

module "devsecops-sandbox-config" {
  source = "git::https://code.saicinnovationfactory.com/dau/move-to-repo-one/terraform-modules/terraform-devsecops-sandbox-config.git?ref=tags/X.Y.Z"
  gitlab_user_count = var.gitlab_user_count
  gitlab_group_name = var.gitlab_group_name
}
```

## Contributing

Contributors to this module should make themselves familiar with this section

### Prerequisites

- Terraform v0.13+
- [pre-commit][pre-commit]
- Pre-commit hook dependencies
  - nodejs (for the prettier hook)
  - [tflint][tflint]
  - [terraform-docs][terraform-docs]
  - [tfsec][tfsec]
- Run `pre-commit install` in root dir of repo (installs the pre-commit hooks so they run automatically when you try to do a git commit)
- Run `terraform init` in root dir of repo so the pre-commit hooks can work

### Versioning

This module will use SemVer, and will stay on v0.X for the foreseeable future

<!-- prettier-ignore-start -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0, < 0.14.0 |
| gitlab | >= 3.0.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| gitlab | >= 3.0.0, < 4.0.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gitlab\_group\_name | Name to use for new GitLab group. | `string` | n/a | yes |
| gitlab\_user\_count | Number of users to create. Must be at least 1 | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gitlab\_user\_credentials | Map of Gitlab usernames and passwords |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- prettier-ignore-end -->
