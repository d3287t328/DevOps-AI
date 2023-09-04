
# Remove Accidental File from Git History

To completely remove a file from Git history without leaving any trace, you can use the `filter-repo` tool. Here is a step-by-step guide on how to do it.

## Clone and Install `filter-repo`

```bash
git clone https://github.com/newren/git-filter-repo.git
cd git-filter-repo
sudo make install

Navigate to Your Repository
Navigate to the directory where your Git repository is located.

Run filter-repo
git filter-repo --path file.mp3 --invert-paths

Force Push Changes
git push origin --force

⚠️ Warning: This will rewrite history; use with caution. Make sure to notify all collaborators as they will need to re-clone the repository.

Verify Removal
To confirm that the file is completely removed from the Git history, run the following command:

git log --full-history -- file.mp3

If nothing is returned, the file is completely removed from history.

## Sources

- [Git Filter Repo](https://github.com/newren/git-filter-repo)
- [Git Log](https://git-scm.com/docs/git-log)

