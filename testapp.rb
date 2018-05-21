require 'rocketjob'

class TestJob < RocketJob::Job
  def perform
    puts "hello there!"
  end
end

if __FILE__ == $0
  TestJob.create!
end