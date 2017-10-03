require 'http'

# JenkinsApiService
class JenkinsApiService
  def get_build_status(job_tree)
    tree = job_tree.split(',')
    relative_url = '/job/' + tree.join('/job/') + '/api/json'
    query_params = '?tree=color'

    response = get(relative_url, query_params)

    if response.code == 200
      response_body = JSON.parse(response.body)
      {
        code: response.code,
        color: response_body['color'],
        body: response_body
      }
    else
      {
        code: response.code,
        color: 'error',
        body: response.body
      }
    end
  end

  def get(relative_url, query_params)
    full_url = ENV['JENKINS_HOST'] + relative_url + query_params
    puts full_url

    ctx = OpenSSL::SSL::SSLContext.new
    ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE

    HTTP.basic_auth(user: ENV['JENKINS_USR'], pass: ENV['JENKINS_PWD'])
        .get(full_url , ssl_context: ctx)

  rescue StandardError => e
    {
      url: full_url,
      error_message: e.message,
      status: 400
    }
  end
end
