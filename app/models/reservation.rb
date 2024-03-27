class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :check_in_date, :check_out_date, :number, presence:true
    validates :number, length:{minimum: 1}
    validate :is_after_check_in
    validate :is_after_today

    def is_after_today
      if !check_in_date.nil? && check_in_date < Time.zone.today
        errors.add(:check_in_date, 'が本日以降の日付にしてください。')
      end
    end

    def is_after_check_in
      if !check_in_date.nil? && !check_out_date.nil? && check_out_date <= check_in_date
        errors.add(:check_out_date, 'チェックイン日より後の日付にしてください。')
      end
    end

end
