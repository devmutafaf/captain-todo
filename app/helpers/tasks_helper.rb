module TasksHelper
  def badge_class status
    status.eql?("complete") ? "bg-success" : "bg-danger"
  end
end
