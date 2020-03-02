class MovieWithHomemadeAttributes

  def initialize(id)
    @id = id
  end

  def read_attribute(attr)
    raw_row = ActiveRecord::Base.connection.execute(
      "select * from movies where id=#{@id}"
    ).first

    raw_row[attr.to_s]
  end

  [:title, :plot_keywords].each do |method|
    define_method(method) do
      read_attribute(method)
    end
  end
end
