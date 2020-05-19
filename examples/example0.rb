require 'pluginist'
require 'pp'

plugin_manager = Pluginist::Manager.new
plugin_manager.add_search_paths(File.join(File.dirname(__FILE__), 'plugins'))

puts "[*] Listing all plugins ".ljust(80, '=')
pp plugin_manager.all_plugins

puts "\n[*] Info about a plugin ".ljust(80, '=')
pp plugin_manager.info_plugin('hello')

puts "\n[*] Searching plugins by tag ".ljust(80, '=')
pp plugin_manager.search_plugins_by_tag(:greetz)

puts "\n[*] Running a plugin ".ljust(80, '=')
plugin_manager.run_plugin('hello', name: 'Bob')

puts "\n[*] Running a plugin ".ljust(80, '=')
plugin_manager.run_plugin('calc', first: '10', second: '5', op: '+')
