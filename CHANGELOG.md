# Changelog

All notable changes to this project are documented here.

> These version numbers were assigned retroactively by walking back through the project's build history and grouping changes into logical releases. Exact calendar dates for the earlier entries weren't tracked at the time, so only the most recent entries carry a date — the ordering itself (oldest at the bottom, newest at the top) is accurate.

## v0.0.17 — 2026-09-05

- Share links and Copy Code now compress the design data before encoding it, so links stay short even with embedded images baked in — a JSON-heavy 10-layer test design measured 88% smaller. (This uses the browser's own built-in gzip support rather than a bundled compression library; a design dominated by embedded images won't shrink nearly as much, since image data is already close to its own size limit.) Older uncompressed links and codes still open normally.
- Layers can now be reordered by dragging their handle (the ⋮⋮ at the left of each layer's header) up or down the list, in addition to the existing arrow buttons. Dragging only reorders within the same group, same as the arrows.
- Added Animate: any pattern layer (Diagonal Checker, Stripes, Dots, Hex Grid, Sci-Fi HUD Grid) or Perlin noise layer can now animate in a seamless, exactly-looping cycle — set a loop length and a Cycles count in the new Animation section, and pattern layers scroll while Perlin noise drifts, always ending each loop exactly where it began. Play/Pause controls the live preview, and "Record .webm" captures exactly one loop to a video file that repeats with no visible seam. Opening a shared link or share code with an animated layer starts playback automatically, so it works as a genuinely live background — including embedded in an iframe or a Rainmeter WebView — not just a static render.

## v0.0.16 — 2026-09-05

- Perlin noise layers now reuse their pixel buffer and gradient lookup table across renders instead of reallocating them every frame, cutting garbage-collection pauses while a slider is dragged or a numeric field is typed into.
- Typing a custom canvas width/height no longer resizes and re-renders on every keystroke — it settles briefly after you stop typing, while the resolution readout still updates instantly. Exporting immediately after typing a new size always uses the size you just typed, never a stale one.
- Editing one layer's controls while some other structural change happens elsewhere in the stack (adding/deleting a layer, toggling a mask, etc.) no longer kicks your cursor out of the field you were typing in — focus and text selection now survive the sidebar's redraw.

## v0.0.15 — 2026-09-05

- Performance Mode is now on by default (it can still be turned off from the Settings menu).
- The sidebar's scrollbar is now themed to match the current Light/Dark theme instead of using the browser's plain default look.
- Added CSS Filters: every layer now has its own Filters section with Blur, Brightness, Contrast, Grayscale, Hue Rotate, Invert, Filter Opacity, Saturate, Sepia, and a Drop Shadow (offset, blur, color) — plus a Custom SVG Filter box for pasting your own SVG `<filter>` markup, applied via `url(#id)`. Filters apply to groups and masked layers as a single flattened effect, and round-trip through Save/Load, Copy Code/Copy Link, and Undo/Redo. Note: since this page is often opened straight from a local file, a filter can't be loaded from a genuinely external SVG file — the SVG `<filter>` markup itself is stored right in the design instead.

## v0.0.14 — 2026-09-05

- Added a full application menu bar (File, Edit, View, Settings, Help) at the top of the sidebar, replacing several standalone buttons and freeing up sidebar space.
- File menu: New Workspace, Save/Load a design as a local .json file, Import a Link or Code, Export PNG, Export CSS (bakes the design into a background-image data URI), Export as a Rainmeter .ini Image meter (paired with its PNG), Copy Share Link, Copy Code.
- Edit menu: Undo/Redo, Group Selected/Ungroup Selected, Select All/Deselect All, and Purge History (frees the memory held by old undo snapshots — useful with large embedded images).
- View menu: Toggle Kiosk Mode on demand (Esc exits it), a Fit to Screen / Actual Size canvas view toggle, and Palette Presets (Spectrum HUD, Industrial Automation, Neon) that constrain the colors Randomize picks.
- Settings menu: a Light Theme toggle, Performance Mode (pauses live rendering while a slider is being dragged, for smoother interaction with heavy Perlin noise layers), and an Auto-Save toggle that continuously backs up the current design to this browser so an accidental refresh doesn't lose it.
- Help menu: a Keyboard Shortcuts reference, and What's New (Changelog) moved here from the old floating version badge, which has been removed.

## v0.0.13 — 2026-09-05

- "Copy Link" no longer rewrites the page's own address bar with the share hash — copying a link or code just copies it, without changing the URL you're currently looking at.
- The copied link/code box now hides itself automatically as soon as you change anything else in the design, so it can't be mistaken for still matching the current state.
- The share link/code box now uses the same dark background, border, and font as the File name field, instead of its own separate monospace look.
- The File name field now shows "Background" as a dimmed placeholder until you actually type a name; typed text appears in the normal, lighter color.

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
