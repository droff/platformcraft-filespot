describe Filespot::Download do
  describe 'Download' do
    context '#get_download_task' do
      let(:task_id) { '57011e2a534b44741fc67880' }

      it 'task_id found' do
        stub_get("/download_tasks/#{task_id}", 'download_tasks_id.json')
        task = Filespot::Client.get_download_task(task_id)
        expect(task.id).to eq task_id
      end

      it 'task_id not found' do
        stub_request(:get, /api/).to_return(status: 500, body: nil)
        task = Filespot::Client.get_download_task('nil')
        expect(task).to eq nil
      end

      it 'raise error' do
        stub_get("download_tasks/#{task_id}", 'download_tasks_id_error.json')
        expect { Filespot::Client.get_download_task(task_id) }.to raise_error(Filespot::TaskError)
      end
    end

    context '#get_download_tasks' do
      it 'get tasks' do
        stub_get('/download_tasks', 'download_tasks.json')
        tasks = Filespot::Client.get_download_tasks
        expect(tasks.count).to eq 2
      end
    end
  end
end
