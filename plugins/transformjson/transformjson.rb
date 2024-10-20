require 'erb'
require 'json'
require 'pathname'

PREBUILD = Pathname.new(ENV.fetch('ALLAY_PREBUILD'))
BP = PREBUILD.join("BP")
RP = PREBUILD.join("RP")
SP = PREBUILD.join("SP")
WT = PREBUILD.join("WT")

config = JSON.parse!(ARGV.first || "{}").merge({ "indent" => 2, "after-colon" => 1, "before-colon" => 0, "array-indent" => 1, "object-indent" => 1 }) { |key, old, new| old }

[BP, RP, SP, WT].each do |path|
  path.glob "**/*.json" do |json_file|
    next if json_file.directory?
    json_data = JSON.load_file json_file
    transformed = JSON.generate(json_data, {
      :indent => " " * config["indent"],
      :space => " " * config["after-colon"],
      :space_before => " " * config["before-colon"],
      :array_nl => "\n" * config["array-indent"],
      :object_nl => "\n" * config["object-indent"],
    })
    json_file.open('w') do |f|
      json_file.write(transformed)
    end
  end
end
