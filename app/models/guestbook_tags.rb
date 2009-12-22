module GuestbookTags
  include Radiant::Taggable
  
  tag 'guestbooks' do |tag|
    tag.expand
  end
          
  tag 'guestbooks:each' do |tag|
    result = []
    @guestbooks = Guestbook.find(:all, :order => "RAND()", :limit => 1)
    @guestbooks.each do |guestbook|
      tag.locals.guestbook = guestbook
      result << tag.expand
    end
    result
  end
 
  tag 'guestbooks:each:id' do |tag|
     guestbook = tag.locals.guestbook
     %{#{guestbook.id}}
  end
     
  tag 'guestbooks:each:author' do |tag|
    guestbook = tag.locals.guestbook
    %{#{guestbook.author}}
   end
  
   tag 'guestbooks:each:body' do |tag|
     guestbook = tag.locals.guestbook
     %{#{guestbook.body}}
  end
  
end