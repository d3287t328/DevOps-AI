# Step 1: Install and configure Gitsign
git clone https://github.com/sigstore/gitsign.git
pushd gitsign
./install.sh  # Assuming installation script, actual command may differ
popd

# Step 2: Navigate to your GitHub repository
pushd /path/to/your/github/repo

# Step 3: Create .chainguard/source.yaml
echo "spec:
  authorities:
    - keyless:
        identities:
          - issuer: https://accounts.google.com
          - subjectRegExp: .*@chainguard.dev$
    - key:
        kms: https://github.com/web-flow.gpg" > .chainguard/source.yaml

# Step 4: Add and commit the Chainguard configuration
git add .chainguard/source.yaml
git commit -m "Add Chainguard Enforce configuration"

# Step 5: Push to GitHub
git push origin main
