# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class BibleGatewayTagsExtension < Radiant::Extension
  version "1.0"
  description "Easily link to the bible gateway."
  url "http://github.com/dib/radiant-bible_gateway_tags-extension"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :bible_gateway_tags
  #   end
  # end
  
  def activate
    # admin.tabs.add "Bible Gateway Tags", "/admin/bible_gateway_tags", :after => "Layouts", :visibility => [:all]
    Page.send :include, BibleGatewayTags
  end
  
  def deactivate
    # admin.tabs.remove "Bible Gateway Tags"
  end
  
end
