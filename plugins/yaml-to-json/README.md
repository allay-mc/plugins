# YAML to JSON

This plugin converts [YAML][] files into [JSON][]. The only dependency is
[the Ruby programming language][Ruby].


## Example

```yaml
format_version: "1.19.50"
"minecraft:camera_preset":
  identifier: "example:custom"
  inherit_from: "minecraft:free"
  pos_x: 30
  pos_y: 90
  pos_z: -20
  rot_x: 10
  rot_y: 40
```

The above would be converted into this:

```json
{"format_version":"1.19.50","minecraft:camera_preset":{"identifier":"example:custom","inherit_from":"minecraft:free","pos_x": 30,"pos_y":90,"pos_z":-20,"rot_x":10,"rot_y":40}}
```


[YAML]: https://yaml.org/
[JSON]: https://www.json.org/json-en.html
[Ruby]: https://www.ruby-lang.org/

