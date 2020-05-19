class Pluginist::Plugin
  include ActiveModel::Model
  include ActiveModelAttributes
  extend ActiveModel::Callbacks

  define_model_callbacks :run
  before_run :action_before_run
  after_run :action_after_run

  class << self
    alias parameter attribute
  end

  attribute :description, :string, default: ''
  attribute :tags, :array, default: []
  attribute :authors, :array, default: []

  # This methods execute the plugin
  def internal_run
    run_callbacks :run do
      run
    end
  end

  # This method is where the plugin logic resides
  def run; end

  def self.attributes
    attributes_registry
  end

  def parameters
    self.class.attributes
  end

  def self.parameters
    attributes
  end

  # This method is used to set a description of a plugin
  def self.description(description='')
    attribute :description, :string, default: description
  end

  # This method is used to set an array of authors of a plugin
  def self.authors(authors = [])
    attribute :authors, :array, default: authors
  end

  # This method is used to set an array of tags of a plugin
  def self.tags(tags = [])
    attribute :tags, :array, default: tags
  end

  def self.info
    info = {}
      info[:description] = parameters[:description][1][:default]
      info[:authors] = parameters[:authors][1][:default]
      info[:tags] = parameters[:tags][1][:default]
      info[:params] = []

      parameters.sort.each do |param_name, param_value|
        next if %i[authors description tags].include? param_name
        info[:params] << {
          name:  param_name,
          description: param_value[1][:description],
          type: param_value[0],
          default: param_value[1][:default] || nil
        }
      end
    info
  end

  private

  # Callback used to validate the plugin before execute it
  def action_before_run
    # puts "#{self.class} started"
    abort_on_errors unless valid?
  end

  # Callback reserved for future use when the plugin finishes its job
  def action_after_run
    # puts "#{self.class} finished"
  end

  def abort_on_errors
    puts errors.full_messages
    throw(:abort)
  end
end
