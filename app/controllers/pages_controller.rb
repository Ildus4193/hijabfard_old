class PagesController < HighVoltage::PagesController
  #before_filter :authenticate
  layout :layout_for_page
  before_filter :authenticate_user!, :except => [:home, :index, :show]
  
  def home
    
  end
  
  protected
    def layout_for_page
      case params[:id]
      when 'home'
        'home'
      else
        'application'
      end
    end
end