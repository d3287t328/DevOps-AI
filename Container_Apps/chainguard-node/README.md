# Initialize git repository and add all files
git init
git add .

# Sign the commit with GPG
git commit -S -m "Initial commit"

# Create new container and mount the source code
newcontainer=$(buildah from cgr.dev/chainguard/node:latest)
buildah copy $newcontainer . /app

# Build and sign the image
buildah commit --sign-by=<GPG_Email> $newcontainer my-secure-ts-app

