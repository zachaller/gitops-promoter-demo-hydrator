# Demo GitOps Promotion Hydrator

This demo is a very quick and dirty repo in order to test the GitOps Promoter without an ArgoCD hydrator.

## How to use

* Fork Repo
* Configure Promoter According to [Getting Started](https://argo-gitops-promoter.readthedocs.io/en/latest/getting-started/)
* Run `./setup-repo-branches.sh`
* Make a change to `base/kustomization.yaml` to bump image across all environments.
* Run `./commit-hydrate.sh`

There is also [this](https://github.com/zachaller/gitops-promoter-demo-hydrator/tree/main/example-gitops-promoter-resources) example directory
that has a start for the configuration of the promoter.

If you did not setup a webhook, you might also want to follow what the getting started guide suggest and lower `--promotion-strategy-requeue-duration` and
`--change-transfer-policy-requeue-duration` to something like 15s.
