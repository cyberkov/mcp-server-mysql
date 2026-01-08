# Contributing to MCP Server MySQL

Thank you for your interest in contributing to this project!

## Development Setup

1. Clone the repository
2. Install dependencies:

   ```bash
   pnpm install
   ```

3. Build the project:

   ```bash
   pnpm build
   ```

### Optional: Install Pre-commit Hook

To automatically check that the lockfile is committed with package.json changes:

```bash
cp scripts/pre-commit-hook.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

This hook will prevent commits that modify `package.json` without also staging `pnpm-lock.yaml`.

## Making Changes

### Package Dependencies

When adding, removing, or updating dependencies:

1. **Always commit the lockfile**: After running `pnpm install`, `pnpm add`, or `pnpm remove`, make sure to commit the updated `pnpm-lock.yaml` file along with your `package.json` changes.

2. **Keep lockfile in sync**: The lockfile must stay in sync with `package.json`. Our CI pipeline validates this with the `--frozen-lockfile` flag.

3. **Update the lockfile manually** if needed:

   ```bash
   pnpm install
   ```

### Code Quality

Before submitting a pull request:

1. **Lint your code**:

   ```bash
   pnpm lint
   ```

2. **Fix linting issues**:

   ```bash
   pnpm lint:fix
   ```

3. **Build the project**:

   ```bash
   pnpm build
   ```

4. **Run tests** (if MySQL is available):

   ```bash
   pnpm test
   ```

## CI/CD

Our CI pipeline includes:

- **Lockfile validation**: Ensures `pnpm-lock.yaml` is synchronized with `package.json`
- **Linting**: ESLint and Markdownlint checks
- **Building**: TypeScript compilation
- **Testing**: Unit, integration, and e2e tests

If the lockfile check fails:

1. Run `pnpm install` locally
2. Commit the updated `pnpm-lock.yaml`
3. Push your changes

### Automated Dependency Updates

This project uses [Renovate](https://docs.renovatebot.com/) to automatically:

- Keep dependencies up-to-date
- Maintain the lockfile with scheduled updates
- Create pull requests for dependency updates

Renovate is configured in `renovate.json` to:

- Auto-merge minor and patch updates for stable packages (not 0.x.x)
- Perform lockfile maintenance weekly (Monday before 3am)
- Limit concurrent PRs to avoid overwhelming reviewers

## Pull Request Process

1. Create a feature branch from `main` or `dev`
2. Make your changes following the guidelines above
3. Ensure all CI checks pass
4. Submit a pull request with a clear description of your changes

## Questions?

Feel free to open an issue if you have questions about contributing.
