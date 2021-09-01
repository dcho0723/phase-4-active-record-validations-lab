class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_validation



    def title_validation
        unless title.present? && title.match?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "some weird click bait here though")
        end
    end

end
