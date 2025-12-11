<!-- ba4f427d-5f1d-4da1-b84e-9a80661979e8 7b59e70b-5c59-4fdf-b791-e3c4a07160ad -->
# Astro Minimal Cartoony Site

- Scaffold an Astro project with a clean base (white background, dark text, single accent) and global styles for typography, spacing, and a subtle cartoony motif (blobby shapes, soft shadows).
- Create shared UI: `src/layouts/Base.astro` with navbar/footer, `src/components/Nav.astro` for links/social icons, `Footer.astro`, and reusable `Card.astro` styles with rounded, cartoon edges.
- Landing page `src/pages/index.astro`: hero with playful blob/SVG background, short intro, primary CTA, and preview sections linking to projects and blog.
- Projects page `src/pages/projects.astro`: grid of project cards using placeholders (title, tech tags, summary, external link) with hover lift and cartoony accents.
- Blog page `src/pages/blog.astro`: list of post teaser cards (title, date, excerpt, read-more) using placeholders; ensure consistent styling and spacing.
- Responsiveness and polish: tune spacing/typography for mobile/tablet/desktop, keep minimal aesthetic, ensure focus states and accessible color contrast with the chosen accent.

### To-dos

- [ ] Scaffold Astro project and base config
- [ ] Add global styles, typography, cartoony theme accents
- [ ] Build base layout, nav, footer, card components
- [ ] Implement landing page hero and section previews
- [ ] Implement projects page with placeholder cards
- [ ] Implement blog page with placeholder teasers
- [ ] Tighten responsive spacing and accessibility