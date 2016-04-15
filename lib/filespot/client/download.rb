module Filespot
  module Download
    def post_download(url, path = nil)
      res = Response.new(Request.post("/download", {}, { url: url, path: path }))
      return nil unless res.code == 200
      res.data['task-id']
    end

    def get_download_tasks
      res = Response.new(Request.get("/download_tasks"))
      return [] unless res.code == 200

      arr = []
      count, tasks = res.data['count'].to_i, res.data['tasks']
      count.times { |i| arr << Task.new(tasks[i]) }
      arr
    end

    def get_download_task(task_id)
      res = Response.new(Request.get("/download_tasks/#{task_id}"))
      return nil unless res.code == 200
      Task.new(res.data['task'])
    end

    def delete_download_task(task_id)
      res = Response.new(Request.delete("/download_tasks/#{task_id}"))
      res
    end
  end

  class Task
    def initialize(data)
      data.each { |k, v| define_singleton_method(k.to_sym) { v } }
    end
  end
end
