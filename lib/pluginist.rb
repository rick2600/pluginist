module Pluginist; end

require 'active_model'
require 'active_model_attributes'

warn_level = $VERBOSE
$VERBOSE = nil
ActiveModelAttributes::ClassMethods::SERVICE_ATTRIBUTES = %i(default description user_provided_default).freeze
$VERBOSE = warn_level

require_relative './pluginist/manager'
require_relative './pluginist/plugin'
