module Filespot
  module Objects
    def get_objects
      res = Response.new(Request.get("/objects"))
      return [] unless res.code == 200

      arr = []
      count, objects = res.data['count'].to_i, res.data['objects']
      count.times { |i| arr << Object.new(objects[i]) }
      arr
    end

    def get_object(object_id)
      res = Response.new(Request.get("/objects/#{object_id}"))
      return nil unless res.code == 200
      Object.new(res.data['object'])
    end

    def post_object(file, name = nil)
      file_io = Faraday::UploadIO.new(file, 'application/octet-stream')
      res = Response.new(Request.post("/objects", {}, { file: file_io, name: name }))
      return res unless res.code == 200

      Object.new(res.data['object'])
    end

    def delete_object(object_id)
      res = Response.new(Request.delete("/objects/#{object_id}"))
      res
    end
  end

  class Object
    def initialize(data)
      data.each { |k, v| define_singleton_method(k.to_sym) { v } }
    end
  end
end
