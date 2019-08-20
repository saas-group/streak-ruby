module Streak
  class Box < StreakObject
    def self.all(pipeline_key=nil, params={})
      path = pipeline_key ? "/v1/pipelines/#{pipeline_key}/boxes" : "/boxes"
      res = Streak.request(:get, path, params)
      convert_to_streak_object(res, Box)
    end

    def self.find(key)
      res = Streak.request(:get, "/v1/boxes/#{key}")
      convert_to_streak_object(res, Box)
    end

    def self.create(pipeline_key, params={})
      res = Streak.request(:put, "/v1/pipelines/#{pipeline_key}/boxes", params)
      convert_to_streak_object(res, Box)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/v1/boxes/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Box)
    end

    def self.destroy(key)
      res = Streak.request(:delete, "/v1/boxes/#{key}")
    end
  end
end
