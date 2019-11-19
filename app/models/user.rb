class User < ApplicationRecord
    validates :name, :birthday, presence: true

    def age
        today = Date.today
        today_yday_wleap = Date.leap?(today.year) ? (today.yday - 1) : today.yday
        bday_yday_wleap =
        Date.leap?(birthday.year) ? (birthday.yday - 1) : birthday.yday
        age_years =
        (today.year - birthday.year) -
            (today_yday_wleap >= bday_yday_wleap ? 0 : 1)
        # Range of days between last birthday and today
        last_bday = birthday.next_year(age_years)
        age_days = (last_bday..today).count

        return { years: age_years, days: age_days }
    end

    def next_birthday
        return birthday.next_year(age[:years] + 1)
    end


end
