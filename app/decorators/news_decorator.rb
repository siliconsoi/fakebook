class NewsDecorator < Draper::Base
  decorates :news

  def group_name
    model.agent_group ? model.agent_group.name : ''
  end

  def category_name
    model.agent_category ? model.agent_category.name : ''
  end

end
