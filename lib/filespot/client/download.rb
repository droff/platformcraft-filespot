module Filespot
  ##
  # Download module wraps methods with `/download` resource[http://doc.platformcraft.ru/filespot/api/#download]
  module Download
    STATUS_ERROR = 'Error'.freeze

    # POST /download
    # returns task_id
    def post_download(url, path = nil)
      res = Response.new(Request.post("/download", {}, { url: url, path: path }))
      return nil unless res.code == 200
      res.data['task_id']
    end

    # GET /download_tasks
    # returns tasks list
    def get_download_tasks
      res = Response.new(Request.get("/download_tasks"))
      return [] unless res.code == 200

      arr = []
      count, tasks = res.data['count'].to_i, res.data['tasks']
      count.times { |i| arr << Task.new(tasks[i]) }
      arr
    end

    # GET /download_tasks/{:task_id}
    # returns task data
    def get_download_task(task_id)
      res = Response.new(Request.get("/download_tasks/#{task_id}"))
      return nil unless res.code == 200
      task = Task.new(res.data['task'], res.data['files'])

      raise(Filespot::TaskError, task.body) if task.status == STATUS_ERROR
      task
    end

    # DELETE /download_tasks/{:task_id}
    # returns removal status
    def delete_download_task(task_id)
      res = Response.new(Request.delete("/download_tasks/#{task_id}"))
      res
    end
  end

  ##
  # Task class provides task as object
  class Task
    # files data
    attr_reader :files

    # creates object
    def initialize(data, files = [])
      data.each { |k, v| define_singleton_method(k.to_sym) { v } }
      @files = files
    end
  end
end
