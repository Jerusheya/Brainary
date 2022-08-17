# frozen_string_literal: true

class DonateBook < ApplicationRecord
    validates :user_name, format: { without: /\s/, message: "name must contain no spaces" }
    validates :mobile,   :presence => {:message => 'mobile number invalid'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }
end
