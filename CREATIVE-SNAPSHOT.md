# Creative Snapshot

Branch: `feature/creative-snapshot`. Preview only. No production deployment.

## Implemented

- Dedicated `/creative-snapshot/` page in Paivio's existing navy, cream and gold palette and Manrope typography.
- Existing header/footer markup reused. No Creative Snapshot entry added to primary navigation. Header CTA and page CTAs lead to the request form.
- Exactly one contextual text link below the homepage Creative Strategy & Testing service. No other homepage redesign.
- Free personal video review of approximately 10 minutes, with three actionable recommendations. Every delivery reference says **Delivered within 5–10 business days**.
- Responsive form, required labels, inline errors, keyboard focus, live status, pending state and a clear success/error state.
- Optional spend qualification. No rigid minimum, artificial scarcity, private-performance claims or mandatory sales call.
- No standalone runtime or new libraries. The referenced ZIP/Main.dc.html was not attached; only the text brief was available. Existing campaign imagery is labelled as prior in-house work, not a prospective client's completed review.

## Local preview

Requires Node.js 22+ and no dependencies.

```
node scripts/preview.mjs
```

Open `http://127.0.0.1:4174/creative-snapshot/`.
Use fictitious test details only. Local submissions go to `.preview-data/submissions.jsonl`, which is gitignored and cannot be fetched over HTTP. They are **not** sent by email or to Google Sheets. The success message explicitly identifies a local test.

```
node --test tests/creative-snapshot.test.mjs
```

Six automated tests cover server validation, optional fields, honeypot rejection, content type, payload size, origin protection, rate limiting, storage failure, local persistence, file access restrictions, production fail-closed behaviour, the production storage contract with mocked Cloudflare services, metadata and the homepage/navigation constraints. API tests invoke the actual HTTP request listener in process, avoiding environment-specific loopback restrictions. Browser QA separately tests an actual local HTTP submission.

## Production blocker and proposed integration

GitHub Pages hosts the current website and cannot execute a POST handler. The existing privacy notice only describes email enquiries; it does not yet cover a lead form. Production requests are therefore disabled in `creative-snapshot/config.json`. The page does not pretend a submission was delivered.

A proposed Cloudflare Worker + D1 + Turnstile backend is prepared in `backend/creative-snapshot/`. No Cloudflare resources, paid services or third-party form accounts have been created. This is an implementation proposal awaiting the owner's approval, not a deployed integration.

Before enabling public submissions:

1. Confirm Cloudflare Worker/D1/Turnstile as the approved processors and agree where leads will be reviewed. Alternatively select an existing approved backend and implement the same endpoint contract.
2. Create a private D1 database and apply `schema.sql`. Bind it as `DB` to the Worker. Do not commit database contents or credentials.
3. Configure `ALLOWED_ORIGIN=https://paiviomedia.com`, `ENABLE_SUBMISSIONS=false` initially, and Worker secrets `TURNSTILE_SECRET` and a random `RATE_LIMIT_SALT`. Register the Turnstile widget for paiviomedia.com. Only the public site key belongs in browser config.
4. Deploy a dedicated HTTPS Worker endpoint with restricted dashboard/database access. Its CORS allowlist must include only the approved website origin. Change the form `action` to the endpoint as well as config if using a cross-origin URL.
5. Expand `/privacy/` with the actual purpose, required/optional fields, lawful basis, processors and any transfers, retention period, request/deletion rights and contact route. The founder must confirm the operational retention/deletion process. Update `privacyVersion` in validation.mjs after that notice is approved. Do not enable form processing on the strength of the existing notice.
6. Configure a real inbox notification or a private CRM sync. D1 rows are CRM-ready, but email delivery and Google Sheets integration are **not implemented or tested**. An authenticated server-side sync must manage Google credentials privately and handle retries/deduplication. Never use a publicly writable Sheet URL.
7. Test the deployed endpoint with a genuine Turnstile token: validation errors, bad/missing token, wrong origin, valid storage, rate limiting, network/storage failures and actual CRM/inbox receipt. Mock tests do not establish real delivery.
8. After design approval, processing approval, privacy completion and end-to-end delivery verification, set config to `{"mode":"live","endpoint":"APPROVED_HTTPS_ENDPOINT","siteKey":"PUBLIC_SITE_KEY"}`, set `ENABLE_SUBMISSIONS=true`, and deploy the approved PR. Do not merge while blockers remain.

## Data contract

Server-generated ID and timestamp; brand; website; contact name; email; monthly ad spend; main challenge; lead source `Creative Snapshot`; status `New`; follow-up date null; notes empty; privacy notice version. No automatic marketing subscription.

The Worker validates text/lengths/email/http(s) URL/spend options/acknowledgement, limits body size, rejects the honeypot, verifies Turnstile on the server, enforces an origin allowlist and rate limits using salted IP hashes. It uses parameterised database statements and returns success only after storage. It does not log request bodies or fetch submitted brand URLs.

## Validation record

- Automated tests: 6/6 passed.
- Browser: desktop and 390x844 mobile viewport; no horizontal overflow; working menu and form anchor; required-field errors focus the first invalid input; local HTTP submission confirmed and record saved.
- Real production email/CRM delivery and Turnstile: not tested, pending approved setup.
- Build: buildless static HTML/CSS/JS. JavaScript syntax validated; no package install or generated runtime.
