require "active_record/connection_adapter"
require "pry-byebug"

module ActiveRecord
  class Base
    def initialize(attributes = {})
      @attributes = attributes
    end

    def self.abstract_class=(value)
    end

    def self.table_name
      name.downcase + "s"
    end

    def method_missing(name, *args)
      columns = self.class.connection.columns(self.class.table_name)
      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      attributes = 
        connection.execute("SELECT * FROM #{table_name} WHERE id = #{id.to_i}").first
      new(attributes)
    end

    def self.establish_connection(options)
      @@connection =
        ConnectionAdapter::SqliteAdapter.new(options[:database])
    end

    def self.connection
      @@connection
    end
  end 
end
