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

    def self.create(pipeline_key, params={}, api_key=nil)
      res = Streak.request(:post, "/v2/pipelines/#{pipeline_key}/boxes",  MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Box)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v1/boxes/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Box)
    end

    def self.destroy(key, api_key=nil)
      res = Streak.request(:delete, "/v1/boxes/#{key}", {}, api_key)
    end
  end
end
