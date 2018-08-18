class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def index
        @users = User.all
    
        # @q = User.ransack(params[:q].try(:merge, m: params[:combinator]))
        # @users = @q.result.includes(:unit, :server, :permissions).page(params[:page]).per(20)
        # respond_to do |format|
        #   format.html
        #   format.pdf do
        #     pdf = UsersPdf.new(@users, current_user.server.name, current_user.server.registration)
    
        #     send_data pdf.render,
        #       filename: "users_#{Time.new}",
        #       type: 'application/pdf',
        #       disposition: 'inline'
        #   end
        # end
      end
    
      def show
      end
    
      def edit
      end
    
      def create
    
        @user = User.new(user_params)
        generate_default_password
        if @user.save    
          flash[:success] = "Usuario cadastrado"
          redirect_to users_path
        else
          render 'new'
        end
      end
    
      def update
        if @user.update(user_params)
          flash['success'] = 'Usuario atualizado'
          redirect_to users_path
        else
          render 'edit'
        end
      end
    
      def update_permission
        respond_to do |format|
          if @user.update(user_params)
            format.json{
              render json: @user,
              status: :updated,
              location: @user
            }
          else
            format.json{
              render json: @users.errors,
              status: :unprocessable_entity
            }
          end
        end
      end
    
      def destroy
        @user.destroy
        redirect_to users_url
      end
    
      protected
    
        def generate_default_password
          @user.password = '12345678'
          @user.password_confirmation = '12345678'
        end
    
        def user_or_not_found
          @user = User.find_by(id: params[:id])
          if @user.nil?
            flash['danger'] = 'Usuario não encontrado.'
            redirect_to users_path
          end
    
        end
    
        def user_params
          user_params = params.require(:user).permit(
                                       :email,
                                       :nome,
                                       :cpf,
                                       :cargo,
                                       :departamento_id,
                                       :password,
                                       :password_confirmation,
                                       )
          user_params
        end

end
