class SalaryItem < ActiveRecord::Base
  belongs_to :salary_template
  belongs_to :salary_booking_template
end
