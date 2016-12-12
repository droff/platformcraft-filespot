module Filespot
  ##
  # Objects module wraps methods with `/objects` resource[http://doc.platformcraft.ru/filespot/api/#objects]
  module Objects
    # GET /objects
    # returns an objects list
    def get_objects(folder=nil)
      res = Response.new(Request.get("/objects", folder: folder))
      return [] unless res.code == 200

      arr = []
      count, objects = res.data['count'].to_i, res.data['objects']
      count.times { |i| arr << Object.new(objects[i]) }
      arr
    end

    # GET /objects/{:object_id}
    # returns an object
    def get_object(object_id)
      res = Response.new(Request.get("/objects/#{object_id}"))
      return nil unless res.code == 200
      Object.new(res.data['object'])
    end

    # POST /objects
    # * +file+ - file path(*required*)
    # * +name+ - name that will be stored in API service
    # returns a file info
    def post_object(file, name = nil)
      file_io = Faraday::UploadIO.new(file, 'application/octet-stream')
      res = Response.new(Request.post("/objects", {}, { file: file_io, name: name }))
      return res unless res.code == 200

      Object.new(res.data['object'])
    end

    # DELETE /objects/{:object_id}
    # returns removal status
    def delete_object(object_id)
      res = Response.new(Request.delete("/objects/#{object_id}"))
      res
    end

    # deletes object which has been found by path
    def delete_object_by_path(path)
      object = get_object_by_path(path)
      return delete_object(object.id) if object

      nil
    end

    # GET /objects/{:path}
    # returns an objects list
    def get_object_by_path(path)
      full_path = path[0] == '/' ? path : "/#{path}"
      folder = File.dirname(full_path)

      get_objects(folder).each do |object|
        return object if object.path == full_path
      end

      nil
    end

    # checks if object exists
    def exists?(path)
      !!get_object_by_path(path)
    end
  end

  # Object class provides API object as ruby object
  class Object

    # creates object
    def initialize(data)
      data.each { |k, v| define_singleton_method(k.to_sym) { v } }
    end
  end
end
