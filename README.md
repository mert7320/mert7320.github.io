# MERT // ARCHITECTURAL ARCHIVE

A single-page static site for Mert — photographer & PhD researcher in tourism — to exhibit architectural photography and distribute wallpaper packs. Built to run on GitHub Pages with zero build step.

**Live site:** `https://<your-username>.github.io`

---

## What's in this repo

| File / folder | Purpose |
| --- | --- |
| `index.html` | The whole site (gallery, archive table, about, footer). No other pages needed. |
| `favicon.svg` | The site icon shown in the browser tab. |
| `packs.json` | The list of wallpaper packs shown in the archive table. **This is the file you edit to add packs.** |
| `packs/` | Where the `.zip` files live. Create it when you upload your first pack. |
| `upload.html` | A helper tool (open it in a browser) that builds `packs.json` and a `.zip` for you. |
| `README.md` | This file. |

---

## How to launch it (one time)

1. Make sure this repo is named exactly `<your-username>.github.io` (for example `mert7320.github.io`).
2. On GitHub, open the repo → **Settings** → **Pages**.
3. Under **Build and deployment**, set **Source** to `Deploy from a branch`, branch `main`, folder `/ (root)`, then **Save**.
4. Wait 1–2 minutes and visit `https://<your-username>.github.io`.

If the repo is already named `*.github.io`, Pages usually turns on automatically — just push the files and check the URL.

> To preview locally (optional): run `python3 -m http.server` in this folder and open `http://localhost:8000`.

---

## How to add a photo pack (the easy way)

Use the **`upload.html`** tool. It runs entirely in your browser — no installs, nothing is uploaded anywhere until you choose to.

### Step-by-step

1. Double-click `upload.html` (it opens in your browser).
2. Drag a folder of photos into the drop zone (or click `[CHOOSE FOLDER]`).
3. Fill in **PACK_ID** (next unused number, e.g. `005`), **TITLE**, and **LOCATION**.
4. Click `[BUILD packs.json]`.
5. Click `[DOWNLOAD .ZIP]` and `[DOWNLOAD packs.json]` to save both files to your Mac.
6. Go to your repo on GitHub → **Add file** → **Upload files**.
7. Drag the `.zip` into the `packs/` folder. If `packs/` doesn't exist yet, type `packs/` in the filename box to create it.
8. Upload `packs.json` to the root (this replaces the old one).
9. Scroll down, type a message (e.g. `add pack 005`), and click **Commit changes**.
10. Wait a minute — the new row appears on the live site with a working `[DOWNLOAD .ZIP]` button.

### Updating the list (multiple packs)

If you're adding a second pack and want to keep the first one, paste your **current** `packs.json` contents into the "CURRENT packs.json" box inside `upload.html` before clicking `[BUILD packs.json]`. The tool merges the new pack on top of it.

---

## `packs.json` format

```json
{
  "packs": [
    {
      "id": "005",
      "title": "BRUTAL CYPRUS",
      "location": "Nicosia & Limassol",
      "size": "340MB",
      "files": 18,
      "zip": "packs/005.zip"
    }
  ]
}
```

- `id` — a short identifier shown in the `PACK_ID` column.
- `title` / `location` — shown in the `LOCATION / THEME` column.
- `size` — display text for the `SIZE` column (the uploader calculates it for you).
- `files` — number of photos, shown in the `FILES` column.
- `zip` — path to the pack's zip inside the repo. Leave it as `""` and the row shows `[PENDING]` until the file exists.

> The table is generated from this file by `index.html`. You never need to touch the HTML to add a pack.

---

## Editing the gallery / text

Everything visual lives in `index.html` (plain HTML + CSS, no framework). The gallery cards are hand-written at the top of the file; the archive table is generated from `packs.json`. Edit and commit as usual.
