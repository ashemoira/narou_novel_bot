require 'yaml'

def help
  option_yml = YAML.load_file('../config/option.yml')
  zip = '```'
  zip << option_yml['option']['-help'] << "\n"
  zip << '```'
end
