# ZarishSphere — Makefile (Frontend)
.PHONY: dev build test lint clean

# Start development server
dev:
	pnpm dev

# Build for production
build:
	pnpm build

# Run tests
test:
	pnpm test

# Run linter
lint:
	pnpm lint

# Format code
fmt:
	pnpm format

# Clean build artifacts
clean:
	rm -rf .next/ dist/ node_modules/

# Type check
typecheck:
	pnpm typecheck

# Install dependencies
install:
	pnpm install

# Storybook
storybook:
	pnpm storybook
