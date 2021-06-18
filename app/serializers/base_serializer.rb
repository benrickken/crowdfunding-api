class BaseSerializer
  def self.as_json_all(records)
    records.map { |record| new(record).as_json }
  end
end
