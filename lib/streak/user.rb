module Streak
  class User < StreakObject
    def self.me
      res = Streak.request(:get, "/v1/users/me")
      convert_to_streak_object(res, User)
    end

    def self.find(key)
      res = Streak.request(:get, "/v1/users/#{key}")
      convert_to_streak_object(res, User)
    end

    def self.my_teams
      res = Streak.request(:get, "/v2/users/me/teams")
      convert_to_streak_object(res, User)
    end
  end
end

