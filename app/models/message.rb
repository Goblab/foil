class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :from, type: Array
  field :to, type: Array
  field :subject
  field :content
  # TODO: tags!

  has_and_belongs_to_many :senders, class_name: 'Space', inverse_of: :sent_messages
  has_and_belongs_to_many :receivers, class_name: 'Space', inverse_of: :received_messages

  has_many :forwards, class_name: 'Message', inverse_of: :forward_of
  belongs_to :forward_of, class_name: 'Message', inverse_of: :forwards
  
  has_many :replies, class_name: 'Message', inverse_of: :reply_to
  belongs_to :reply_to, class_name: 'Message', inverse_of: :replies
end
