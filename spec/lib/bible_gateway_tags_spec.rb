require File.dirname(__FILE__) + '/../spec_helper'
 
describe 'BibleGatewayTags' do
  dataset :pages
 
  describe '<r:bible verse="Psalm 53:2-3" version="KJV" />' do
    
    it 'should create an anchor to biblegateway.com' do
      tag = '<r:bible verse="Psalm 53:2-3" version="KJV" />'
      expected = '<a target="_TARGET" href="http://bible.gospelcom.net/bible?version=KJV&passage=Psalm+53%3A2-3">Psalm 53:2-3, KJV</a>'
      pages(:home).should render(tag).as(expected)
    end 
    
  end
end