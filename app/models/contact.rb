class Contact < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy

  def filter_by_history(conversations)
    @conversations = conversations.reject {|conversation| conversation.history == true }
  end

end
