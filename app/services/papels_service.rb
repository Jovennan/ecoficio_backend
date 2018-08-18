module PapelsService

    # Using protected, this method don't get listed in the "permissions" screen
    protected
      # Load controllers and actions on the fly to generate granular permission managment
      def generate_permissaos
        permissaos = []
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
          permissaos << controller
        end
        permissaos
      end
  
      def find_or_create_permissao(nome)
        Permissao.find_or_create_by(nome: nome)
      end
  
      # Return a list of permissaos for the given array
      def permissaos_ids_for_permissaos(permissaos = [])
        p = permissaos.collect { |nome| Permissao.find_or_create_by(nome: nome) }.collect { |permissao| permissao.id }
        puts "IDS: #{p}"
        p
      end
  
  end
  