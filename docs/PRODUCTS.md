# StakeReloadXS Products and Deployment Modes

**Status: design draft.** The product repositories currently contain scaffolding only (a README, a `.gitignore`, and one initial commit each). Nothing here describes behavior that has shipped. Anything not yet established is marked `UNKNOWN` and needs an owner decision before it is treated as fact.

## 1. Product map

| Component | Repository | Visibility | Role | Status |
| --- | --- | --- | --- | --- |
| xs-chrome | `StakeReloadXS/xs-chrome` | Public | Chrome extension. Its README describes it as self-hosted. | Scaffold |
| xs-serv | `StakeReloadXS/xs-serv` | Private | Server runtime that extensions and other clients connect to | Scaffold |
| xs-npm | `StakeReloadXS/xs-npm` | `UNKNOWN` | npm package. Its README describes it as "Cloud hosted NPM package." | Scaffold (README and `.gitignore` only; no `package.json`) |
| xs-electron | Not created | n/a | Planned desktop application | Planned |

New components should be added to this table with their repository, visibility, and status.

## 2. Deployment modes

Every component should run in the same three modes. The server image or package is the same in each mode. What changes is who operates it and where entitlement checks happen.

### 2.1 Self-hosted

The user runs `xs-serv` on infrastructure they control, and points `xs-chrome` (or another client) at that endpoint.

- **Operator:** the user.
- **Data location:** the user's infrastructure.
- **Updates and secrets:** handled by the user.
- **Entitlement check:** `UNKNOWN`. See section 4.

### 2.2 Cloud-hosted

The operator runs `xs-serv` in the cloud and serves multiple users from it. Clients are configured with the operator's endpoint.

- **Operator:** StakeReloadXS.
- **Data location:** operator-controlled cloud. Tenant isolation model is `UNKNOWN`.
- **Updates and uptime:** handled by the operator.
- **Entitlement check:** on the server, against the user's license.

### 2.3 On-demand virtual hosted

An instance of `xs-serv` is provisioned for a user or session when it is needed, and torn down when it is idle. Clients use it the same way as cloud-hosted.

- **Operator:** StakeReloadXS.
- **Provisioning trigger, idle timeout, and teardown behavior:** `UNKNOWN`.
- **Data retention on teardown:** `UNKNOWN`. Needs a decision before launch.
- **Entitlement check:** on the server, at provisioning time and on each session.

### 2.4 Comparison

| | Self-hosted | Cloud-hosted | On-demand virtual hosted |
| --- | --- | --- | --- |
| Who runs the server | User | Operator | Operator, per session |
| Who holds the data | User | Operator | Operator, until teardown |
| Who applies updates | User | Operator | Operator |
| Where the license is checked | `UNKNOWN` | Server | Server, at provisioning and per session |
| Typical user | Technical user with own infrastructure | Most users | Users who need occasional or burst capacity |

## 3. Licensed publication channels

A publication channel is a route by which a built component reaches users. Each channel should only deliver a component to a user who holds a valid license for it.

| Channel | Component | Status |
| --- | --- | --- |
| Chrome Web Store | xs-chrome | `UNKNOWN`. Store eligibility and listing rules not reviewed. |
| npm registry | xs-npm | `UNKNOWN`. No `package.json` yet, so package name, scope, and access model are undefined. |
| Desktop installers | xs-electron | Planned |

A license gate on each channel is the goal. How it is enforced is open. See section 4.

## 4. Open decisions and gates

These need an owner decision or a legal sign-off. None of them has been implemented.

1. **Legal review gate.** Entitlement and licensing logic must not be built until counsel has cleared it. Until then, the entitlement layer is design-only.
2. **Entitlement model.** `UNKNOWN`: how licenses are issued, stored, validated, and revoked.
3. **Self-hosted license enforcement.** `UNKNOWN`: whether self-hosted installs call home, and how an offline install is handled.
4. **Tenant isolation.** `UNKNOWN`: how cloud-hosted and on-demand instances keep one user's data away from another's.
5. **On-demand lifecycle.** `UNKNOWN`: provisioning trigger, idle timeout, and what is kept or deleted at teardown.
6. **xs-npm package definition.** `UNKNOWN`: the repo has no `package.json`, so its package name, scope, and publish settings are undefined. Its README calls it "Cloud hosted," which needs to be reconciled with the deployment modes in section 2.
7. **xs-electron scope.** Planned only. Not yet defined.

## 5. Security notes

- `xs-serv` stays private. Do not make it public without a deliberate decision.
- Do not commit secrets, `.env` files, or tokens. `xs-chrome`, `xs-serv`, and `xs-npm` ignore `.env` and `.env.*`, which would also ignore `.env.example`. Add a `!.env.example` exception before committing one. `StakeReloadXS` ignores only `.env` and `.env.test`. When configuration is added, provide a `.env.example` with empty placeholders only.
- Client-side code (`xs-chrome`, and later `xs-electron`) must not contain server credentials or license secrets. Anything shipped to a user should be treated as readable by that user.

## 6. Setup

Setup instructions are not written yet. They will be added once `xs-serv` and `xs-chrome` contain runnable code. Until then, this document does not describe commands or endpoints, because none exist.

## 7. Source and scope

This draft was written from the repository contents at commit `b7ba9b0` on `main` (the same commit the working branch was on). `xs-npm` was reviewed at commit `c501b14`. No product source code was reviewed, because none exists in any of the repos yet.
