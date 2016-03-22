class Task
  attr_reader :title,
              :description,
              :id,
              :picture

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @picture     = data["picture"]
  end
end
