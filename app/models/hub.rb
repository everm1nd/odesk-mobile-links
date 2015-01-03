class Hub < ActiveRecord::Base
  has_many :links

  def links=(*args)
    if args.count == 1 and args.first.is_a?(String)
      # TODO: parse string here
    else
      super(*args)
    end
  end
end
