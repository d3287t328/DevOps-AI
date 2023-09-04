# Keyless Git Signing with Sigstore: A Complete Guide

This guide covers how to sign Git commits and tags using Sigstore's gitsign, a keyless signing tool that leverages your GitHub or OIDC identity.

## Table of Contents
- [Installation](#installation)
- [Configuration](#configuration)
- [File Config](#file-config)
- [Environment Variables](#environment-variables)
- [Usage](#usage)
- [Verifying Commits](#verifying-commits)
- [FAQ](#faq)

## Installation

### Using Homebrew
```bash

brew install sigstore/tap/gitsign

Using Go

```bash
go install github.com/sigstore/gitsign@latest

Configuration
For a Single Repository
Navigate to your repository directory and run the following commands:

```bash
git config --local commit.gpgsign true  
git config --local tag.gpgsign true  
git config --local gpg.x509.program gitsign  
git config --local gpg.format x509 
 
For All Repositories
Run these commands:

```bash
git config --global commit.gpgsign true  
git config --global tag.gpgsign true  
git config --global gpg.x509.program gitsign  
git config --global gpg.format x509  
Note: Learn more about these options in the git-config documentation.

File Config
You can configure gitsign using a standard git-config file. For instance, to set the Fulcio option for a single repo:

```bash
git config --local gitsign.fulcio https://fulcio.example.com
Supported Config Options
fulcio: Address of Fulcio server
logPath: Path to log status output
... Additional options omitted for brevity ...
Environment Variables
Various environment variables can be used to further configure gitsign. Check the official documentation for the full list.

Usage
Signing Commits
Sign commits with git commit -S or enable it globally:

```bash
git config --global commit.gpgsign true
Signing Tags
Sign tags with git tag -s or enable it globally:

```bash
git config --global tag.gpgsign true
Verifying Commits
Use gitsign verify to verify commits:

```bash
gitsign verify --certificate-identity=billy@chainguard.dev --certificate-oidc-issuer=https://accounts.google.com HEAD

Note: gitsign verify is preferred over git verify-commit and git verify-tag for better security.

FAQ
Q: Can I use gitsign with a private Sigstore instance?
A: Yes, gitsign is compatible with cosign for running against other Sigstore instances.