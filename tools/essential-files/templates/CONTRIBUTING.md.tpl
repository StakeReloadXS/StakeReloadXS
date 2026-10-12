# Contributing

This repository is maintained by StakeReloadXS.

## Workflow

1. Branch from the default branch (`main`) with a descriptive name.
2. Keep changes small and focused: one concern per pull request.
3. Run the repository's checks before opening a pull request. Commands are in `CLAUDE.md`.
4. Add user-visible changes to `CHANGELOG.md` under `[Unreleased]`. Update `VERSION.md` when releasing.
5. Open a pull request. Pull requests need review before merge.

## Standards

- Do not commit secrets. Use `.env.example` for placeholders.
- Match the naming and style of the surrounding code.
- Add or update tests with behavior changes where the repository has a test suite.

## Questions

Open an issue in this repository.
