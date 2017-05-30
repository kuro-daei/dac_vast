class Cuepoint < ApplicationRecord
    has_and_belongs_to_many :campaigns
end
