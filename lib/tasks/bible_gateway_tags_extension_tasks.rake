namespace :radiant do
  namespace :extensions do
    namespace :bible_gateway_tags do
      
      desc "Runs the migration of the Bible Gateway Tags extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          BibleGatewayTagsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          BibleGatewayTagsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Bible Gateway Tags to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from BibleGatewayTagsExtension"
        Dir[BibleGatewayTagsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(BibleGatewayTagsExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
