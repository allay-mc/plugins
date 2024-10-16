# Excluding

This plugin can be used to exclude files that match a [glob pattern][]. The plugin should be
configured to be run as one of the last plugins because other plugins may depend on these files.

## Example

`allay.toml`

```toml
# ...

[[plugins]]
run = "scripts/exclude.rb"
options = { patterns = ["**/*.ts"] } # remove all `.ts` files
```

## Additional Options

- `patterns = PATTERNS` --- an array of [glob pattern][]s

[glob pattern]: https://en.wikipedia.org/wiki/Glob_(programming)
