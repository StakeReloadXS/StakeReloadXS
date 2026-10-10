# Pull Request and Branch Plan

**Status: plan.** Maps each roadmap issue to a branch, a pull request scope, and its gate. No branches or pull requests have been opened for these issues yet. Items marked BLOCKED get no branch until their gate clears.

**Version:** 0.1. **Last updated:** 10 October 2026.

## 1. Conventions

- **Branch name:** `issue/<number>-<short-slug>`, cut from the default branch `main`. Example: `issue/2-bootstrap` in `xs-serv` for `StakeReloadXS/xs-serv#2`.
- **One issue, one branch, one pull request.** Split an issue into more pull requests only when its acceptance criteria split cleanly.
- **Pull request title:** `[#<number>] <issue title>`, with the number as the issue's full path in the body, not the title.
- **Linking:** GitHub closes an issue automatically only when the pull request is in the same repo. For a cross-repo reference, write `Refs owner/repo#N` in the body, not `Closes`.
- **Footer:** every pull request body ends with the attribution footer used across this project.
- **Reviewer:** `UNKNOWN`. The owner decides who reviews.
- **Merge method:** `UNKNOWN`. Squash is recommended, so each issue lands as one commit. The owner confirms.
- **Required checks:** `UNKNOWN` per repo. The Claude Approvals check, where it runs, must pass before merge.
- **Designated working branch:** this session's instructions name `claude/wizardly-albattani-bxcegz`. That branch is used for documentation work. Issue work uses the `issue/` convention above. The owner confirms the rule before issue branches start.

## 2. Order of work

Work follows the dependency chain. A pull request can't merge until its dependencies have merged.

