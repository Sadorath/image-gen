# Changelog

All notable changes to this project are documented here.

> These version numbers were assigned retroactively by walking back through the project's build history and grouping changes into logical releases. Exact calendar dates for the earlier entries weren't tracked at the time, so only the most recent entries carry a date — the ordering itself (oldest at the bottom, newest at the top) is accurate.

## v0.0.12

- Added a small version badge in the bottom-left corner of the app (e.g. "v0.0.12"). Clicking it opens a "What's New" panel showing this changelog.
- Added this `CHANGELOG.md` file. The app tries to load it directly (so edits to this file show up in the app automatically); if that's blocked, such as when running the app straight from a local file, it falls back to a built-in copy of the same text.

## v0.0.11 — 2026-09-04

- Renamed the app's main file from `background-generator.html` to `index.html`.
- New layers now default to Normal blend mode. Previously a few pattern layer types (Diagonal Checker, Hex Grid, Sci-Fi HUD Grid, Grain/Noise) defaulted to something else, which could be confusing on first add.
- Added a "live background" (kiosk) mode: opening the app from a share link (see v0.0.9/v0.0.10) now hides the entire sidebar and editor UI and stretches the canvas to fill the window, showing only the generated image. This also works when the page is embedded in an `<iframe>` with a share code in its `src` — the iframe renders just the live image, so nobody needs to download a PNG to use a design as a background.

## v0.0.10 — 2026-09-04

- Added a "Copy Code" button that copies just the design data as a short, portable text string — no URL or file path baked in, so it works no matter where the recipient has the app saved.
- Added an "Import a Link or Code" panel: paste either a full share link or a bare design code to load someone else's design.
- Share links and design codes now use URL-safe encoding (no `+`, `/`, or `=` characters), so they survive being pasted into chat apps, emails, and auto-linkers without getting mangled.

## v0.0.9 — 2026-09-04

- Added shareable designs: a "Copy Link" button encodes the entire layer stack — including any embedded images — into the page's URL, so sending that link to someone opens your exact design.

## v0.0.8 — 2026-09-03

- Fixed a horizontal scrollbar that could appear under the sidebar. The root cause was a browser default on `<fieldset>` elements that let a crowded layer card force the whole sidebar wider than intended.
- Increased the sidebar width from 340px to 400px.

## v0.0.7 — 2026-09-03

- Added layer grouping: select multiple layers and combine them into a folder with its own shared opacity and blend mode. Groups can be nested, duplicated, and ungrouped.

## v0.0.6 — 2026-09-02

- Every slider now has an editable numeric field next to it, styled as plain underlined text — type an exact value instead of only dragging.

## v0.0.5

- Added Undo / Redo (Ctrl+Z / Ctrl+Shift+Z), with a 50-step history.
- Added Randomize and Reset buttons.

## v0.0.4

- Added layer masking: any layer can be marked "use as mask," clipping the layer directly beneath it to its shape instead of drawing normally.
- Added per-layer blend modes (Overlay, Multiply, Screen, Difference, Color Dodge/Burn, Hard/Soft Light, Exclusion).

## v0.0.3

- Added an Image Overlay layer: pick a local image and control its fit, scale, offset, and flip.
- Added Hex Grid and Sci-Fi HUD Grid pattern layers.
- Pattern layers (Diagonal Checker, Stripes, Dots, Hex Grid, HUD Grid) can now be filled with a gradient instead of a flat color.

## v0.0.2

- Added a Grain / Noise layer, including a full Perlin/fractal noise engine with Clouds, Turbulence, and Marble styles.

## v0.0.1

- Initial release: a layered canvas background generator with Solid Fill, Linear Gradient, Radial Gradient, Diagonal Checker, Stripes, and Dots layers.
- Resolution presets (1080p, 1440p, 4K, ultrawide, mobile, custom) and PNG export.
