<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">


# 🧱 DDEV from the Beginning

Welcome! Let’s explore how **DDEV** can transform your local development workflow.✨


---

## 💻 Why Local Development? 

Let’s see why local is better! 🏡

- We work on separate environments (usually our local computers) 🖥️  
- Changes made for one issue/bug/feature affect only the developer working on them  
- Live and staging environments are affected predictably and when desired  
- Experimentation is easy and free ✨  

---

## 🚀 Why Use DDEV?

Here’s why **DDEV** is a game changer! 🐳

- Simple **Docker-based** local dev environment ✅  
- Supports multiple CMS and frameworks  
- Easy setup and configuration  
- Consistent environments across teams 🤝  

---

## 🖥️ System Requirements

What you’ll need to get started ⚙️

- **macOS**, **Linux**, **Windows WSL2** or traditional Windows are all supported  
- Any recent machine will do the job (8GB RAM recommended)  
- A **Docker provider** is required (e.g., Docker Desktop, Docker Engine, or other compatible Docker environments).  
  - See [DDEV Docker Providers](https://docs.ddev.com/en/stable/users/install/#docker-provider) for details.

---

## 🧱 Installing DDEV

Let’s install **DDEV** on your system! 🛠️

```bash
# macOS with Homebrew
brew install ddev/ddev/ddev

# Windows (WSL2 or traditional)
Use the Windows Installer

# Linux (Ubuntu example)
Use apt, see https://docs.ddev.com/en/stable/users/install/ddev-installation/#ddev-installation-linux
```

---

## ✅ Verifying Installation

Check that **DDEV** is installed and ready! 🔍

```bash
ddev --version

# ddev version v1.24.8
```

---

## 🆕 Creating a New TYPO3 Project

Start your first **TYPO3** project in seconds! ✨

```bash
mkdir my-typo3-site
cd my-typo3-site
ddev config --project-type=typo3 --docroot=public
ddev start
```

---

## 🧱 Installing TYPO3 (Quickstart)

Quickly install **TYPO3** with Composer and DDEV. 🏗️

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

## Team Workflows

- Check in `.ddev` (but not the `.ddev/.gitignore`)
- Change project configuration with pull requests
- ARM64/AMD64 architecture considerations
- Integrating Traditional Windows folks


---

## 🐞 Enabling Xdebug

Debug your code with **Xdebug** in DDEV! 🐛

```bash
ddev xdebug on
```

- Your IDE should listen on port 9003
- Set a breakpoint
- Visit a page
- Debug! 🐛
- Disable (for performance and normal browsing) with `ddev xdebug off`

---

## Troubleshooting Xdebug

- Temporarily disable firewall, VPN, virus checker, proxies
- Get your IDE to listen on port 9003
- Try to connect to it from inside the web container

---

## 📊 Performance Profiling with XHGui

Analyze performance with **XHGui**. 📈

```bash
ddev config global --xhprof-mode=xhgui
ddev xhgui on
```

- Use XHGui for profiling and performance analysis 📈
- Enable capture with `ddev xhgui on`
- Visit things
- `ddev xhgui` to launch the run browser

---

## 🗄️ Using PHPMyAdmin (and other database browsers)

Manage your databases visually with **PHPMyAdmin**! 🗄️

```bash
ddev add-on get ddev/ddev-phpmyadmin
ddev phpmyadmin
```

There are so many other database browsers as well!

---

## 🧩 Using Add-ons

Extend **DDEV** with powerful add-ons! 🔌

- Community-contributed add-ons for Redis, Solr, etc. 🔌
- See https://addons.ddev.com for a list of available add-ons
- Official add-ons are in the `ddev` org and maintained by the DDEV team
- Install with `ddev add-on get ddev/ddev-redis`

---

## 🗄️ Many Databases and Versions

Choose your database and version easily. 🗄️

- See [Database Management](https://docs.ddev.com/en/stable/users/usage/database-management/) for details.
- `ddev delete` to remove existing database
- `ddev config --database=postgres:18`
- `ddev start`

---

## ⚡ Mutagen and Webserving Performance

Enjoy fast file syncing with **Mutagen**. 🚀

- Mutagen is enabled by default on macOS and traditional Windows for faster file syncing. 🚀

---

## 💾 Exporting Database

Easily export your database for backup or sharing. 💾

```bash
ddev export-db --file=.tarballs/db.sql.gz
```

---

## 📥 Importing Database

Import databases with a single command. 📥

```bash
ddev import-db --file=.tarballs/db.sql.gz
```

---

## ⏳ Creating and Restoring Snapshots

Take and restore **snapshots** for safe experimentation. 🕰️

```bash
ddev snapshot --name=beforechange
ddev snapshot restore beforechange
```

## Using `ddev share` to let anybody see your project

- Get a free ngrok account at https://ngrok.com
- Get the token and do configuration as in docs
- Set the `ngrok_args: "--domain <configured-domain>` in .ddev/config.yaml
- Use `$BASE_DOMAIN` in your TYPO3 sites/*/config.yaml `base`
- 
- `ddev share` will create a public URL for your project
- Visit the URL to see your project
- `ddev share` will keep the URL up to date as you make changes
- `ddev share --unshare` will stop sharing the URL

---

## 🚚 Pulling from and Pushing to Hosting/Production

Sync your local and remote environments with ease. 🔄

- Use any familiar tool for deployment (rsync, git, etc.) 🔄
- Hosting integrations allow `ddev pull <integration>` and `ddev push <integration>`
- Or use DDEV's import/export and snapshot features to synchronize databases and files between local and remote environments.


---

## 🛠️ DDEV Troubleshooting Clinic

Tips for solving common **DDEV** issues. 🩺

- Common issues and how to resolve them 🛠️
- Debugging tips and commands
- Community resources and support channels
- Example: `ddev logs`, `ddev describe`, `ddev utility dockercheck`, `ddev utility diagnose`

---

## 🧩 DDEV Add-on Creation Deep Dive

Build your own **DDEV add-ons** for custom needs! 🛠️

- How to [create and publish custom add-ons](https://notion.so/native/Contributor-Training-Add-ons-creating-maintaining-testing-1040f7d007c94bef8669a400a2437c98?source=copy_link0) 🛠️
- Structure and configuration of add-ons
- Best practices for maintainability
- Example: Creating a Redis add-on

---

## ⚙️ Using Web Extra Daemons

Run background services easily inside **DDEV**. ⚙️

- Running additional background services in DDEV with `web_extra_daemons`
- Use cases: queue workers, cron jobs, etc.

---

## 🐳 Custom Docker Compose and Extra Services

Add extra services with custom Docker Compose files. 🐳

- Done less these days since there are so many add-ons
- Extending DDEV with custom Docker Compose files
- Adding databases, caches, or other services
- Overriding default configurations safely
- Example snippet for adding a Solr service

---

## 🎨 Customizing Add-ons with Environment or Config Overrides

Fine-tune add-ons for your project requirements. 🎨

---

## 🏢 DDEV in Corporate or Restricted Environments

Tips for using **DDEV** behind proxies or in secure settings. 🏢

- Handling proxy and firewall configurations
- Using private registries and mirrors
- Using private add-ons

---

## 🔄 Git Workflows and Shared Development

Collaborate using **Git** and **DDEV** for smooth teamwork. 🔗

- Best practices for using DDEV with Git
- Sharing configuration and environment files
- Handling database and file synchronization
- Integrating with feature branches and CI

---

## 🤖 CI/CD and Automated Testing with DDEV

Integrate **DDEV** into your CI/CD pipelines for automation. 🤖

- Leveraging DDEV in continuous integration pipelines
- Running automated tests locally and remotely
- Using snapshots and import/export for test data
- Example GitHub Actions workflow snippet

---

## 🌐 Working Offline or in Limited Connectivity

Develop anywhere—even without internet! 🌐

- Strategies for offline development with DDEV
- Pre-pulling images and caching dependencies
- Handling updates and syncing when online

---

## 🧩 DDEV for Non-TYPO3 Frameworks

Use **DDEV** for **Drupal**, **WordPress**, **Laravel**, and more! 🛠️

- Support for Drupal, WordPress, Laravel, and others
- Configuring project types and docroots
- Using custom commands and hooks
- Community examples and templates

---

## 🤝 Contributing to DDEV Core or Docs

Get involved and help improve **DDEV**! 🤗

- How to get involved with development
- Reporting issues and submitting pull requests
- Writing and improving documentation
- Joining community meetings and discussions

---

## What's New in DDEV?

---

## AI and DDEV

- Create a PR using Claude Code

---

## 💡 Additional Topics

Other advanced features and integrations. 💡

- Creating your own hosting integration
- Creating your own add-on
- Integrating with Apache Solr
- DDEV in CI/CD: GitHub Actions and GitLab CI
- VPNs, Proxies, and DNS, solving problems
- GitHub Codespaces and other web-based dev environments
- Basic git
- Git worktrees
- `git bisect` for fun and profit
- Basics of troubleshooting and debugging
- Team workflows

---

## 🌟 Getting Involved

Join the vibrant **DDEV** community! 🌟

- Join the DDEV community on Discord - https://ddev.com/s/discord
- Report issues and contribute on GitHub - https://github.com/ddev/ddev
- Join us for contributor and user training
- Sign up for the DDEV newsletter, https://ddev.com/newsletter

---

## We're recruiting a TYPO3 maintainer!

Simon Gilli used to take care of all things TYPO3 in DDEV, but we lost him somewhere.

We'd love to have you step up and fill that role.

---

## What would YOU like to see in DDEV?

- DDEV is here for you, we always want to hear from you.

---

## 📚 Resources

Explore more with these helpful links. 📚

- Official docs: https://docs.ddev.com
- https://ddev.com
- Tutorials and examples on GitHub
- Community forums and chat

---

## Help make the DDEV project sustainable!


---

## 📝 Summary

A quick recap of **DDEV** benefits: 📝

- DDEV simplifies and standardizes local development
- Supports TYPO3 and many other CMS/frameworks
- Powerful debugging, profiling, and advanced features
- Strong community and steady development 💪

---

## 🚀 Next Steps

Ready to try **DDEV**? Here’s what to do next! 🚀

- Try creating your own project with DDEV
- Explore add-ons and custom configurations
- Join the community and contribute! 🎉

---

🎉 Thank you for joining this session!

Let’s build amazing things together with **DDEV**. 🐳✨

<img src="images/ddev-logo.svg" alt="DDEV Logo" class="ddev-logo">
