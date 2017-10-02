# JenkinsController
class JenkinsController < ApplicationController
  def index
    unless params[:job]
      render json: { error: 'query parameter `job` not found' }, status: 400
      return
    end

    response = jenkins_api_service.get_build_status(params[:job])
    render json: response, status: (response[:status] || 200)
  end

  def jenkins_api_service
    @jenkins_api_service ||= JenkinsApiService.new
  end
end
