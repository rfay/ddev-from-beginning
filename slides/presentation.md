<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">

# DDEV from the Beginning


---

## 1. Introduction

### Why Local Development?

- Speed up development cycles
- Work offline and on your own machine
- Avoid affecting live environments
- Experiment safely

---

### Why Use DDEV?

- Simple Docker-based local dev environment
- Supports multiple CMS and frameworks
- Easy setup and configuration
- Consistent environments across teams

---

## 2. Setup and Installation

### System Requirements

- A Docker provider is required (e.g., Docker Desktop, Docker Engine, or other compatible Docker environments). See [DDEV Docker Providers](https://docs.ddev.com/en/stable/users/install/#docker-provider) for details.

---

### Installing DDEV

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

### Verifying Installation

```bash
ddev --version

# Expected output example:
# DDEV version v1.24.8
```

---

## 3. Working with TYPO3

### Creating a New TYPO3 Project

```bash
mkdir my-typo3-site
cd my-typo3-site
ddev config --project-type=typo3 --docroot=public --create-docroot
ddev start
```

### Installing TYPO3 (Quickstart)

```bash
ddev ssh
composer create-project typo3/cms-base-distribution:^12 public
exit
ddev restart
```

---

### Accessing TYPO3

- Open browser at `http://my-typo3-site.ddev.site`
- Use TYPO3 backend at `/typo3`

---

## 4. Debugging and Profiling

### Enabling Xdebug

```bash
ddev xdebug on
ddev restart
```

- Connect your IDE to Xdebug on port 9003
- Disable with `ddev xdebug off`

---

### Using PHPMyAdmin

```bash
ddev add-on get ddev/ddev-phpmyadmin
ddev launch -p
```

- Opens PHPMyAdmin for database management

---

### Profiling with XHGui

```bash
ddev add-on get ddev/ddev-xhgui
```

- Use XHGui for profiling and performance analysis

---

## 5. Advanced Topics

### Using Add-ons

- Community-contributed add-ons for Redis, Solr, Mailhog, etc.
- Install with `ddev add-on get ddev/ddev-redis`

---

### Multi-Database Support

- Manage multiple databases using DDEV's built-in database management commands and configuration.
- See [Database Management](https://docs.ddev.com/en/stable/users/usage/database-management/) for details.

---

### Using Mutagen for Syncing

- Mutagen is enabled by default on macOS and traditional Windows for faster file syncing.
- To configure or disable, use `ddev config global --mutagen-enabled`

---

## 6. Deployment and Beyond

### Exporting Database

```bash
ddev export-db --file=db.sql
```

---

### Importing Database

```bash
ddev import-db --src=db.sql
```

---

### Creating and Restoring Snapshots

```bash
ddev snapshot save initial
ddev snapshot restore initial
```

---

### Pulling from and Pushing to Hosting/Production

- Use DDEV's import/export and snapshot features to synchronize databases and files between local and remote environments.
- Integrate with CI/CD pipelines to automate deployments.
- Ensure environment parity with DDEV configuration.

---

## 7. Contributing and Community

### Getting Involved

- Join the [DDEV community on Discord](https://ddev.com/s/discord)
- Report issues and contribute on [GitHub](https://github.com/ddev/ddev)
- Attend community meetings and workshops

---

### Resources

- Official docs: https://docs.ddev.com
- Tutorials and examples on GitHub
- Community forums and chat

---

## 8. Wrap-up

### Summary

- DDEV simplifies local development with Docker
- Supports TYPO3 and many other CMS/frameworks
- Powerful debugging and advanced features
- Strong community and ongoing development

---

### Next Steps

- Try creating your own project with DDEV
- Explore add-ons and custom configurations
- Join the community and contribute!

---

Thank you!

<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">
