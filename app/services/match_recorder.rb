class MatchRecorder
  def self.call(params)
    Match.create!(params)
  end
end
