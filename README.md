# Demo GitOps Promotion Hydrator

This demo is a very quick and dirty repo in order to test the GitOps Promoter without an ArgoCD hydrator.

## How to use

* Fork Repo
* Configure Promoter According to [Getting Started](https://argo-gitops-promoter.readthedocs.io/en/latest/getting-started/)
* Run `./setup-repo-branches.sh`
* Make a change to `base/kustomization.yaml` to bump image across all environments.
* Run `./commit-hydrate.sh`
