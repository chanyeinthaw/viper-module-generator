require "viper/config"

def main
    if ARGV.count < 2
        puts "Invalid Arguments!"
        return
    end

    command = ARGV[0]
    command_argv = ARGV[1]

    case command
    when "init"
        create_new_config command_argv
    else
        puts "Invalid Arguments!"
    end
end