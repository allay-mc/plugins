require 'json'
require 'pathname'

PREBUILD = Pathname.new(ENV.fetch('ALLAY_PREBUILD'))
BP = PREBUILD.join("BP")
RP = PREBUILD.join("RP")
SP = PREBUILD.join("SP")
WT = PREBUILD.join("WT")

config = JSON.parse!(ARGV.first || "{}").merge({"patterns" => []}) { |key, old, new| old }
patterns = config["patterns"]

patterns.each do |pattern|
  [BP, RP, SP, WT].each do |path|
    path.glob(pattern).each do |file|
      next if file.directory?
      file.unlink()
    end
  end
end

