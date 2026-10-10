# Versioning and Release Synchronization

**Status: plan.** No pipelines exist yet. This describes how every repo's releases stay compatible with the server runtime. Tool choices (CI system, registries, hosting) are `UNKNOWN` unless marked.

## 1. Goal

A client built today must either work with the server it talks to, or fail with a clear "update required" message. It must never fail silently. The same rule applies to self-hosted operators, cloud tenants, and on-demand instances.

## 2. Components and what they version

| Component | Repo | Distributed as | Version source |
| --- | --- | --- | --- |
| Server runtime | `xs-serv` (private) | Container image or service release, `UNKNOWN` | Git tag |
| Client SDK and CLI | `xs-npm` | npm package | `package.json` `version` |
| Browser client | `xs-chrome` | Chrome Web Store, or unpacked during development | `manifest.json` `version` |
| Desktop app | `xs-electron` (planned) | Installers, `UNKNOWN` | Not yet defined |
| Umbrella docs | `StakeReloadXS` | Documentation only | None; not released as a package |

## 3. Version scheme

- **Semantic versioning** for every component, proposed and not yet confirmed.
- **API version** is separate from package version: `/v1` on the server. A breaking API change means a new `/vN` path, not a package major bump alone.
- **Compatibility is declared by the server, not guessed by the client.** The server reports its own version, its supported API versions, and the minimum client version it accepts.

## 4. Compatibility contract

The server exposes one endpoint that every client calls at startup, for example `GET /v1/version` (`UNKNOWN` path). It returns:

- `server_version`: semver of the running server.
- `api_versions`: supported API versions, such as `["v1"]`.
- `min_client_version` per client type (`npm`, `chrome`, `electron`).
- `deprecations`: a list of features with a sunset date.

Clients compare their own version against `min_client_version` and show one of three states:

| Result | Client behavior |
| --- | --- |
| Compatible | Proceed |
| Compatible, deprecation notice | Proceed and show the notice |
| Below minimum | Block licensed actions and show "update required" with the update path |

Blocking happens on the client UI and on the server. The server rejects requests from below-minimum clients, so a modified client can't bypass the check.

## 5. Compatibility matrix

A single file in the umbrella repo, `compat.json` (`UNKNOWN` location until the first release), records which client versions work with which server versions. Each release pipeline updates it. The matrix is the source of truth for `min_client_version`.

Example shape (illustrative, not real values):

```json
{
  "server": "0.0.0",
  "clients": { "npm": ">=0.0.0", "chrome": ">=0.0.0" }
}
```

## 6. Pipelines

Each pipeline has the same stages: build, contract test, gate, publish. The gate is different for each.

### 6.1 xs-serv (server)

1. **Build.** Produce an immutable artifact, tagged with its semver.
2. **Contract test.** Run the API contract tests, including the `/v1/version` response shape and the auth rules. A breaking change fails here unless it bumps the API version.
3. **Cross-client test.** Run the current and previous client versions against the new build.
4. **Gate.** For licensed paths, the release is blocked until counsel clears the change (see [PRODUCTS.md section 4](PRODUCTS.md)).
5. **Deploy.** Cloud first, behind a canary. On-demand instances are rebuilt from the tagged artifact, so no instance runs untagged code.
6. **Publish compatibility.** Update `compat.json`.

Self-hosted operators get the same artifact through a documented release channel. They pin a version and upgrade on their own schedule. Rollback is available for one previous minor version (`UNKNOWN`, to be confirmed).

### 6.2 xs-npm (client SDK and CLI)

1. **Build and lint.**
2. **Contract test** against a pinned server version, plus the minimum version in `compat.json`.
3. **Pack check.** `npm pack --dry-run` must list only allowlisted files, with no `.env*`, keys, or fixtures.
4. **Gate.** npm publication is blocked until counsel clears licensing.
5. **Publish** with npm dist-tags:
   - `latest`: current stable.
   - `next`: pre-release for testing.
   - Deprecated versions get a deprecation message, not an unpublish.

The CLI prints its version and checks compatibility on `status`.

### 6.3 xs-chrome (browser client)

1. **Build** the extension bundle.
2. **Contract test** against the same server versions as npm.
3. **Package** for the Chrome Web Store.
4. **Gate.** Store submission is blocked until counsel clears listing and licensing (see `docs/STORE-LISTING.md` in xs-chrome).
5. **Publish.** Store review time is outside our control. So the server must keep supporting the previous client version until the new one is live for most users.

The extension's version is checked at startup like any other client.

### 6.4 xs-electron (planned)

Same stages as the browser client. Auto-update channels are `UNKNOWN`. A desktop app can't be forced to update instantly, so it follows the same rule as the extension.

### 6.5 Umbrella repo (StakeReloadXS)

- Docs only. A CI check verifies that `compat.json` matches the released versions in each repo.
- Release notes are collected here from each repo's changelog.

## 7. Branching and tags

- Protected default branch in each repo.
- Work on feature branches, merged by pull request.
- Release by annotated tag on the default branch: `vMAJOR.MINOR.PATCH`.
- Hotfixes branch from the latest tag, then merge back.
- Branch protection, required reviews, and signed tags are `UNKNOWN` until the owner confirms the policy.

## 8. Deprecation policy (proposed)

- A deprecated API or client version keeps working for a notice period, `UNKNOWN` length.
- During the notice period, the server returns a `deprecations` entry.
- Removal happens only in a major version or a new API version.

## 9. Rollback

| Layer | Rollback |
| --- | --- |
| Server, cloud | Redeploy the previous tagged artifact |
| Server, on-demand | Rebuild instances from the previous tag |
| Server, self-hosted | Operator reinstalls the pinned previous version |
| npm | Republish a patch, or deprecate the bad version. Never unpublish. |
| Chrome Web Store | Submit a patch. Store rollback options are `UNKNOWN`. |

## 10. Open decisions

1. CI system and where artifacts are hosted.
2. Server release channel for self-hosted operators.
3. Exact `/v1/version` path and auth.
4. Canary size and rollout rules for cloud.
5. Rollback window for self-hosted.
6. Notice period for deprecations.
7. Whether `compat.json` lives here or in xs-serv.
8. Package and tag signing.
9. Supported Node and browser versions.

## 11. Not started

No pipeline, tag, or `compat.json` has been created. Each item depends on the decisions above and on the legal gate for licensed paths.
