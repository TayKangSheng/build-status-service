require 'http'

# JenkinsApiService
class JenkinsApiService
  def initialize
    puts 'initialized JenkinsApiService'
  end

  def get_build_status(job_tree)
    tree = job_tree.split(',')
    relative_url = '/' + tree.join('/job/')
    query_params = ''

    get(relative_url, query_params)
  end

  def get(relative_url, query_params)
    full_url = ENV['JENKINS_HOST'] + relative_url + query_params

    HTTP.basic_auth(user: ENV['JENKINS_USR'], pass: ENV['JENKINS_PWD'])
        .get(full_url)
  rescue StandardError => e
    {
      url: full_url,
      error_message: e.message,
      status: 400
    }
  end
end
