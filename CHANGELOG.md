# Changelog

All notable changes to this project are documented here.

> These version numbers were assigned retroactively by walking back through the project's build history and grouping changes into logical releases. Exact calendar dates for the earlier entries weren't tracked at the time, so only the most recent entries carry a date — the ordering itself (oldest at the bottom, newest at the top) is accurate.

## v0.0.37 — 2026-09-05

- The Layers panel is no longer pinned inside the sidebar — it's now its own small window that floats over the canvas and can be dragged anywhere by its titlebar (never outside the app's own window). Closing it (the × in its corner) only ever hides it; bring it back from View > Show Layers, which shows a checkmark whenever it's open. Its position and open/closed state are both remembered next time you open the app.
- The rest of the old sidebar (the Copy Link/Code output box, and the Import a Link or Code panel) is hidden for now while the Layers panel above finds its new home — nothing was removed, it's simply switched off for later.
- Moved the Layers section's "Top of the list = top of the stack..." tip out of the app itself and into Help > Hints & Tips (Layers section), alongside the rest of the reference material.

## v0.0.36 — 2026-09-05

- Save/Load now stores a design as the same compressed hash format Copy Code already used, instead of pretty-printed JSON — a multi-layer test design's saved .json file shrank by 77%. Loading still reads older, plain-JSON saves from before this change.
- Every control in the menu bar (the File/Edit/View/... text buttons, the Settings gear, and the Play/Record icons) now shares one exact height, fixing small inconsistencies that used to show up between text buttons, icon-only buttons, and the Play/Record pair.
- Removed the duplicate Undo/Redo buttons that used to sit at the top of the sidebar's Layers section — the Edit menu's Undo/Redo (and the Ctrl+Z/Ctrl+Shift+Z/Ctrl+Y shortcuts) already cover it.
- Added keyboard shortcuts for most of the menu bar, matching the closest industry-standard equivalent where one exists: Ctrl/Cmd+S (Save), Ctrl/Cmd+Shift+S (Save As), Ctrl/Cmd+O (Load), Ctrl/Cmd+Shift+E (Export PNG), Ctrl/Cmd+G / Ctrl/Cmd+Shift+G (Group/Ungroup Selected), Ctrl/Cmd+A / Ctrl/Cmd+Shift+A (Select All / Deselect All), Ctrl/Cmd+0 / Ctrl/Cmd+1 (Zoom to Fit / Actual Size), Ctrl/Cmd+= / Ctrl/Cmd+- (Zoom In/Out), Space (Play/Pause Animation), and ? (open this Keyboard Shortcuts list). None of these hijack a text field — Ctrl+A in the File Name box still selects its text instead of selecting every layer. (Ctrl+N, Ctrl+T/W, and Ctrl+D were left out on purpose — browsers reserve those for themselves and never let a page override them.)

## v0.0.35 — 2026-09-05

- The app's title moved from its own heading at the top of the sidebar into the menu bar itself, shortened to "Image Generator" in a quiet, low-contrast rounded label (hover it to see the full "Background Image Generator" name) — frees up sidebar space now that the menu bar is the app's actual header.
- Added File > Save As…, which asks for a new name and saves the design under it immediately, updating the Canvas menu's File Name field to match (so PNG/CSS/Rainmeter exports pick up the new name too).

## v0.0.34 — 2026-09-05

- The Record button's dot is now a plain CSS-drawn circle instead of a Unicode character — a filled-circle glyph's vertical centering varies too much between fonts/systems to ever pin down reliably with font-size/padding tweaks, so it's drawn directly instead, which lines it up cleanly with the Play button and the rest of the menu bar everywhere.

## v0.0.33 — 2026-09-05

- Fixed the Play and Record icon buttons (next to the Animation menu) rendering at visually mismatched sizes — they now share the same fixed 24×24 box, with the record dot scaled down slightly so the two read as a matched pair instead of one looking bigger than the other.

## v0.0.32 — 2026-09-05

