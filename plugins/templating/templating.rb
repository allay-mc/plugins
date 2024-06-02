require 'erb'
require 'json'
require 'pathname'

PREBUILD = Pathname.new(ENV.fetch('ALLAY_PREBUILD'))
BP = PREBUILD.join("BP")
RP = PREBUILD.join("RP")
SP = PREBUILD.join("SP")
WT = PREBUILD.join("WT")

config = JSON.parse!(ARGV.first || "{}").merge({ "trim-mode" => nil, "indicator" => "<%# using erb %>" }) { |key, old, new| old }

[BP, RP, SP, WT].each do |path|
  path.glob("**/*").each do |file|
    next if file.directory?
    file.open('r+') do |f|
      content = f.read
      next if content.each_line.count == 0
      next if content.each_line.first.chomp != config["indicator"]
      tpl = ERB.new(content, trim_mode: config["trim-mode"])
      res = tpl.result
      f.seek(0, IO::SEEK_SET)
      f.write(res)
    end
    next
  end
end
