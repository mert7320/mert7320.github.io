# MERT // ARCHITECTURAL ARCHIVE

A single-page static site for Mert — photographer & PhD researcher in tourism — to exhibit architectural photography and distribute wallpaper packs. Runs on GitHub Pages with no build step.

**Live site:** `https://<your-username>.github.io`

---

## What's in this repo

| File / folder | Purpose |
| --- | --- |
| `index.html` | The whole site (gallery, archive table, about, footer). |
| `favicon.svg` | The site icon shown in the browser tab. |
| `packs/packs.json` | The list of wallpaper packs. **This drives the whole site.** |
| `packs/001.zip`, `packs/001/` | A pack's download zip and its photos. One subfolder per pack. |
| `upload.html` | A helper tool (open it in a browser) that builds everything you need for a pack. |
| `preview.command` | Double-click to preview the site locally (Mac). |
| `README.md` | This file. |

---

## How it works

Everything lives inside the `packs/` folder. The gallery (top photos) and the archive table (downloads) are both generated from `packs/packs.json`. Each pack entry lists:

- `id`, `title`, `location` — shown in the table.
- `size` — display text for the SIZE column.
- `files` — number of photos in the pack.
- `zip` — path to the pack's `.zip` (used by the `[DOWNLOAD .ZIP]` button).
- `photos` — the individual photo files, shown in the gallery.

You never edit the HTML to add a pack — only the `packs/` folder (and the uploader builds it for you).

---

## How to launch it (one time)

1. Make sure this repo is named exactly `<your-username>.github.io` (for example `mert7320.github.io`).
2. On GitHub, open the repo → **Settings** → **Pages**.
3. Under **Build and deployment**, set **Source** to `Deploy from a branch`, branch `main`, folder `/ (root)`, then **Save**.
4. Wait 1–2 minutes and visit `https://<your-username>.github.io`.

If the repo is already named `*.github.io`, Pages usually turns on automatically — just push the files and check the URL.

> **To preview locally:** double-click `preview.command` — it opens the site at `http://localhost:8000`.
> Note: opening `index.html` directly (double-clicking the file) won't show your packs, because browsers block the site from reading `packs/packs.json` over `file://`. Always use the preview script or the live GitHub Pages URL.

---

## How to add a photo pack

Use the **`upload.html`** tool. It runs entirely in your browser — no installs, nothing leaves your computer.

### Step-by-step

1. Double-click `upload.html` (it opens in your browser).
2. Drag a folder of photos into the drop zone (or click `[CHOOSE FOLDER]`).
3. Fill in **PACK_ID** (next unused number, e.g. `002`), **TITLE**, and **LOCATION**.
4. Click `[DOWNLOAD UPLOAD PACKAGE]`. It saves a file called `packs.zip`.
5. Double-click `packs.zip` to extract it — your Mac creates a folder named `packs`.
6. On GitHub, open the repo → **Add file** → **Upload files**.
7. Drag the whole `packs` folder into the upload box (not just its contents). GitHub keeps the folders inside it.
8. Scroll down, type a message (e.g. `add pack 002`), and click **Commit changes**.
9. Wait a minute — your photos appear in the gallery and the pack appears in the archive with a working `[DOWNLOAD .ZIP]` button.

### Adding a second pack

Paste your **current** `packs/packs.json` contents into the "CURRENT packs.json" box in `upload.html` before clicking download. The tool merges the new pack on top of it, so existing packs are kept.

### Starting over

If the current `packs/packs.json` is empty (default), your first upload **replaces** the demo gallery photos with your own.

---

## File size limits (important)

GitHub's website accepts files up to **25 MB each**, and up to **100 files** per upload.

- Keep each photo under 25 MB (normally fine for JPGs).
- Keep each pack under 25 MB total so its `.zip` uploads through the browser.

The uploader warns you if a file or pack exceeds these limits. If a pack is too big, split it into two packs.

---

## `packs/packs.json` format

```json
{
  "packs": [
    {
      "id": "001",
      "title": "BRUTAL CYPRUS",
      "location": "Nicosia & Limassol",
      "size": "24MB",
      "files": 18,
      "zip": "packs/001.zip",
      "photos": [
        "packs/001/001_01.jpg",
        "packs/001/001_02.jpg"
      ]
    }
  ]
}
```

---

## Editing the text / design

Everything visual lives in `index.html` (plain HTML + CSS, no framework). The gallery and archive table are generated from `packs/packs.json` by a small script at the bottom of `index.html`. Edit and commit as usual.
