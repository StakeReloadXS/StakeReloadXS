# Discussions administrator setup

GitHub Discussions categories are repository settings, **not** configurable by committing files. A maintainer with administration access should go to **Settings → General → Features → Discussions**, enable Discussions if necessary, then use **Discussions → Categories → New category**.

Configure the following categories and formats; preserve any useful existing categories:

| Name | Slug (suggested) | Format | Who can start |
| --- | --- | --- | --- |
| Announcements | announcements | Announcement | Maintainers only |
| Feature Requests | feature-requests | Open-ended discussion | Community |
| Feedback & Experiences | feedback-experiences | Open-ended discussion | Community |
| Questions & Support | questions-support | Question / Answer | Community |
| Bug Reports | bug-reports | Open-ended discussion | Community |
| Polls & Priorities | polls-priorities | Poll | Community |
| Community Showcase | community-showcase | Open-ended discussion | Community |

**Important:** Template YAML files are GitHub Discussion forms that must be enabled and matched to the actual categories, using GitHub's supported format and names. Check forms rendering after enabling categories. If GitHub does not match the templates to custom category names, rename template files to the corresponding category slug (for example `feature-requests.yml`, `feedback-experiences.yml`, `questions-support.yml`) and validate them.

## Seed and pin discussions
- **Start Here — Community Guidelines:** link COMMUNITY.md; explain where participants post and which information is unsafe to share.
- **How feature requests are reviewed:** acknowledge / evaluate / planned / implemented / declined, linked Issues and release notes.
- **Share your first experience:** ask for one improvement, one successful moment, and a pain point.
- **Roadmap and product priorities:** post a monthly community poll; don't promise feature delivery dates until scheduled.

## Suggested operations
- Assign a community owner and backup moderator.
- Review new discussions every business day; acknowledge within 2 business days as a target, not a contractual guarantee.
- Deduplicate similar requests, encourage upvotes, and link existing proposals.
- Escalate vulnerabilities privately; never request credentials, identity records or payment information in public.
- Convert confirmed defects into actionable Issues; link release announcements back to the originating community discussion.
- Post a public monthly review of what was suggested, what is planned, what was shipped, and why proposals were declined.
- Keep critical account and payment support on private channels; discussions are public.
