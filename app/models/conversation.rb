class Conversation < ApplicationRecord
  belongs_to :contact

  def conversation_completed?
    !completed_at.blank?
  end
end
