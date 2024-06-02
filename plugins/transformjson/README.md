# Transform JSON

This plugins transforms JSON files by adding or removing spaces at possible
places. Adding spaces improves readability for humans whereas removing spaces
decreases the total add-on size.


## Additional Options

- `indent = AMOUNT` --- indent level by this amount of spaces (default: 2 spaces)
- `after-colon = AMOUNT` --- amount of spaces inserted after each colon (`:`)
  (default: 1 space)
- `before-colon = AMOUNT` --- amount of spaces inserted after each colon (`:`)
  (default: *none*)
- `array-indent = AMOUNT` --- amount of newlines used to indent arrays
  (default: 1 newline)
- `object-indent = AMOUNT` --- amount of newlines used to indent objects
  (default: 1 newline)

Leaving all options will generate human readable format by default.


## Example

Use this preset for readable format in debug mode and minimum file size otherwise.

```toml
[[plugin]]
run = "scripts/transformjson.rb"
with = "ruby"
options = { indent = 0, before-colon = 0, after-colon = 0, array-indent = 0, object-indent = 0 }
when = 'env("ALLAY_DEBUG") != "1"'

[[plugin]]
run = "scripts/transformjson"
with = "ruby"
when = 'env("ALLAY_DEBUG") == "1"'
```

