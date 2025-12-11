# Deploying to GitHub Pages

This guide explains how to deploy your Astro personal website to GitHub Pages.

## Prerequisites

- A GitHub account
- Git installed locally
- Bun installed (`curl -fsSL https://bun.sh/install | bash`)

## Quick Deploy Steps

### 1. Create a GitHub Repository

1. Go to [github.com/new](https://github.com/new)
2. Name your repository (e.g., `personal-website` or `yourusername.github.io`)
3. Keep it public for free GitHub Pages hosting
4. Don't initialize with README (we already have files)

### 2. Update Configuration

Edit `astro.config.mjs` to set your GitHub username and repository name:

```javascript
export default defineConfig({
  site: 'https://yourusername.github.io',
  base: '/your-repo-name/',  // Use '/' if repo is yourusername.github.io
  output: 'static',
});
```

**Note:** If your repository is named `yourusername.github.io`, set `base: '/'`.

### 3. Build for Production

```bash
# Standard build
bun run build

# Or build with a specific base path for GitHub Pages
BASE_PATH=/your-repo-name/ bun run build
```

The built files will be in the `dist/` folder.

### 4. Deploy Options

#### Option A: GitHub Actions (Recommended)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Bun
        uses: oven-sh/setup-bun@v2

      - name: Install dependencies
        run: bun install

      - name: Build
        run: bun run build

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

Then enable GitHub Pages in your repository:
1. Go to **Settings → Pages**
2. Under "Build and deployment", select **GitHub Actions**

#### Option B: Manual Deploy with gh-pages

```bash
# Install gh-pages globally
bun add -g gh-pages

# Build the site
bun run build

# Deploy to gh-pages branch
gh-pages -d dist
```

Then in GitHub:
1. Go to **Settings → Pages**
2. Set source to **Deploy from a branch**
3. Select the `gh-pages` branch

### 5. Push Your Code

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/your-repo-name.git
git push -u origin main
```

## Customization

### Changing Content

- **Homepage**: Edit `src/pages/index.astro`
- **Projects**: Edit `src/pages/projects.astro`
- **Blog**: Edit `src/pages/blog.astro`
- **Navigation**: Edit `src/components/Nav.astro`
- **Footer**: Edit `src/components/Footer.astro`

### Updating Personal Info

1. Replace "YourName" with your actual name in:
   - `src/components/Nav.astro`
   - `src/components/Footer.astro`
   - `src/pages/index.astro`

2. Update social links in `src/components/Nav.astro`

3. Add your real projects in `src/pages/projects.astro`

### Styling

Global styles are in `src/styles/global.css`. Key CSS variables:

```css
:root {
  --color-accent: #ff6b6b;      /* Primary accent color */
  --color-secondary: #ffeaa7;   /* Secondary color */
  --color-tertiary: #81ecec;    /* Tertiary color */
}
```

## Development Commands

```bash
# Start dev server
bun run dev

# Build for production
bun run build

# Preview production build
bun run preview
```

## Troubleshooting

### Assets not loading?
Make sure the `base` path in `astro.config.mjs` matches your repository name.

### 404 errors on navigation?
GitHub Pages doesn't handle client-side routing by default. Astro generates static HTML, so this shouldn't be an issue with the default static output.

### Build failing?
Run `bun run build` locally first to check for errors.

---

🎉 **That's it!** Your site should be live at `https://yourusername.github.io/your-repo-name/`

