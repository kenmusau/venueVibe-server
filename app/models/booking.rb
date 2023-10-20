class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :client
  has_many :payments

  # validate :no_date_before_today
  # validate :check_time_difference

  # def no_date_before_today
  #   errors.add(:check_in, "Check-in date cannot be before today") if check_in && check_in < DateTime.now
  # end

  # def check_time_difference
  #   if check_in && check_out && (check_out - check_in < 60.minutes)
  #     errors.add(:check_out, "Check-out time should be at least 30 minutes after check-in time")
  #   end
  # end
end
