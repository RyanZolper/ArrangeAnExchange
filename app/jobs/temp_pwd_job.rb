class TempPwdJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    if user.changedpwd != true
      user.destroy
    end
  end
end
