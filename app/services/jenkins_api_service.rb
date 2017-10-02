# JenkinsApiService
class JenkinsApiService
  def initialize
    puts 'initialized JenkinsApiService'
  end

  def get_build_status(job_description)
    tree = job_description.split(',')

    puts tree
  end
end
