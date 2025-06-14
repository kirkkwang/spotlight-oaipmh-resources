module Spotlight
  ##
  # Notify the curator that we're finished processing a
  # batch upload
  class HarvestingCompleteMailer < ActionMailer::Base
    def harvest_set_completed(job)
      @set = job.harvester_set
      @exhibit = job.exhibit
      @total_errors = job.total_errors
      @total_warnings = job.total_warnings
      @user = job.user
      subject = "Harvesting complete for #{@set}"
      subject += " with harvesting #{@total_errors} #{'error'.pluralize(@total_errors)}" if @total_errors.positive?
      mail(to: @user.email, from: 'oaiharvester@noreply.com', subject: subject)
    end
  end
end
