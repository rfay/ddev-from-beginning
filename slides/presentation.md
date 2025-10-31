<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">

# DDEV from the Beginning


---

## Why Local Development?

Back in the day, people shared development and staging environments (or even production) for changes. It wasn't good.

Now...

- We work on separate environments (usually our local computers)
- Changes made for one issue/bug/feature affect only the developer working on them
- Live and staging environments are affected predictably and when desired
- Experimentation is easy and free

---

## Why Use DDEV?

- Simple Docker-based local dev environment
- Supports multiple CMS and frameworks
- Easy setup and configuration
- Consistent environments across teams

---

## System Requirements

- A Docker provider is required (e.g., Docker Desktop, Docker Engine, or other compatible Docker environments). See [DDEV Docker Providers](https://docs.ddev.com/en/stable/users/install/#docker-provider) for details.

---

## Installing DDEV

```bash
# macOS with Homebrew
brew install ddev/ddev/ddev

# Windows with Scoop
scoop install ddev

# Linux (Ubuntu example)
curl -LO https://raw.githubusercontent.com/ddev/ddev/master/scripts/install_ddev.sh
bash install_ddev.sh
```

---

## Verifying Installation

```bash
ddev --version

# Expected output example:
# DDEV version v1.24.8
```

---

## Creating a New TYPO3 Project

```bash
mkdir my-typo3-site
cd my-typo3-site
ddev config --project-type=typo3 --docroot=public --create-docroot
ddev start
```

## Installing TYPO3 (Quickstart)

```bash
ddev ssh
composer create-project typo3/cms-base-distribution:^12 public
exit
ddev restart
```

---

## Accessing TYPO3

- Open browser at `http://my-typo3-site.ddev.site`
- Use TYPO3 backend at `/typo3`

---

## Enabling Xdebug

```bash
ddev xdebug on
```

- Your IDE should listen on port 9003
- Disable (for performance and normal browsing) with `ddev xdebug off`

---

## Using PHPMyAdmin

```bash
ddev add-on get ddev/ddev-phpmyadmin
ddev launch -p
```

There are so many other database browsers as well!

---

## Profiling with XHGui

```bash
ddev xhgui on
```

- Use XHGui for profiling and performance analysis

---

## Using Add-ons

- Community-contributed add-ons for Redis, Solr, Mailhog, etc.
- Install with `ddev add-on get ddev/ddev-redis`

---

## Many databases and versions

- See [Database Management](https://docs.ddev.com/en/stable/users/usage/database-management/) for details.
- `ddev config --database=postgres:18`

---

## Mutagen and Webserving Performance

- Mutagen is enabled by default on macOS and traditional Windows for faster file syncing.

---

## Exporting Database

```bash
ddev export-db --file=.tarballs/db.sql.gz
```

---

## Importing Database

```bash
ddev import-db --file=.tarballs/db.sql.gz
```

---

## Creating and Restoring Snapshots

```bash
ddev snapshot --name=beforechange
ddev snapshot restore beforechange
```

---

## Pulling from and Pushing to Hosting/Production

- Use any familiar tool for deployment (rsync, git, etc.)
- Hosting integrations allow `ddev pull <integration>` and `ddev push <integration>`
- Or use DDEV's import/export and snapshot features to synchronize databases and files between local and remote environments.

---

## Getting Involved

- Join the DDEV community on Discord - https://ddev.com/s/discord
- Report issues and contribute on GitHub - https://github.com/ddev/ddev
- Join us for contributor and user training
- Sign up for the DDEV newsletter, https://ddev.com/newsletter

---

## Resources

- Official docs: https://docs.ddev.com
- https://ddev.com
- Tutorials and examples on GitHub
- Community forums and chat

---

## Summary

- DDEV simplifies and standardizes local development
- Supports TYPO3 and many other CMS/frameworks
- Powerful debugging, profiling, and advanced features
- Strong community and steady development

---

## Next Steps

- Try creating your own project with DDEV
- Explore add-ons and custom configurations
- Join the community and contribute!

---

Thank you!

<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">
