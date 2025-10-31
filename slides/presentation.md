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

- macOS, Linux, Windows WSL2 or traditional Windows will work
- Any recent machine will do the job, usually 8GB is the entry point.
- A Docker provider is required (e.g., Docker Desktop, Docker Engine, or other compatible Docker environments). See [DDEV Docker Providers](https://docs.ddev.com/en/stable/users/install/#docker-provider) for details.

---

## Installing DDEV

```bash
# macOS with Homebrew
brew install ddev/ddev/ddev

# Windows (WSL2 or traditional)
Use the Windows Installer

# Linux (Ubuntu example)
Use apt, see https://docs.ddev.com/en/stable/users/install/ddev-installation/#ddev-installation-linux
```

---

## Verifying Installation

```bash
ddev --version

# ddev version v1.24.8
```

---

## Creating a New TYPO3 Project

```bash
mkdir my-typo3-site
cd my-typo3-site
ddev config --project-type=typo3 --docroot=public
ddev start
```

## Installing TYPO3 (Quickstart)

```bash
ddev composer create-project "typo3/cms-base-distribution"
ddev typo3 setup \
  --admin-user-password="Demo123*" \
  --driver=mysqli \
  --create-site=https://${PROJECT_NAME}.ddev.site \
  --server-type=other \
  --dbname=db \
  --username=db \
  --password=db \
  --port=3306 \
  --host=db \
  --admin-username=admin \
  --admin-email=admin@example.com \
  --project-name="My TYPO3 site" \
  --force
ddev launch /typo3/
```

---

## Enabling Xdebug

```bash
ddev xdebug on
```

- Your IDE should listen on port 9003
- Set a breakpoint
- Visit a page
- Debug!
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

- Community-contributed add-ons for Redis, Solr, etc.
- See https://addons.ddev.com for a list of available add-ons
- Official add-ons are in the `ddev` org and maintained by the DDEV team
- Install with `ddev add-on get ddev/ddev-redis`

---

## Many databases and versions

- See [Database Management](https://docs.ddev.com/en/stable/users/usage/database-management/) for details.
- `ddev delete` to remove existing database
- `ddev config --database=postgres:18`
- `ddev start`

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

## DDEV Troubleshooting Clinic

- Common issues and how to resolve them
- Debugging tips and commands
- Community resources and support channels
- Example: `ddev logs`, `ddev describe`, `ddev utility dockercheck`, `ddev utility diagnose`

---

## DDEV Add-on Creation Deep Dive

- How to create and publish custom add-ons
- Structure and configuration of add-ons
- Best practices for maintainability
- Example: Creating a Redis add-on

---

## Using Web Extra Daemons

- Running additional background services in DDEV with `web_extra_daemons`
- Use cases: queue workers, cron jobs, etc.

---

## Custom Docker Compose and Extra Services

- Done less these days since there are so many add-ons
- Extending DDEV with custom Docker Compose files
- Adding databases, caches, or other services
- Overriding default configurations safely
- Example snippet for adding a Solr service

---

## Customizing Add-ons with environment or config overrides

## DDEV in Corporate or Restricted Environments

- Handling proxy and firewall configurations
- Using private registries and mirrors
- Using private add-ons

---

## Git Workflows and Shared Development

- Best practices for using DDEV with Git
- Sharing configuration and environment files
- Handling database and file synchronization
- Integrating with feature branches and CI

---

## CI/CD and Automated Testing with DDEV

- Leveraging DDEV in continuous integration pipelines
- Running automated tests locally and remotely
- Using snapshots and import/export for test data
- Example GitHub Actions workflow snippet

---

## Working Offline or in Limited Connectivity

- Strategies for offline development with DDEV
- Pre-pulling images and caching dependencies
- Handling updates and syncing when online

---

## DDEV for Non-TYPO3 Frameworks

- Support for Drupal, WordPress, Laravel, and others
- Configuring project types and docroots
- Using custom commands and hooks
- Community examples and templates

---

## Contributing to DDEV Core or Docs

- How to get involved with development
- Reporting issues and submitting pull requests
- Writing and improving documentation
- Joining community meetings and discussions

---

## Additional Topics

- Creating your own hosting integration
- Creating your own add-on
- Integrating with Apache Solr

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
