# Templating

This plugins allows you to use [ERB][] within in your project. The only
dependency is [the Ruby programming language][Ruby].


# Example

`src/BP/functions/init.mcfunction`

```erb
%# using erb
% 8.times do |i|
scoreboard objectives add score<%= i %> dummy
% end
```

`allay.toml`

```toml
# ...

[[plugins]]
run = "scripts/templating.rb"
with = "ruby"
options = { trim-mode = "%<>", indicator = "%# using erb" }
```

The above would replace the contents of the `init.mcfunction` file with the
following.

```mcfunction
scoreboard objectives add score0 dummy
scoreboard objectives add score1 dummy
scoreboard objectives add score2 dummy
scoreboard objectives add score3 dummy
scoreboard objectives add score4 dummy
scoreboard objectives add score5 dummy
scoreboard objectives add score6 dummy
scoreboard objectives add score7 dummy
```


# Additional Options

- `trim-mode = MODE` --- adjust the text generation (default: *none*)
  - `%` --- enables Ruby code processing for lines beginning with `%`
  - `<>` --- omit newline for lines starting with `<%` and ending in `%>`
  - `>` --- omit newline for lines ending in `%>`
  - `-` --- omit blank lines ending in `-%>`
- `indicator = INDICATOR` --- the first line must match this to be rendered
  which is usually an ERB comment to exclude that indicator from the result
  as well (default: `<%# using erb %>`)


[ERB]: https://github.com/ruby/erb
[Ruby]: https://www.ruby-lang.org/
