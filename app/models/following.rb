class Following < ApplicationRecord
    has_many :follows
    self.table_name = 'users'
end
