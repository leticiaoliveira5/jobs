class SearchComponent < ViewComponent::Base
  def initialize(path:, search_param:, required: false)
    super()
    @path = path
    @search_param = search_param
    @required = required
  end
end
