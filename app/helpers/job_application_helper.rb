module JobApplicationHelper
  include Devise::Controllers::Helpers

  def job_application_status_tag(status)
    color = { declined: 'bg-danger', accepted: 'bg-success', waiting: 'bg-secondary' }

    tag.span(t(".job_applications.status.#{status}"), class: "tag #{color[status.to_sym]}")
  end
end
