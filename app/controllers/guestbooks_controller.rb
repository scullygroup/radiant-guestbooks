class GuestbooksController < ApplicationController
  
  no_login_required
  radiant_layout "GuestComments"
  
  def index
    #@guestbooks = Guestbook.find(:all, :order => "RAND()", :limit => 1)
    @guestbooks = Guestbook.paginate(:page => params[:page], :per_page => 1, :order => "RAND()")

    respond_to do |format|
      format.html
      format.js { render :partial => 'comments' }
    end
  end
  
end
