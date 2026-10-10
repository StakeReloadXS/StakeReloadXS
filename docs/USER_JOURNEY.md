# StakeReloadXS User Journey

**Status: design draft.** This diagram describes the intended flow. No step is implemented yet. Steps marked **[LEGAL GATE]** may not be implemented until counsel clears the entitlement and licensing logic.

```mermaid
flowchart TD
    A([User finds the npm package]) --> B[Install package]
    B --> C[First run]
    C --> D{Subscription gate}

    D -->|Has an account or license| E[Sign in and resume]
    D -->|New user| F{Account exists?}

    F -->|No| G[Account creation onboarding]
    G --> H[Web account]
    H --> I[Telegram notifications]

    F -->|Yes| E
    E --> J[Validate existing status]

    J --> K{Licensed rights?}
    I --> K
    K -->|Yes| L{Balance}
    K -->|No| M{Eligible for trial or promo?}

    M -->|Unique account| N[Start trial] --> L
    M -->|Referral| O[Apply referral reward] --> L
    M -->|Coupon| P[Apply coupon] --> L
    M -->|Not eligible| Q[Subscribe or purchase] --> L

    L -->|Balance available| R[Use licensed features]
    L -->|Balance empty| S[Replenish: invoice for card payment]

    S --> T{Channel}
    T -->|Web| U[Pay on web]
    T -->|Command line| V[Pay from CLI]
    T -->|Telegram| W[Pay via Telegram]
    U --> X[Payment confirmed]
    V --> X
    W --> X
    X --> R

    classDef gate fill:#fff4e5,stroke:#b26a00,color:#000
    class K,M,Q,S gate
```

## Current state of the storefront

The live storefront (`xs-web`) does not yet follow this journey. Today, a visitor browses the catalog and hands off the order through Telegram or email to complete the sale. The site does not call `POST /api/order`, because `orderEndpoint` is empty, so nothing is stored in D1. No account, balance, trial, or hosted invoice exists on the storefront. The diagram above is the target, not the current behavior.

## Legend

- **Subscription gate (D):** the first-run check that decides whether the user can proceed.
- **Validate existing status (J):** confirms any prior account, license, or balance before anything new is created.
- **Trial, referral, coupon (M to P):** each path needs abuse controls, such as a unique-account check. The rules are `UNKNOWN` and need a product decision.
- **Replenish (S):** an invoice paid with existing card payment details. Raw card numbers are never stored by StakeReloadXS. Payments go through a PCI-compliant processor, which is `UNKNOWN` until selected.
- **Amber nodes** are the legally gated decision points.

## Open decisions

1. Trial eligibility rules and how "unique account" is verified.
2. Referral and coupon reward terms.
3. Which payment processor handles invoices and card-on-file.
4. Whether Telegram is required or optional at onboarding.
5. Pricing and balance units. None are set.
6. Whether a paid subscription purchase exists separately from balance replenishment. The "Subscribe or purchase" node (Q) is a placeholder for an option that has not been specified.
