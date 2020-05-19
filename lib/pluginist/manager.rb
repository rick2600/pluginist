class Pluginist::Manager
  def initialize
    @plugins_name_path = {}
  end

  def add_search_paths(plugins_path)
    temp_paths = plugins_path
    temp_paths = [plugins_path] unless plugins_path.kind_of?(Array)
    temp_paths.each do |path|
      Dir.glob(File.join(File.absolute_path(path), '**', '*.rb')).each do |plugin_path|
        plugin_name = File.basename(plugin_path, '.rb')
        if @plugins_name_path.key?(plugin_name)
          puts "Plugin #{plugin_name} already loaded!"
        else
          @plugins_name_path[plugin_name] = plugin_path
        end
      end
    end
  end

  def search_plugins_by_tag(tag)
    all_plugins.select { |plugin| plugin[:tags].include?(tag) }
  end

  def run_plugin(plugin_name, params)
    plugin = require_plugin(plugin_name)
    unless plugin.nil?
      plugin.new(params).internal_run
    end
  end

  def info_plugin(plugin_name)
    info = {}
    plugin = require_plugin(plugin_name)
    unless plugin.nil?
      info = plugin.info
      info[:name] = plugin_name
    end
    info
  end

  def all_plugins
    plugins = []
    @plugins_name_path.keys.sort.each {|plugin_name| plugins << info_plugin(plugin_name) }
    plugins
  end

  def require_plugin(plugin_name)
    plugin = nil
    if @plugins_name_path.key?(plugin_name)
      require @plugins_name_path[plugin_name]
      plugin = to_constant(plugin_name)
    else
      puts "Plugin '#{plugin_name}' not found"
    end
    plugin
  end

  def to_constant(plugin_name)
    Object.const_get(plugin_name.split('_').map(&:capitalize).join.to_sym)
  end
end
