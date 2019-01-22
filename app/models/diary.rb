class Diary < ApplicationRecord
	validates :title, presence: true, length: { maximum: 255}
	validates :body, presence: true, length: { maximum: 10_000}
	validate :proper_title_and_body

	private

	def proper_title_and_body
		unless title.start_with?('今日')
			errors.add(:title, 'は「今日」から始めて下さい。')
		end
		unless body.end_with?('。')
			errors.add(:body, 'は「。」で終わって下さい。')
		end
	end
end
