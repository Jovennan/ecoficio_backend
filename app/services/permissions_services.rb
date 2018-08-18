module PermissionsService

    # Using protected, this method don't get listed in the "permissions" screen
    protected
      # Load controllers and actions on the fly to generate granular permission managment
      def generate_permissions
        permissions = []
        Rails.application.eager_load!
        controllers = BaseController.descendants
        controllers.each do |c|
          controller_name = c.name.gsub(/Controller$/, '')
          controller = {}
          controller[:name] = controller_name.underscore
          controller[:actions] = []
          c.action_methods.each do |m|
            controller[:actions] << m unless m == 'method_missing'
          end
          permissions << controller
        end
        permissions
      end
  
      def find_or_create_role(name)
        Role.find_or_create_by(name: name)
      end
  
      # Return a list of roles for the given array
      def roles_ids_for_permissions(permissions = [])
        p = permissions.collect { |name| Role.find_or_create_by(name: name) }.collect { |role| role.id }
        puts "IDS: #{p}"
        p
      end
  
  end
  