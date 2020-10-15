require 'thor'

require 'migratelint'
require_relative 'migratelint'

module MigrateLint
  class CLI < Thor
    desc "check FILES", "Check provided files"
    def check(*args)
      exit 0 unless args.length > 0

      error = false
      Dir.glob(args).each do |f|
        begin
          MigrateLint.check(File.read(f))
        rescue => e
          puts "#{f} => #{e.message}"
          error = true
        end
      end

      exit 1 if error
    end
  end
end
