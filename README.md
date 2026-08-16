# apurvasaraiya.github.io

Personal site — [apurvasaraiya.github.io](https://apurvasaraiya.github.io).

Built with [Astro](https://astro.build), no CSS frameworks. Deploys to GitHub Pages
via Actions on every push to `main`.

## Develop

```bash
bun install
bun run dev            # local dev server
bun run build:gh-pages # production build into dist/
bun run preview        # serve the production build
```

## Structure

- `src/pages/index.astro` — the single page (hero, now, work, toolbox, contact)
- `src/styles/global.css` — design tokens and base styles
- `scripts/og.html` — source for the social-preview card; regenerate with `scripts/generate-og.sh`
