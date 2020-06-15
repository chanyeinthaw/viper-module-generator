require "viper/config"
require "viper/sources/sources"

def main
    if ARGV.count < 1 then raise "Invalid arguments!" end

    module_name = ARGV[0]

    config = read_config
    xcodeproj = read_xcodeproj config

    source_map = Sources::create_sources_map module_name
    Sources::generate_sources module_name, xcodeproj, read_config, source_map

    xcodeproj.save

    puts "Module #{module_name} generated!"
end

def run_main
    begin
        main
    rescue StandardError => e
        puts e.message
    end
end