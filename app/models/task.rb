class Task
  attr_reader :title,
              :description,
              :id,
              :image

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @image       = data["image"]
  end
end
