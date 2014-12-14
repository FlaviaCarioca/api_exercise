require 'spec_helper'
# require 'rake'
require  'vcr'

describe 'exercise:import_data' do


    let(:rake)      { Rake::Application.new }
    let(:task_name) { self.class.top_level_description }
    let(:task_path) { "lib/tasks/#{task_name.split(":").first}" }
    subject         { rake[task_name] }
 
    def loaded_files_excluding_current_rake_file
      $".reject {|file| file == Rails.root.join("#{task_path}.rake").to_s }
    end
 
    before do
      Rake.application = rake
      Rake.application.rake_require(task_path, [Rails.root.to_s], loaded_files_excluding_current_rake_file)
   
      Rake::Task.define_task(:environment)
    end
  # before (:all) do
  #   @rake = Rake::Application.new
  #   @task_name = 'exercise:import_data'
  #   Rake.application = @rake
  #   load 'tasks/exercise.rake'
  #   Rake::Task.define_task(:environment)
  # end


  it 'gets populated after the exercise:import rake task runs' do
    VCR.use_cassette 'https' do

      # DatabaseCleaner[:active_record].cleaning do
       binding.pry
       subject.invoke
      #@rake[@task_name].invoke RAILS_ENV='test'
      # expect(@rake[@task_name].invoke).not_to be_empty
      binding.pry
      expect(Case.count).to be > 0
    end
  end
end
