# StakeReloadXS SDK Overview

**Status: design-only.** No SDK code is published. This page lists the surfaces that are planned, what each one will and will not do, and what is still undecided.

## Surfaces

| Surface | Repo | What developers get | Status |
| --- | --- | --- | --- |
| npm package and CLI | [xs-npm](https://github.com/StakeReloadXS/xs-npm) | Onboarding, status, and top-up from the command line or code | Design-only |
| Server API | [xs-serv](https://github.com/StakeReloadXS/xs-serv) (private) | Accounts, balance, invoices, notifications | Design-only, provisional |
| Chrome extension | [xs-chrome](https://github.com/StakeReloadXS/xs-chrome) | Browser client that connects to an endpoint | Design-only |
| Desktop app | `xs-electron` (not created) | Planned | Planned |
| Storefront | [xs-web](https://github.com/StakeReloadXS/xs-web) (public) | Public order endpoint `POST /api/order`, validated against the live catalog. Not an SDK surface, but external clients may depend on it. | Live |

## Principles that apply to every surface

- Card data is never handled by StakeReloadXS code. Payments go through a PCI-compliant hosted page (processor `UNKNOWN`).
- License decisions are made on the server. Clients render the result.
- Secrets never ship in a client, package, or repo. Anything in a published package is readable by its users.

## What is gated

Trial, referral, coupon, license validation, and revocation are blocked until counsel clears them. Their APIs are listed as gated and are not implemented.

## Integration order (planned)

1. Stand up an endpoint: self-hosted or cloud (see [PRODUCTS.md](PRODUCTS.md)).
2. Connect a client: the Chrome extension or the npm CLI.
3. Link web and Telegram accounts.
4. Top up through a hosted invoice.

## Undecided

- Package name, scope, and versioning policy.
- Authentication scheme and error format.
- Compatibility and deprecation policy.
- Supported runtimes.

Each item is tracked as `UNKNOWN` until the owner decides.
