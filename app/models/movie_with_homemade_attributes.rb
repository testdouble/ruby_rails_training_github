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

  def method_missing(method, *args, &block)
    if [:title, :plot_keywords].include?(method)
      read_attribute(method)
    else
      super
    end
  end

  def respond_to?(sym)
    [:title, :plot_keywords].include?(method) || super
  end
end
