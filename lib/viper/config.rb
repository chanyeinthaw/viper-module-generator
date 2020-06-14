require 'json'

def create_new_config(module_root_dir)
    config_object = {
        "module-root": module_root_dir
    }

    unless File.exists? "viper-config.json"
        File.write "viper-config.json", JSON.generate config_object
    end
end