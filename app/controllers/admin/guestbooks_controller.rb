class Admin::GuestbooksController < ApplicationController
  
  def index
    @guestbooks = Guestbook.find(:all)
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @guestbook = Guestbook.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @guestbook = Guestbook.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @guestbook = Guestbook.find(params[:id])
  end

  def create
    @guestbook = Guestbook.new(params[:guestbook])

    respond_to do |format|
      if @guestbook.save
        flash[:notice] = 'Guestbook was successfully created.'
        format.html { redirect_to('/admin/guestbooks') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @guestbook = Guestbook.find(params[:id])

    respond_to do |format|
      if @guestbook.update_attributes(params[:guestbook])
        flash[:notice] = 'Guestbook was successfully updated.'
        format.html { redirect_to('/admin/guestbooks') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @guestbook = Guestbook.find(params[:id])
    @guestbook.destroy

    respond_to do |format|
      flash[:notice] = 'Guestbook was successfully deleted.'
      format.html { redirect_to('/admin/guestbooks') }
    end
  end
  
end