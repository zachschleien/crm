class Contact < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy

  def self.filter_by_history(conversations)
    conversations.where(history: false)
    # @conversations = conversations.select {|conversation| conversation.history == false }
  end

  def self.filter_by_history_false(conversations)
    conversations.where(history: true)
    # @conversations = conversations.select {|conversation| conversation.history == true }
  end

end
