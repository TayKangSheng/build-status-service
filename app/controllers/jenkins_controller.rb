# JenkinsController
class JenkinsController < ApplicationController
  def index
    unless params[:job]
      render json: { error: 'query parameter `job` not found' }, status: 400
      return
    end

    status = jenkins_api_service.get_build_status(params[:job])

    send_file get_image(status[:color]), type: 'image/png', disposition: 'inline'
  end

  private

  def get_image(color)
    puts "COLOR:: #{color}"
    case color
      when 'blue'
        Rails.root.join('public', 'build-passing.png')
      when 'red'
        Rails.root.join('public', 'build-failure.png')
      else
        Rails.root.join('public', 'build-error.png')
    end
  end

  def jenkins_api_service
    @jenkins_api_service ||= JenkinsApiService.new
  end
end
