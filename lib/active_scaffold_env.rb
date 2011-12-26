# TODO: clean up extensions. some could be organized for autoloading, and others could be removed entirely.
ActiveSupport.on_load(:action_controller) do
  Dir["#{File.dirname __FILE__}/active_scaffold/extensions/*.rb"].each { |file| require file }

  ActionController::Base.send(:include, ActiveScaffold)
  ActionController::Base.send(:include, RespondsToParent)
  ActionController::Base.send(:include, ActiveScaffold::Helpers::ControllerHelpers)
end
ActionView::Base.send(:include, ActiveScaffold::Helpers::ViewHelpers)

ActiveSupport.on_load(:action_controller) do
  ActionController::Base.class_eval {include ActiveRecordPermissions::ModelUserAccess::Controller}
end
ActiveRecord::Base.class_eval     {include ActiveRecordPermissions::ModelUserAccess::Model}
ActiveRecord::Base.class_eval     {include ActiveRecordPermissions::Permissions}

I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'active_scaffold', 'locale', '*.{rb,yml}')]
#ActiveScaffold.js_framework = :prototype