1. **Decisions first (no branches):** owner decisions register (StakeReloadXS#13), legal gate (StakeReloadXS#14). These produce documents, not code.
2. **Foundations:** the server bootstrap (xs-serv#2), the extension skeleton (xs-chrome#2), and the package identity record (xs-npm#2). Each depends on an owner decision (see section 3).
3. **Services and shells:** accounts (xs-serv#3), onboarding shells (xs-chrome#3, xs-npm#3 to #6), Telegram linkage (xs-serv#4, xs-chrome#4).
4. **Contracts and gates:** version endpoint (xs-serv#10), client compatibility (xs-chrome#8, xs-npm#8), and the compat.json scaffold (StakeReloadXS#18).
5. **Gated work last:** payments, promotions, entitlement, and publication, once legal and processor decisions clear.

## 3. Per-repo plan

### StakeReloadXS (umbrella)

| Issue | Branch | Pull request scope | Gate |
| --- | --- | --- | --- |
| #13 Owner decisions register | none | No pull request. The register is a tracking issue. | Owner |
| #14 Legal gate | none | No pull request. Counsel's output is recorded in the issue. | Counsel |
| #15 Reconcile README closure notice | `issue/15-readme-reconcile` | Edits the root README after the owner states which description is accurate. | BLOCKED: owner |
| #16 Marketing approval | `issue/16-marketing-approval` | Updates `docs/MARKETING.md` with approved copy only. | BLOCKED: owner, counsel |
| #17 Umbrella tracking | none | Tracking issue. | None |
| #18 compat.json tracking | `issue/18-compat-json` | Adds a `compat.json` scaffold with placeholder versions. | Owner decision on file location (VERSIONING.md item 7) |

### xs-serv (private)

| Issue | Branch | Pull request scope | Depends on | Gate |
| --- | --- | --- | --- | --- |
| #2 M0 bootstrap | `issue/2-bootstrap` | Runtime, lint, test harness, health endpoint, CI config. | Owner: runtime and hosting | BLOCKED: owner |
| #3 M1 accounts and web API | `issue/3-accounts` | Sign-up, login, logout, session expiry, account read. Tenant-scoped queries. | #2 | Owner: auth scheme |
| #4 M2 Telegram linkage | `issue/4-telegram` | One-time codes, link and unlink, opt-out, webhook signature check. | #3 | Owner: bot owner, rate limits |
| #5 M3 onboarding state machine | `issue/5-onboarding` | Transition table shared by web and Telegram. ENTITLED returns a gated response only. | #3, #4 | None for the gated stub |
| #6 M4 ledger and payments | `issue/6-ledger` | Append-only ledger, idempotent webhook, no card data stored. | #5 | BLOCKED: processor, legal |
| #7 M5 promotions | `issue/7-promotions` | Design document and data model only. | #5 | BLOCKED: legal |
| #8 M6 tenancy | `issue/8-tenancy` | Tenant scoping and cross-tenant tests. | #3 | BLOCKED: isolation model |
| #9 M7 entitlement | `issue/9-entitlement` | Gated interface only. | #6, #7 | BLOCKED: legal, model |
| #10 versioning endpoint | `issue/10-version-endpoint` | `GET /v1/version` and release gates. | #2; path decision | Owner: path and auth |
| #11 M8 docs and release review | `issue/11-docs-release` | Operator and API docs match shipped behavior. | All above | None |

### xs-chrome (public)

| Issue | Branch | Pull request scope | Depends on | Gate |
| --- | --- | --- | --- | --- |
| #2 M0 baseline | `issue/2-baseline` | Manifest V3 skeleton, README stub, no network calls. | None | Owner: confirm no framework yet |
| #3 M1 onboarding shell | `issue/3-onboarding-shell` | First-run page, endpoint entry, health-only check. | #2; xs-serv#2 | None |
| #4 M2 linkage UI | `issue/4-linkage-ui` | Link codes that expire and can be regenerated. No Telegram token stored. | #3; xs-serv#4 | None |
| #5 M3 gate shell | `issue/5-gate-shell` | Gate states from server names. Opens the server invoice URL. No card fields. | #4; xs-serv#5 | Trial and coupon logic BLOCKED: legal |
| #6 M4 legal checkpoint | none | No pull request. Counsel's sign-off is recorded in the issue. | Counsel | BLOCKED: counsel |
| #7 M5 Chrome Web Store publication | `issue/7-store-publish` | Packaging and submission. | #6, #8, #9 | BLOCKED: legal, store review |
| #8 version compatibility | `issue/8-version-check` | Sends client version. Shows "update required" below the minimum. | xs-serv#10 | None |
| #9 publishing channel | `issue/9-listing` | Store listing and privacy text matching the live storefront. | Owner, counsel | BLOCKED: owner, counsel |

### xs-npm (public)

| Issue | Branch | Pull request scope | Depends on | Gate |
| --- | --- | --- | --- | --- |
| #2 package identity | none (decision recorded in PRODUCTS.md) | No code. | None | BLOCKED: owner |
| #3 package skeleton | `issue/3-skeleton` | `package.json` with `files` allowlist, version `0.0.0`, private. | #2 | Owner: engines range |
| #4 CLI shell | `issue/4-cli-shell` | `help` and `version`, offline, documented exit codes. | #3 | None |
| #5 mode and config | `issue/5-config` | Endpoint and mode from config or env. Adds `.env.example`. | #4 | Owner: default mode |
| #6 onboarding gate shell | `issue/6-gate-shell` | Gate states shown as UNKNOWN. No entitlement decision. | #5 | Trial steps BLOCKED: legal |
| #7 balance and invoice | `issue/7-invoice` | Opens the server invoice link. No card data. | #5; xs-serv#6 | BLOCKED: processor, legal |
| #8 version compatibility | `issue/8-version-check` | Reports version, checks min client version on `status`. | #4; xs-serv#10 | None |
| #9 npm publication | `issue/9-publish` | Dist-tags, provenance, 2FA, pack check in CI. | #3 to #8 | BLOCKED: legal, CI system |
| #10 docs alignment | `issue/10-docs` | README, CLI.md, SDK.md match shipped behavior. | #4 to #8 | Owner: "Cloud hosted" wording |

### xs-web (live storefront)

Pushes to `main` deploy to production. Every branch here is reviewed before merge, and a bad merge reaches production straight away.

| Issue | Branch | Pull request scope | Gate |
| --- | --- | --- | --- |
| #34 test gate before deploy | `issue/34-test-gate` | Adds `npm test` to the deploy workflow. | BLOCKED: owner approval. Open only after approval. |
| #35 catalog change control | `issue/35-catalog-review` | Review rule for `data/products.json` changes. | BLOCKED: owner decision |
| #36 policy version check | `issue/36-policy-check` | Adds a check that `POLICIES.md` matches the live pages. Test code only. | None. Owner review of marked items stays BLOCKED. |
| #37 bindings docs | `issue/37-bindings-docs` | Runbook entries for D1 and Telegram bindings. No secret values. | None |
| #38 sales-model legal review | none | No pull request. | BLOCKED: counsel |
| #39 rollback drill | `issue/39-rollback-drill` | Runbook result after the drill. | Owner dashboard access |
| #40 order API contract | `issue/40-order-contract` | Contract tests for `POST /api/order`. No behavior change. | StakeReloadXS#18 |
| #41 orders on Pages or xs-serv | none until decided | Decision record only. | BLOCKED: owner |

## 4. Before the first pull request

1. Owner confirms the branch convention in section 1 and the merge method.
2. Owner confirms branch protection on each default branch, including required reviews and checks. `UNKNOWN` today.
3. Owner confirms reviewers.
4. Confirm each `Refs` link resolves to a real issue. Placeholder references must be replaced first.

## 5. Open decisions

1. Merge method per repo (squash, merge, or rebase).
2. Branch protection and required checks per repo.
3. Who reviews, and whether CODEOWNERS applies.
4. Whether the designated working branch is kept for documentation work.
5. Whether xs-web pull requests can merge without a passing test gate, until #34 lands.
