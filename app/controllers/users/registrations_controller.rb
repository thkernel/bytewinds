# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  #prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  before_action :configure_sign_up_params, only: [:create]

  # before_action :configure_account_update_params, only: [:update]
  #before_action :configure_permitted_parameters, if: :devise_controller?


  def new
    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end


  def create

      #profile_attributes = sign_up_params["profile_attributes"]
      #profile_type = profile_attributes["profile_type"]
      role_id = sign_up_params[:role_id]




      #puts "ROLE ID: #{role_id}"


      unless role_id.present?
        build_resource(sign_up_params.merge(role_id: Role.find_by(name: "user").id))
      end

      resource.save

      puts "RESOURCE: #{resource.id}"

      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
     end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login,  profile_attributes: [ :first_name, :last_name ]])
    #devise_parameter_sanitizer.permit(:account_update, keys: [:login, :company, :city, :address, :phone, :avatar])
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  def after_update_path_for(resource)
    profile_path
  end

  def after_sign_in_path_for(resource)
   
        dashboard_path
 

  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end


  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        
        #The 2 next line is for profile
        build_resource({})
        resource.build_profile

        resource.validate # Look for any other validation errors besides reCAPTCHA
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end 
    end

end
