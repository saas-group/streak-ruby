module Streak
  class Team < StreakObject
    def self.find(key)
      res = Streak.request(:get, "/v2/teams/#{key}")
      convert_to_streak_object(res, Team)
    end
  end
end

