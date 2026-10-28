# Model content and footer update

All changes remain on `feature/creative-snapshot`, in draft PR #3. No production deployment.

## Routes

- `/the-copenhagen-method/`: Paivio's existing six-step operating rhythm, with an overview of the three detailed frameworks.
- `/frameworks/power-response-model/`: the five-part model and its Attract, Stimulate, Share, Respond content sequence.
- `/frameworks/precision-creative-engine/`: the emotional/rational tracks, five-step testing loop, four content categories and storytelling structure.
- `/frameworks/precision-conversion-engine/`: six phases, Traffic Conversion Rate and Funnel Conversion Rate, value-based prioritisation and an appropriate testing process.

The common footer links to all four pages, Creative Snapshot and Budget Control. It is shared across the homepage, snapshot, case, Budget Control, privacy and model pages. Primary navigation is unchanged.

## Source treatment

The named source files were read from the user's supplied documents. The source files are not uploaded as downloads: their content is adapted into crawlable English HTML, retaining the current website's design.

- Precision Conversion Engine.pdf, pages 1–9, and Precision Conversion Engine.pptx, slides 1–12: conversion goals, KPI definitions, hybrid measurement, audit classes, impact-versus-complexity prioritisation and operating cadence.
- Precision_Creative_Engine_Paivio.pptx, slides 1–12, and The Precision Creative Engine: Paivio’s Iterative Performance Content Strategy.pdf, pages 1–9: creative tracks, categories, testing, storytelling and knowledge sharing.
- The Power Response Model 2027.pptx, slides 1–12: five model elements, four content responses, channel roles and the 2014/2027 history.
- Existing homepage: The Copenhagen Method's Understand, Prioritise, Experiment, Measure, Learn, Scale sequence.

The documents contain illustrative dashboard metrics, placeholder prices, private file references and different Trendsales baselines. These are not published as new performance evidence. The creative PDF's B2B framing is adapted to the owner's current eCommerce positioning. Conversion uplift calculations are labelled as planning estimates, and fixed testing thresholds are not presented as universal statistical rules.

## Search implementation

Static HTML, plain definitions, visible author and modification date, semantic sections, native HTML process diagrams, FAQs, related-page links and footer discovery. Each new model page has a unique title/description, canonical URL, Open Graph metadata, Article and BreadcrumbList JSON-LD, and a sitemap entry. No hidden keyword text, fabricated citations, special AI-ranking claims or new analytics scripts.

Google's guidance: https://developers.google.com/search/docs/appearance/ai-features
These practices support crawlability and understanding. Indexing, rankings and AI citations are not guaranteed. Search Console validation follows production publication.

## Email status

The owner approved FormSubmit during this conversation. Config now targets `https://formsubmit.co/paivio.media@pm.me`, with native secure form POST, the provider's default CAPTCHA enabled, `_honey`, a branded subject, lead source and a return page at `/creative-snapshot/thank-you/`.

A setup request was sent to the authorised recipient only. HTTP 200 returned `success:false` and explicitly stated that an activation email with an Activate Form link was sent. This is **not evidence of delivered leads**. The owner subsequently confirmed activation. A second setup test returned HTTP 200, success:true and The form was submitted successfully. Provider acceptance is verified; inbox receipt still needs owner confirmation.

Static config is `email-pending`, so public submissions are disabled. Local preview continues to use local-only storage. Once activation and recipient receipt are confirmed, switch mode to `email`. No Google Sheets integration is added. The earlier Worker/D1/Turnstile code is an unused alternative and is not deployed.

The privacy page is updated as a preview notice identifying the proposed processing and FormSubmit's documented 30-day archive. Before public activation, confirm the processing basis, processor/transfer arrangements and Paivio's operational retention period; do not represent the preview text as a completed legal review.

FormSubmit documentation: https://formsubmit.co/documentation
Privacy: https://formsubmit.co/privacy.pdf

## Validation

10 automated checks pass: existing form tests plus model metadata/schema, sitemap/footer coverage, local links/assets, fixed recipient and activation gate. Mobile widths checked for all four model pages: no horizontal overflow. Screenshots captured for the method page, Power Response mobile view and homepage footer. Existing production remains unchanged.