- All of this page's CSS has moved out of an inline `<style>` block into its own `style.css` file, linked from main.html's `<head>`. main.html is noticeably slimmer now; `style.css` needs to stay in the same folder as main.html (and travel with it whenever it's copied or shared) for the app to look right.

## v0.0.31 — 2026-09-05

- Play/Pause and Record moved out of the Animation and File menus and into two small icon buttons (▶/⏸ and a plain dot) that sit right next to the Animation menu itself, one click away instead of two. Playback now starts paused by default in a normal editing session (a share link or embedded live background still starts playing immediately, since there's no menu bar to press Play from there). The Record button is a dim, muted dot normally and turns bright red with a soft glow the moment a recording is actually in progress.

## v0.0.30 — 2026-09-05

- The menu bar (File | Edit | View | ... | Help) is now a full-width header running across the very top of the whole app, above the sidebar, instead of sitting inside it — the sidebar and live preview both now start below it, and it stays compact so it doesn't eat into either one's space.
- Fixed the Settings gear icon sitting slightly out of vertical alignment with the File/Edit/View/... text buttons next to it — both now share the same vertical center.
- The sidebar's right edge can now be dragged to resize it narrower or wider; its width is remembered the next time you open the app.
- Reworked canvas scaling into a proper Zoom system in the View menu: Zoom to Fit (shrinks to fit the available space, the previous behavior and still the default), Zoom to Actual Size (exactly 100%), and Zoom In/Zoom Out, which step through preset percentages from whatever the preview is currently showing. The View menu always shows the current zoom level.
- Elements below the new header are laid out so the sidebar and live preview each scroll internally when their own content doesn't fit, instead of the whole page growing an outer scrollbar — and a genuine layout overflow is never silently hidden, so if one ever shows up it'll still be visible rather than clipped away.

## v0.0.29 — 2026-09-05

- Moved the Animation controls out of the sidebar and into a new Animation menu in the top menu bar (next to Canvas): Loop Length and Play/Pause now live there, inline, the same way the Canvas menu already holds its Width/Height fields. Record Animation (.webm) stays exactly where it already was, in the File menu — nothing duplicated. The sidebar now holds only the Layers section.

## v0.0.28 — 2026-09-05

- Custom animate can now drive every numeric property a layer has, not just opacity/scale/rotate/x/y — CSS Filters (blur, brightness, contrast, grayscale, hue rotate, invert, filter opacity, saturate, sepia, drop shadow x/y/blur), fill color (R/G/B/alpha), pattern and gradient geometry (angle, tile size, fill amount, radial center, gradient angle), Perlin/grain noise settings, and image overlay scale/offset — whichever apply to the layer's own type. Both keyframes and expressions accept these the same way as the original five (e.g. `50% { opacity: 60; blur: 12; }` or `blur: 10+5*sin(t*6.283);`), and animating them never touches the saved design, undo history, or exported JSON — only what's drawn for that frame. Unrecognized property names are ignored rather than breaking the animation (see Debug Log below).
- Added a Debug Log (Help menu): a small, always-on, purely-local tool built after running into an out-of-memory crash with no way to see what led up to it. It quietly keeps a capped log of warnings and errors (including any uncaught JavaScript error or unhandled promise rejection), plus a periodic snapshot of resource use — layer count, undo history depth, canvas size, auto-save size, and this browser's JS memory use where it's exposed. If the app doesn't shut down cleanly (a crash, an out-of-memory kill, a force-closed tab), the log from right before that is carried over and flagged at the top of the next session's Debug Log automatically. The log can be copied, downloaded as a .txt file, or cleared from its own window.
- Fixed a potential memory leak the Custom-animate work above could otherwise have introduced: animating a layer's own Custom SVG Filter alongside any other filter property now reuses the one injected `<filter>` element across every frame instead of injecting a brand-new one into the page each time.

## v0.0.27 — 2026-09-05

- The app's actual file is now main.html (renamed from index.html); index.html is now a tiny loader that immediately forwards here, appending a cache-busting value so a browser or host that aggressively caches "index.html" specifically can't hold back an update — every visit fetches a genuinely fresh copy of main.html. A share link, kiosk-mode link, or bookmark pointed at index.html still opens the exact same design as before; it's just forwarded along.
- The Hints & Tips guide (help.html) now matches this page's own Light/Dark theme choice live, instead of only guessing from your OS-level light/dark setting — it updates instantly if you switch themes while the guide is open.

## v0.0.26 — 2026-09-05

- The sidebar's themed scrollbar (thin, colored to match the current Light/Dark theme) now applies everywhere a scrollbar can show up, not just the sidebar itself — modal windows, text boxes, and any other scrolling area now match instead of falling back to the browser's plain default look.

## v0.0.25 — 2026-09-05

- Dropped the question mark from the "Use as Mask" label, matching the rest of the sidebar's controls.
- Added hover tooltips to nearly every control in the sidebar — sliders, dropdowns, checkboxes, and buttons — each with a short, plain-language explanation of what it does. Meant to make the interface learnable just by hovering around, no manual required.
- Added a Hints & Tips window (Help menu): a built-in guide covering Getting Started, Layers, Masks, Filters, Animation, Export & Share, Keyboard Shortcuts, and Tips & Tricks, loaded from a new companion file (help.html) that sits alongside this one.

## v0.0.24 — 2026-09-05

- Standardized capitalization across every label, button, menu item, and dropdown option in the sidebar to title case (each significant word capitalized — small joining words like "with," "as," and "to" stay lowercase), for a more consistent, polished look throughout.

## v0.0.23 — 2026-09-05

- Mask layers can now be Inverted: the "Use as mask?" checkbox now has a Standard / Inverted dropdown next to it. Standard is the existing behavior (keep only where the mask and the layer below overlap); Inverted does the opposite — it punches a hole through the layer below wherever the mask is opaque, and leaves everything else alone. The layer list's MASK badge reads INVERTED MASK when that mode is on, and older saved designs load in as Standard by default.

## v0.0.22 — 2026-09-05

- Added a Canvas menu (next to View) holding Resolution presets, the Width/Height fields for a custom size, and the File name field — all three moved out of the "Canvas & Export" box that used to sit at the top of the sidebar, which has been removed now that everything it held lives in this menu instead.

## v0.0.21 — 2026-09-05

- Fixed a slider's track becoming completely invisible when it sat inside a box sharing the same background color — most noticeably a gradient/pattern color stop's own position slider, which sits inside a shaded row that happened to be the exact same color as the slider's track. Every slider now has a thin, always-visible outline around its track regardless of what it's sitting on.
- Changed the slider drag knob from a round ball to a small vertical bar, and made its outline color follow the current Light/Dark theme instead of always being a fixed dark ring (which used to look like a mismatched dark smudge in Light Theme).

## v0.0.20 — 2026-09-05

- Moved Randomize off its own standalone button at the bottom of the sidebar and into Edit > Effects, as three separate options instead of one all-or-nothing reroll: Randomize: Palette (colors only — fills, gradient and noise stops, the noise monochrome toggle — leaving every layer's opacity, blend mode, angle, size, and position untouched), Randomize: Layers (the mirror image: opacity, blend mode, angles, sizes, positions, and noise shape settings reroll, colors stay put), and Randomize: All (everything at once, the same as the old button did).

## v0.0.19 — 2026-09-05

- Cycles has always needed to be a whole number — it's what guarantees a loop closes perfectly with no jump — but that wasn't explained anywhere, so it could look like a bug (or like decimals should work but didn't). The real, shared speed control is Loop length, and its range was too cramped to actually feel like one: raised its ceiling from 60 seconds to 10 minutes, and each layer's Animate section now shows a live "Repeats every Xs" readout under its Cycles slider that updates instantly as you change either Cycles or the shared Loop length, so the relationship between the two is obvious at a glance instead of something you have to do math for.
- Fixed the .webm recorder still occasionally producing a truncated, near-empty file in some browsers even after last version's fix. The previous fix waited a couple of frames for things to settle before starting capture, which helped but didn't fully close the gap; recording now drives the video track manually (requesting each frame right when it's rendered, instead of relying on the browser to notice the canvas changed on its own timer), which removes the race at its root rather than just narrowing the window for it.

## v0.0.18 — 2026-09-05

- Cycles now goes up to 200 (was 10), for fast flicker/glitch-style motion on short loops.
- Added a Motion style dropdown to the Animate section: besides Scroll/Pan, every layer (including whole groups — not just patterns and Perlin noise) can now Pulse (scale + opacity breathing), Spin (rotate a full turn per cycle), or Orbit (drift in a small circle), applied as a transform around the layer's normal output so it works uniformly for solids, gradients, images, and static grain too.
- Added a Custom motion style with two ways to hand-author motion: percent keyframes (`0% { opacity: 100; scale: 100; } 50% { opacity: 60; scale: 130; } 100% { opacity: 100; scale: 100; }`, matching CSS @keyframes) targeting opacity/scale/rotate/x/y, or — with no `%` stops — one `property: expression;` per line using `t` (0-1 progress through a cycle) and `cycles`, e.g. `rotate: t*360;`. As with every other motion style, the loop is only ever driven by an integer Cycles count, so a Custom animation still loops seamlessly as long as its own values agree at 0% and 100%.
- Fixed the .webm recorder occasionally capturing a truncated, near-empty file when Record was clicked immediately after a layer-list change (adding/toggling a layer, switching Motion style, etc.); it now waits two animation frames for that change to fully settle before it starts capturing, which is never noticeable but makes every recording reliable.

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
