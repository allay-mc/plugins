# Allay Plugins

Common Allay plugins that can be used in your project.

Each directory in the `plugins` directory contains further information about the
appropiate plugin.


## Installation

If you have initialized your Allay project with git, run the following command
to make all plugins available in your current project:

```console
git submodule add https://github.com/allay-mc/plugins.git plugins-thirdparty
```

```toml
# FILE: allay.toml

[[plugin]]
name = "yaml to json"
run = "plugins-thirdparty/plugins/yaml-to-json/yaml_to_json.rb"
with = "ruby"
```

Alternatively you can simply download the plugins you need but using a git
submodule allows you to easily update the plugins when new updates or entirely
new plugins are available.


## Submitting

You can submit your own plugin by making a pull request.

```
README.md
plugins/
├── ... existing plugins
└── <your-plugin-name>/
    ├── LICENSE.txt
    ├── README.md
    └── ... and all other files/directories
```

