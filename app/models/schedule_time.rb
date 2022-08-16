# frozen_string_literal: true

class ScheduleTime < ApplicationRecord
    validates :Book_Or_Author_Name, presence: true
end
