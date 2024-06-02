require 'json'
require 'pathname'
require 'yaml'

PREBUILD = Pathname.new(ENV.fetch('ALLAY_PREBUILD'))
BP = PREBUILD.join("BP")
RP = PREBUILD.join("RP")
SP = PREBUILD.join("SP")
WT = PREBUILD.join("WT")

[BP, RP, SP, WT].each do |path|
  path.glob('**/*.yaml').each do |yaml_file|
    json_data = YAML.load_file(yaml_file).to_json
    json_file = yaml_file.parent + "#{yaml_file.basename('.*')}.json"
    json_file.write(json_data)
    yaml_file.unlink()
  end
end
