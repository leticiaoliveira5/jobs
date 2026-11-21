class TabsComponent < ViewComponent::Base
  renders_many :tabs, 'TabComponent'

  class TabComponent < ViewComponent::Base
    attr_reader :id, :title

    def initialize(id:, title:)
      super()
      @id = id
      @title = title
    end

    def call
      content
    end
  end
end
