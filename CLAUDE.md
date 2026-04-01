# CLAUDE.md

## Project overview

`pwqgen.rb` is a Ruby implementation of passwdqc's `pwqgen` — a random, pronounceable passphrase generator. It picks words from the EFF 7,776-word list and joins them with random separator characters.

## Running tests

```bash
bundle install
bundle exec rake test       # runs both rspec + cucumber features
bundle exec rake spec       # rspec unit tests only
bundle exec rake features   # cucumber integration tests only
```

## Architecture

| Path | Purpose |
|------|---------|
| `lib/pwqgen/wordlist.rb` | `Pwqgen::Generator::WORDLIST` constant — 7,776-word EFF list |
| `lib/pwqgen/pwqgen.rb` | Core `Pwqgen` module and `Pwqgen::Generator` class |
| `lib/pwqgen/version.rb` | `Pwqgen::VERSION` constant |
| `bin/pwqgen.rb` | CLI entry point (uses `docopt` for argument parsing) |
| `spec/lib/pwqgen_spec.rb` | RSpec unit tests |
| `features/` | Cucumber integration tests |

## Key conventions

- Ruby `>= 3.1` required; development targets Ruby 3.4.x.
- `SecureRandom` (stdlib) is used directly — no external randomness gem needed.
- `Pwqgen::Generator::DEFAULT_SEPARATORS` holds the separator character set; pass a custom array to `Generator.new` to override.
- CI runs a matrix across Ruby **3.2, 3.3, 3.4, and 4.0** via `.github/workflows/test.yml`.
- Releases are handled by `googleapis/release-please-action`; version lives in `lib/pwqgen/version.rb`.
