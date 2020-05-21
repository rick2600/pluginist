class Pluginist::PluginLoadError < StandardError
  def initialize(msg='Error on load plugin')
    super(msg)
  end
end
