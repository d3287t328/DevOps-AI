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

Here are some notes on why trusting this key is so important:

The key at https://github.com/web-flow.gpg is a special GPG key managed by GitHub for commits made through the GitHub API or UI. By adding it as an authority in your .chainguard/source.yaml file, you configure Chainguard Enforce to trust commits signed with this key.

Trusts GitHub-managed commits, simplifying workflow. Allows pull requests merged via GitHub UI/API to pass Chainguard Enforce checks without manual signature. Useful for automated workflows and integrations.

Automated Workflows: If you're using GitHub Actions or other CI/CD tools, commits may be automatically generated. Trusting the GitHub-managed key allows these commits to pass your security checks without additional configuration.

Admin Operations: When resolving conflicts or making quick fixes directly via the GitHub UI, commits are signed by GitHub's web-flow. Trusting this key avoids breaking your signing policy for these cases.

Collaboration: External contributors who might not have set up Gitsign can still have their commits trusted when using GitHub's web UI, lowering the barrier to entry.

Security: The key is managed by GitHub, reducing the risk associated with key compromise as GitHub has its security measures.

Streamlining: Reduces the number of steps each team member must take to get up and running, making it easier to enforce a strong security posture without complicating the development workflow.

Enforce Submission Requirements

Want to make Enforce mandatory for PR submissions? Just enable the "Require status checks before merging" feature.

Branch Protection
Navigate to Settings > Branches in your repo to set up Enforce as a required status check.

Repository Access
To add or remove repos from Enforce, navigate to Installed GitHub Apps > Chainguard Enforce > Configure.
