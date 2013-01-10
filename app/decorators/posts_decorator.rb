class PostsDecorator < Draper::Base
  decorates :post

  def group_name
    model.agent_group ? model.agent_group.name : ''
  end

  def category_name
    model.agent_category ? model.agent_category.name : ''
  end

  def author
    {}
  end

  def comments
    []
  end

  def as_json
    {
      :id => model.id,
      :author => model.user.firstname,
      :status => model.status,
      :avarta => model.user.avatar.url(:thumb),
      :comments => comments
    }
  end
end
