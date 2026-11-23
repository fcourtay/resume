# Florent Courtay — Resume

Lightweight static resume built with [Astro](https://astro.build) and [Tailwind CSS](https://tailwindcss.com), packaged in an Nginx Alpine container.

## Editing the Resume

Update [src/content/resume.en.md](src/content/resume.en.md) (English, served at `/`) and [src/content/resume.fr.md](src/content/resume.fr.md) (French, served at `/fr/`) with any content changes. Styling, dark mode, language switcher, and print/PDF layout are defined in [src/styles/global.css](src/styles/global.css) and [src/components/ResumePage.astro](src/components/ResumePage.astro).

## Local Development

Requires Node.js `>=22.12.0`.

```sh
npm install
npm run dev       # Start dev server at http://localhost:4321
npm run build     # Build static site to ./dist
npm run preview   # Preview production build locally
```

## Docker

```sh
docker build -t resume .
docker run --rm -p 8080:80 resume
```

Pushes to `main` automatically build and publish multi-arch (`linux/amd64`, `linux/arm64`) images to `ghcr.io/fcourtay/resume-cv`.
