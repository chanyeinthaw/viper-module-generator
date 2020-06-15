require 'json'
require 'xcodeproj'

CONFIG_DIR = "#{Dir.pwd}/vipera-config.json"

def create_new_config(module_root_dir)

    if File.exists? CONFIG_DIR then raise "Already initialized!" end
    unless File.exists? "#{Dir.pwd}/#{module_root_dir}" then raise "Module root directory not exists!" end

    config_object = {"module-root": module_root_dir}
    File.write CONFIG_DIR, JSON.generate(config_object)
end

def read_config
    unless File.exists? CONFIG_DIR then raise "Config file required!" end
    JSON.parse File.read CONFIG_DIR
end

def read_xcodeproj(config)
    xcodeproj_file = config["xcodeproj"]
    unless File.exists? "#{Dir.pwd}/#{xcodeproj_file}" then raise "xcodeproj file not found!" end

    Xcodeproj::Project.open("#{Dir.pwd}/#{xcodeproj_file}")
end