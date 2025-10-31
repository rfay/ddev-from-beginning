# Using This Template

This guide explains how to use this presentation template to create your own reveal.js presentations.

## Quick Start

1. **Click "Use this template"** at the top of the GitHub repository page
2. **Name your new repository** (e.g., `my-awesome-talk`)
3. **Clone your new repository**:
   ```bash
   git clone https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
   cd YOUR-REPO-NAME
   ```

4. **Run the setup script**:
   ```bash
   ./setup-template.sh
   ```

   The script will:
   - Detect your repository name from git
   - Ask for confirmation or let you customize values
   - Update all template placeholders
   - Rename the markdown file to match your repo name
   - Self-delete when complete

5. **Edit your presentation**:
   ```bash
   # Edit the markdown file in the slides/ directory
   # It will be named after your repository
   ```

6. **Preview locally**:
   ```bash
   npm start
   ```
   Opens at http://localhost:8000

7. **Deploy to GitHub Pages**:
   
   **Step 1: Enable GitHub Actions Workflow Permissions**
   - Go to **Settings** > **Actions** > **General**
   - Scroll to **Workflow permissions**
   - Select **Read and write permissions**
   - Check **Allow GitHub Actions to create and approve pull requests**
   - Click **Save**
   
   **Step 2: Enable GitHub Pages**
   - Go to **Settings** > **Pages**
   - Under **Source**, select **GitHub Actions**
   - Click **Save**
   
   **Step 3: Push and Deploy**
   - Push your changes to `main` branch
   - GitHub Actions will automatically build and deploy
   - Monitor progress in the **Actions** tab
   - Your presentation will be live at `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`

## What Gets Customized

The setup script updates these files:

### README.md
- Replaces `YOUR-USERNAME` with your GitHub username
- Replaces `YOUR-REPO-NAME` with your repository name
- Replaces `Presentation Title` with your custom title

### index.html
- Updates the `<title>` tag
- Updates the markdown file reference in `data-markdown`

### package.json
- Updates the `name` field to match your repository

### slides/
- Renames `presentation.md` to `YOUR-REPO-NAME.md`

## Manual Customization

If you prefer not to use the setup script, update these values manually:

1. **README.md**: Search and replace placeholders
2. **index.html**: 
   - Line 7: Update `<title>`
   - Line 23: Update `data-markdown` path
3. **package.json**: Update the `name` field
4. **slides/**: Rename the markdown file

## Creating Your Presentation

Edit the markdown file in `slides/`:

```markdown
# My Presentation Title

Subtitle or description

---

## Slide 2

Content here

* Bullet 1
* Bullet 2

---

## Slide 3

```bash
# Code examples
echo "Hello"
```
```

### Slide Separators

- `---` creates a new horizontal slide
- `--` creates a vertical slide (nested under current)
- `Note:` at the start of a line creates speaker notes

### Adding Images

1. Add images to the `images/` directory
2. Reference in markdown:
   ```markdown
   ![Alt text](images/my-image.png)
   ```

### Code Blocks

Use fenced code blocks with language specification:

````markdown
```javascript
function hello() {
  console.log("Hello, world!");
}
```
````

## Customizing Styles

Edit `css/custom.css` to change:
- Colors
- Fonts
- Layout
- Custom classes

The template includes DDEV branding styles. Replace or modify these for your brand.

## reveal.js Configuration

In `index.html`, the `Reveal.initialize()` section contains many options:

- `controls`: Show navigation controls
- `progress`: Show progress bar
- `slideNumber`: Display slide numbers
- `transition`: Slide transition effect
- And many more...

See [reveal.js documentation](https://revealjs.com/config/) for all options.

## GitHub Pages Deployment

The repository includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) that automatically builds and deploys your presentation.

### Initial Setup

**Step 1: Enable GitHub Actions Workflow Permissions**

1. Go to **Settings** > **Actions** > **General**
2. Scroll down to **Workflow permissions**
3. Select **Read and write permissions**
4. Check **Allow GitHub Actions to create and approve pull requests**
5. Click **Save**

Without these permissions, the workflow cannot deploy to GitHub Pages.

**Step 2: Enable GitHub Pages**

1. Go to **Settings** > **Pages**
2. Under **Build and deployment** > **Source**
3. Select **GitHub Actions** from the dropdown
4. Click **Save**

**Step 3: Deploy**

1. Push your changes to the `main` branch
2. The workflow will automatically trigger
3. Monitor progress in the **Actions** tab
4. Once complete (usually 1-2 minutes), your presentation is live

### How It Works

The workflow:
1. Triggers on every push to `main` branch
2. Builds the presentation by copying necessary files
3. Creates a deployment artifact
4. Deploys to GitHub Pages
5. Your site is available at `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`

### Troubleshooting Deployment

**Workflow fails with "Resource not accessible by integration"**
- Check that workflow permissions are set to "Read and write permissions" in Settings > Actions > General

**Pages not deploying**
- Verify GitHub Pages source is set to "GitHub Actions"
- Check the Actions tab for error messages
- Ensure you've pushed to the `main` branch

**404 error when visiting the URL**
- Wait a few minutes after the first deployment
- Check Settings > Pages to confirm the deployment URL
- Verify the workflow completed successfully in Actions tab

## Troubleshooting

### Setup script doesn't detect repository

Run with custom values:
```bash
./setup-template.sh
# Answer 'n' when asked if detected values are correct
# Enter your values manually
```

### Presentation doesn't load

Check:
- Markdown file name matches reference in `index.html`
- Files are in correct directories
- GitHub Pages is enabled and deployed

### Images don't display

- Ensure images are in `images/` directory
- Use correct relative paths: `images/filename.png`
- Check image file names match (case-sensitive on Linux)

## Resources

- [reveal.js Documentation](https://revealjs.com/)
- [Markdown Guide](https://www.markdownguide.org/)
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [GitHub Template Repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)
