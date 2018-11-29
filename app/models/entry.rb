class Entry < ActiveRecord::Base

  belongs_to :log

  def user
    self.log.user
  end

end