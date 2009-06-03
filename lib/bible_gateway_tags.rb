module BibleGatewayTags
  include Radiant::Taggable
 
  desc "Links a bible verse to bible gateway" 
  tag "bible" do |tag|
    bible_version = tag.attributes["version"] || "NIV"
    if tag.attributes["verse"]
      "<a target=\"_TARGET\" href=\"http://bible.gospelcom.net/bible?version=#{bible_version}&passage=#{CGI.escape(tag.attributes["verse"])}\">#{tag.attributes["verse"]}, #{bible_version}</a>"
    else
      ""
    end 
  end
end