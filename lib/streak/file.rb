module Streak
  class File < StreakObject
    def self.all(box_key)
      res = Streak.request(:get, "/v1/boxes/#{box_key}/files")
      convert_to_streak_object(res, File)
    end

    def self.get_link(file_key)
      res = Streak.request(:get, "/v1/files/#{file_key}/link")
      convert_to_streak_object(res, File)
    end

    def self.get_content(file_key)
      res = Streak.request(:get, "/v1/files/#{file_key}/contents")
      convert_to_streak_object(res, File)
    end
  end
end
