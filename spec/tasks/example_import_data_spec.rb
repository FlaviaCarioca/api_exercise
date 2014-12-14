require 'spec_helper'
require 'rake'
require 'vcr'

describe 'example import_data task' do
  # USE THIS TO MAKE SURE YOUR CONFIGURATION FOR VCR IS WORKING CORRECTLY
  # it 'should work correctly' do
  #   VCR.use_cassette 'https' do
  #     # testing vcr is working
  #     source = 'https://gist.githubusercontent.com/myronmarston/fb555cb593f3349d53af/raw/6921dd638337d3f6a51b0e02e7f30e3c414f70d6/vcr_gist'
  #     response = Net::HTTP.get_response(URI.parse(source))
  #     puts response.body
  #   end
  # end

  # before do
  #   @rake = Rake::Application.new
  #   @task_name = 'exercise:import_data'
  #   Rake.application = @rake
  #   load 'tasks/exercise.rake'
  #   Rake::Task.define_task(:environment)

  #   # DatabaseCleaner[:active_record].clean
  # end

  # it 'should populate Case table' do
  #   VCR.use_cassette 'https' do

  #     # DatabaseCleaner[:active_record].cleaning do
  #     #   binding.pry
  #     expect(@rake[@task_name].invoke ).not_to be_empty
  #     binding.pry
  #    # expect(Case.count).to be > 0

  #   end
  # end
end
