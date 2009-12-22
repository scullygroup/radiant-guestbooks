# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class GuestbooksExtension < Radiant::Extension
  version "1.0"
  description "A Radiant extension that allows you to add guestbooks and generate them randomly on each page"
  url "http://www.scullytown.com"
  
  define_routes do |map|
    
    #This links to an xml file listing of all the guestbooks, defined in the extension tags
    #map.connect 'guestbooks', :url => '/guestbooks', :controller => "site", :action => "show_page"
   # map.connect '', :controller => "guestbooks", :action => "index"
    
    map.resources :guestbooks
    
    map.with_options(:controller => 'admin/guestbooks') do |guestbook|
      guestbook.guestbook_index           'admin/guestbooks',             :action => 'index'
      guestbook.guestbook_show            'admin/guestbooks/show/:id',    :action => 'show'   
      guestbook.guestbook_new             'admin/guestbooks/new',         :action => 'new'
      guestbook.guestbook_create          'admin/guestbooks/create',      :action => 'create'   
      guestbook.guestbook_edit            'admin/guestbooks/edit/:id',    :action => 'edit'
      guestbook.guestbook_update          'admin/guestbooks/update/:id',  :action => 'update'
      guestbook.guestbook_remove          'admin/guestbooks/remove/:id',  :action => 'destroy'
    end

  end
  
  def activate
    admin.tabs.add "Guestbooks", "/admin/guestbooks", :after => "Layouts", :visibility => [:all]
    Page.send :include, GuestbookTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Guestbook"
  end
  
end