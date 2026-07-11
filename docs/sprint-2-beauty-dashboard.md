# Sprint 2 - Beauty Dashboard

## Goal

Sprint 2 prepares the main user-facing dashboard for `SkinCheck AI`. The screen should feel premium, soft, and photo-first while aggregating the user's most important daily beauty data into one view.

## Wireframe Descriptions

### Today Dashboard

- A soft editorial-style header with greeting, date, and one-line beauty status.
- A layered scroll view with generous spacing and rounded cards.
- Dashboard opens with summary first, then actionable cards.

### Expiring Products Section

- Compact card group near the top.
- Each item surfaces product name, brand, and urgency label.
- Empty state copy explains that expiring products will appear once products are added.

### Rarely Used Products Section

- Secondary priority card block.
- Focused on rediscovery and usage awareness rather than urgency.
- Encourages users to rotate products they already own.

### Favorite Products Carousel

- Horizontal card carousel with larger visuals and softer highlights.
- Prioritizes quick recognition over dense metadata.
- Empty state invites the user to mark favorites later.

### Today's Skincare Section

- Progress-led card with a single routine headline and completion ratio.
- Designed to read instantly while still feeling calm and premium.

### Latest Makeup Look Card

- Photo-first hero card with title and short note.
- Placeholder state still keeps the layout visually strong even without an image.

### Progress Reminder Card

- Reminder uses soft caution styling instead of harsh warning language.
- Supports upcoming photo checkpoints and habit nudges.

### Forum Highlights Card

- Editorial card with one featured discussion snippet.
- Positioned low in the dashboard because forum is not MVP-critical yet.

## Backend Contract

`GET /dashboard/summary`

Returns:

- `expiring_products`
- `rarely_used_products`
- `favorite_products`
- `today_routine`
- `latest_look`
- `progress_reminders`
- `forum_highlights`

Current sprint uses a future-ready response shape and safe placeholder data until later domain tables become active.
