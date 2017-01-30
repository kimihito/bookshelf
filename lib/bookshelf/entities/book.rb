class Book < Hanami::Entity
  VALID_STATUSES = {
    unread: 'unread',
    reading: 'reading',
    read: 'read'
  }.freeze
end
