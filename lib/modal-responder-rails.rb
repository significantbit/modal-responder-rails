require 'modal-responder-rails/version'

require 'responders'

require 'modal-responder-rails/controller'
require 'modal-responder-rails/modal_responder'

module ModalResponder
  # Bootstrap version to be used
  mattr_accessor :bootstrap
  @@bootstrap = 4

  def self.configure
    yield self
  end

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActionController::Base.send(:include, ModalResponder::Rails::Controller)
