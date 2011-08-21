class PagesController < HighVoltage::PagesController
  #before_filter :authenticate
  #layout :layout_for_page
  before_filter :authenticate_user!, :except => [:home, :shops, :index, :show]
  
  def show
    @page = Page.find_by_title(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end
  
  def edit
    @page = Page.find_by_title(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @page }
    end
  end
  
  def update
    @page = Page.find_by_title(params[:id])
 
     respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = "Your account has been updated"
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
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