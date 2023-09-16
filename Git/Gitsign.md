## Introducing Chainguard Enforce for Git with Gitsign Support

## Introduction
Hey everyone, welcome back to the channel! Today, I've got something exciting for you. We're diving into a brand-new app called Chainguard Enforce for Git, which now supports Gitsign signatures from Sigstore. 

## Installation
Installing Enforce for Git is a two-step process:

1. **GitHub App Installation**: Install the app on GitHub. This can be to your personal account or an organization.
2. **Gitsign Setup**: Make sure you have Gitsign installed and configured on your dev machine.

The app automatically engages with new pull request events, making your workflow even smoother.

## PR Checks
The app only responds to existing PRs if there's new commit activity. So, make sure you keep an eye on that!

## Configuring Verification Policy
For customizing your verification policy, create a `.chainguard/source.yaml` at your repo root. Here's an example YAML config:
```yaml
spec:
  authorities:
    - keyless:
        identities:
          - issuer: https://accounts.google.com
          - subjectRegExp: .*@chainguard.dev$
    - key:
        kms: https://github.com/web-flow.gpg
```
Supported Fields

The following fields in your config are respected:

Keyless
Identities
Issuer
Key

And more...

Trusting Signed Commits

Here's how you can trust commits made via the GitHub API:

```yaml
- key:
    kms: https://github.com/web-flow.gpg
```
Enforce Submission Requirements

Want to make Enforce mandatory for PR submissions? Just enable the "Require status checks before merging" feature.

Branch Protection
Navigate to Settings > Branches in your repo to set up Enforce as a required status check.

Repository Access
To add or remove repos from Enforce, navigate to Installed GitHub Apps > Chainguard Enforce > Configure.
