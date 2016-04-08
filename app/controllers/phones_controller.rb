class PhonesController < ApplicationController

  def index
    @phone = Phone.new
    @phones = Phone.all
    @os_collection = []
    OperatingSystem.all.each do |os|
      @os_collection << [os.name, os.id]
    end
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      flash[:notification] = "Phone Successfully Added!"
    else
      flash[:error] = @phone.errors.full_messages.join(", ")
    end
    redirect_to phones_path
  end

  private

  def phone_params
    params.require(:phone).permit(:manufacturer, :screen_size, :charging_port, :phone_name, :quantity, :operating_system_id)
  end
end
